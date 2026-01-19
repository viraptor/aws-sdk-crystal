require "json"
require "time"

module AwsSdk
  module PinpointSMSVoiceV2
    module Types

      # The request was denied because you don't have sufficient permissions to access the resource.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Displays the attributes associated with a single Amazon Web Services account.
      struct AccountAttribute
        include JSON::Serializable

        # The name of the account attribute.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The value associated with the account attribute name.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The current resource quotas associated with an Amazon Web Services account.
      struct AccountLimit
        include JSON::Serializable

        # The Amazon Web Services set limit for that resource type, in US dollars.
        @[JSON::Field(key: "Max")]
        getter max : Int64

        # The name of the attribute to apply the account limit to.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The current amount that has been spent, in US dollars.
        @[JSON::Field(key: "Used")]
        getter used : Int64

        def initialize(
          @max : Int64,
          @name : String,
          @used : Int64
        )
        end
      end

      struct AssociateOriginationIdentityRequest
        include JSON::Serializable

        # The new two-character code, in ISO 3166-1 alpha-2 format, for the country or region of the
        # origination identity.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The origination identity to use, such as PhoneNumberId, PhoneNumberArn, SenderId, or SenderIdArn.
        # You can use DescribePhoneNumbers to find the values for PhoneNumberId and PhoneNumberArn, while
        # DescribeSenderIds can be used to get the values for SenderId and SenderIdArn. If you are using a
        # shared End User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The pool to update with the new Identity. This value can be either the PoolId or PoolArn, and you
        # can find these values using DescribePools . If you are using a shared End User Messaging SMS;
        # resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @iso_country_code : String,
          @origination_identity : String,
          @pool_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct AssociateOriginationIdentityResult
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The PhoneNumberId or SenderId of the origination identity.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The PhoneNumberArn or SenderIdArn of the origination identity.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String?

        # The Amazon Resource Name (ARN) of the pool that is now associated with the origination identity.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The PoolId of the pool that is now associated with the origination identity.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        def initialize(
          @iso_country_code : String? = nil,
          @origination_identity : String? = nil,
          @origination_identity_arn : String? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil
        )
        end
      end

      struct AssociateProtectConfigurationRequest
        include JSON::Serializable

        # The name of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @configuration_set_name : String,
          @protect_configuration_id : String
        )
        end
      end

      struct AssociateProtectConfigurationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String

        # The name of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @configuration_set_arn : String,
          @configuration_set_name : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct CarrierLookupRequest
        include JSON::Serializable

        # The phone number that you want to retrieve information about. You can provide the phone number in
        # various formats including special characters such as parentheses, brackets, spaces, hyphens,
        # periods, and commas. The service automatically converts the input to E164 format for processing.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        def initialize(
          @phone_number : String
        )
        end
      end

      struct CarrierLookupResult
        include JSON::Serializable

        # The phone number in E164 format, sanitized from the original input by removing any formatting
        # characters.
        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String

        # Describes the type of phone number. Valid values are: MOBILE, LANDLINE, OTHER, and INVALID. Avoid
        # sending SMS or voice messages to INVALID phone numbers, as these numbers are unlikely to belong to
        # actual recipients.
        @[JSON::Field(key: "PhoneNumberType")]
        getter phone_number_type : String

        # The carrier or service provider that the phone number is currently registered with. In some
        # countries and regions, this value may be the carrier or service provider that the phone number was
        # originally registered with.
        @[JSON::Field(key: "Carrier")]
        getter carrier : String?

        # The name of the country or region for the phone number.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # The country or region numeric dialing code for the phone number.
        @[JSON::Field(key: "DialingCountryCode")]
        getter dialing_country_code : String?

        # The two-character country or region code, in ISO 3166-1 alpha-2 format, for the phone number.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The phone number's mobile country code, for mobile phone number types
        @[JSON::Field(key: "MCC")]
        getter mcc : String?

        # The phone number's mobile network code, for mobile phone number types.
        @[JSON::Field(key: "MNC")]
        getter mnc : String?

        def initialize(
          @e164_phone_number : String,
          @phone_number_type : String,
          @carrier : String? = nil,
          @country : String? = nil,
          @dialing_country_code : String? = nil,
          @iso_country_code : String? = nil,
          @mcc : String? = nil,
          @mnc : String? = nil
        )
        end
      end

      # Contains the destination configuration to use when publishing message sending events.
      struct CloudWatchLogsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Identity and Access Management role that is able to write event
        # data to an Amazon CloudWatch destination.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The name of the Amazon CloudWatch log group that you want to record events in.
        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String

        def initialize(
          @iam_role_arn : String,
          @log_group_arn : String
        )
        end
      end

      # The information for configuration sets that meet a specified criteria.
      struct ConfigurationSetFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Information related to a given configuration set in your Amazon Web Services account.
      struct ConfigurationSetInformation
        include JSON::Serializable

        # The Resource Name (ARN) of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String

        # The name of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The time when the ConfigurationSet was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # An array of EventDestination objects that describe any events to log and where to log them.
        @[JSON::Field(key: "EventDestinations")]
        getter event_destinations : Array(Types::EventDestination)

        # True if message feedback is enabled.
        @[JSON::Field(key: "DefaultMessageFeedbackEnabled")]
        getter default_message_feedback_enabled : Bool?

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "DefaultMessageType")]
        getter default_message_type : String?

        # The default sender ID used by the ConfigurationSet.
        @[JSON::Field(key: "DefaultSenderId")]
        getter default_sender_id : String?

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String?

        def initialize(
          @configuration_set_arn : String,
          @configuration_set_name : String,
          @created_timestamp : Time,
          @event_destinations : Array(Types::EventDestination),
          @default_message_feedback_enabled : Bool? = nil,
          @default_message_type : String? = nil,
          @default_sender_id : String? = nil,
          @protect_configuration_id : String? = nil
        )
        end
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time or it could be that the requested action isn't valid
      # for the current state or configuration of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The unique identifier of the request.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource that caused the exception.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct CreateConfigurationSetRequest
        include JSON::Serializable

        # The name to use for the new configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of key and value pair tags that's associated with the new configuration set.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_set_name : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConfigurationSetResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the new configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The time when the configuration set was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # An array of key and value pair tags that's associated with the configuration set.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @created_timestamp : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateEventDestinationRequest
        include JSON::Serializable

        # Either the name of the configuration set or the configuration set ARN to apply event logging to. The
        # ConfigurateSetName and ConfigurationSetArn can be found using the DescribeConfigurationSets action.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The name that identifies the event destination.
        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        # An array of event types that determine which events to log. If "ALL" is used, then End User
        # Messaging SMS logs every event type. The TEXT_SENT event type is not supported.
        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An object that contains information about an event destination for logging to Amazon CloudWatch
        # Logs.
        @[JSON::Field(key: "CloudWatchLogsDestination")]
        getter cloud_watch_logs_destination : Types::CloudWatchLogsDestination?

        # An object that contains information about an event destination for logging to Amazon Data Firehose.
        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An object that contains information about an event destination for logging to Amazon SNS.
        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @configuration_set_name : String,
          @event_destination_name : String,
          @matching_event_types : Array(String),
          @client_token : String? = nil,
          @cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      struct CreateEventDestinationResult
        include JSON::Serializable

        # The ARN of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The details of the destination where events are logged.
        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestination?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @event_destination : Types::EventDestination? = nil
        )
        end
      end

      struct CreateOptOutListRequest
        include JSON::Serializable

        # The name of the new OptOutList.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of tags (key and value pairs) to associate with the new OptOutList.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @opt_out_list_name : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateOptOutListResult
        include JSON::Serializable

        # The time when the pool was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The Amazon Resource Name (ARN) for the OptOutList.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String?

        # The name of the new OptOutList.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # An array of tags (key and value pairs) associated with the new OptOutList.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_timestamp : Time? = nil,
          @opt_out_list_arn : String? = nil,
          @opt_out_list_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePoolRequest
        include JSON::Serializable

        # The new two-character code, in ISO 3166-1 alpha-2 format, for the country or region of the new pool.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive. After the pool is created the
        # MessageType can't be changed.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String

        # The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or SenderIdArn.
        # You can use DescribePhoneNumbers to find the values for PhoneNumberId and PhoneNumberArn, and use
        # DescribeSenderIds can be used to get the values for SenderId and SenderIdArn. After the pool is
        # created you can add more origination identities to the pool by using AssociateOriginationIdentity .
        # If you are using a shared End User Messaging SMS resource then you must use the full Amazon Resource
        # Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # By default this is set to false. When set to true the pool can't be deleted. You can change this
        # value using the UpdatePool action.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # An array of tags (key and value pairs) associated with the pool.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @iso_country_code : String,
          @message_type : String,
          @origination_identity : String,
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePoolResult
        include JSON::Serializable

        # The time when the pool was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # When set to true deletion protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The type of message for the pool to use.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The name of the OptOutList associated with the pool.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The Amazon Resource Name (ARN) for the pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The unique identifier for the pool.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # By default this is set to false. When set to false, and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # Indicates whether shared routes are enabled for the pool. Set to false and only origination
        # identities in this pool are used to send messages.
        @[JSON::Field(key: "SharedRoutesEnabled")]
        getter shared_routes_enabled : Bool?

        # The current status of the pool. CREATING: The pool is currently being created and isn't yet
        # available for use. ACTIVE: The pool is active and available for use. DELETING: The pool is being
        # deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # An array of tags (key and value pairs) associated with the pool.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @message_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @shared_routes_enabled : Bool? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct CreateProtectConfigurationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # When set to true deletion protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # An array of key and value pair tags that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProtectConfigurationResult
        include JSON::Serializable

        # This is true if the protect configuration is set as your account default protect configuration.
        @[JSON::Field(key: "AccountDefault")]
        getter account_default : Bool

        # The time when the protect configuration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # When set to true deletion protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # An array of key and value pair tags that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_default : Bool,
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @protect_configuration_arn : String,
          @protect_configuration_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRegistrationAssociationRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The unique identifier for the origination identity. For example this could be a PhoneNumberId or
        # SenderId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @registration_id : String,
          @resource_id : String
        )
        end
      end

      struct CreateRegistrationAssociationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The Amazon Resource Name (ARN) of the origination identity that is associated with the registration.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The unique identifier for the origination identity. For example this could be a PhoneNumberId or
        # SenderId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The registration type or origination identity type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The phone number associated with the registration in E.164 format.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @registration_arn : String,
          @registration_id : String,
          @registration_type : String,
          @resource_arn : String,
          @resource_id : String,
          @resource_type : String,
          @iso_country_code : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      struct CreateRegistrationAttachmentRequest
        include JSON::Serializable

        # The registration file to upload. The maximum file size is 500KB and valid file extensions are PDF,
        # JPEG and PNG.
        @[JSON::Field(key: "AttachmentBody")]
        getter attachment_body : Bytes?

        # Registration files have to be stored in an Amazon S3 bucket. The URI to use when sending is in the
        # format s3://BucketName/FileName .
        @[JSON::Field(key: "AttachmentUrl")]
        getter attachment_url : String?

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of tags (key and value pairs) to associate with the registration attachment.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @attachment_body : Bytes? = nil,
          @attachment_url : String? = nil,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRegistrationAttachmentResult
        include JSON::Serializable

        # The status of the registration attachment. UPLOAD_IN_PROGRESS The attachment is being uploaded.
        # UPLOAD_COMPLETE The attachment has been uploaded. UPLOAD_FAILED The attachment failed to uploaded.
        # DELETED The attachment has been deleted..
        @[JSON::Field(key: "AttachmentStatus")]
        getter attachment_status : String

        # The time when the registration attachment was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The Amazon Resource Name (ARN) for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentArn")]
        getter registration_attachment_arn : String

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String

        # An array of tags (key and value pairs) to associate with the registration attachment.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @attachment_status : String,
          @created_timestamp : Time,
          @registration_attachment_arn : String,
          @registration_attachment_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRegistrationRequest
        include JSON::Serializable

        # The type of registration form to create. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of tags (key and value pairs) to associate with the registration.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @registration_type : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRegistrationResult
        include JSON::Serializable

        # The time when the registration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The current version number of the registration.
        @[JSON::Field(key: "CurrentVersionNumber")]
        getter current_version_number : Int64

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration. CLOSED : The phone number or sender ID has been deleted and you must
        # also delete the registration for the number. CREATED : Your registration is created but not
        # submitted. COMPLETE : Your registration has been approved and your origination identity has been
        # created. DELETED : The registration has been deleted. PROVISIONING : Your registration has been
        # approved and your origination identity is being created. REQUIRES_AUTHENTICATION : You need to
        # complete email authentication. REQUIRES_UPDATES : You must fix your registration and resubmit it.
        # REVIEWING : Your registration has been accepted and is being reviewed. SUBMITTED : Your registration
        # has been submitted and is awaiting review.
        @[JSON::Field(key: "RegistrationStatus")]
        getter registration_status : String

        # The type of registration form to create. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # Metadata about a given registration which is specific to that registration type.
        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Hash(String, String)?

        # An array of tags (key and value pairs) to associate with the registration.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_timestamp : Time,
          @current_version_number : Int64,
          @registration_arn : String,
          @registration_id : String,
          @registration_status : String,
          @registration_type : String,
          @additional_attributes : Hash(String, String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRegistrationVersionRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        def initialize(
          @registration_id : String
        )
        end
      end

      struct CreateRegistrationVersionResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration. APPROVED : Your registration has been approved. ARCHIVED : Your
        # previously approved registration version moves into this status when a more recently submitted
        # version is approved. DENIED : You must fix your registration and resubmit it. DISCARDED : You've
        # abandon this version of their registration to start over with a new version. DRAFT : The initial
        # status of a registration version after it’s created. REQUIRES_AUTHENTICATION : You need to complete
        # email authentication. REVIEWING : Your registration has been accepted and is being reviewed. REVOKED
        # : Your previously approved registration has been revoked. SUBMITTED : Your registration has been
        # submitted.
        @[JSON::Field(key: "RegistrationVersionStatus")]
        getter registration_version_status : String

        # A RegistrationVersionStatusHistory object that contains timestamps for the registration.
        @[JSON::Field(key: "RegistrationVersionStatusHistory")]
        getter registration_version_status_history : Types::RegistrationVersionStatusHistory

        # The new version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @registration_arn : String,
          @registration_id : String,
          @registration_version_status : String,
          @registration_version_status_history : Types::RegistrationVersionStatusHistory,
          @version_number : Int64
        )
        end
      end

      struct CreateVerifiedDestinationNumberRequest
        include JSON::Serializable

        # The verified destination phone number, in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of tags (key and value pairs) to associate with the destination number.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination_phone_number : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVerifiedDestinationNumberResult
        include JSON::Serializable

        # The time when the verified phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The verified destination phone number, in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The status of the verified destination phone number. PENDING : The phone number hasn't been verified
        # yet. VERIFIED : The phone number is verified and can receive messages.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Amazon Resource Name (ARN) for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberArn")]
        getter verified_destination_number_arn : String

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        # An array of tags (key and value pairs) to associate with the destination number.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_timestamp : Time,
          @destination_phone_number : String,
          @status : String,
          @verified_destination_number_arn : String,
          @verified_destination_number_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct DeleteAccountDefaultProtectConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAccountDefaultProtectConfigurationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the account default protect configuration.
        @[JSON::Field(key: "DefaultProtectConfigurationArn")]
        getter default_protect_configuration_arn : String

        # The unique identifier of the account default protect configuration.
        @[JSON::Field(key: "DefaultProtectConfigurationId")]
        getter default_protect_configuration_id : String

        def initialize(
          @default_protect_configuration_arn : String,
          @default_protect_configuration_id : String
        )
        end
      end

      struct DeleteConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set or the configuration set ARN that you want to delete. The
        # ConfigurationSetName and ConfigurationSetArn can be found using the DescribeConfigurationSets
        # action.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      struct DeleteConfigurationSetResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the deleted configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The time that the deleted configuration set was created in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # True if the configuration set has message feedback enabled. By default this is set to false.
        @[JSON::Field(key: "DefaultMessageFeedbackEnabled")]
        getter default_message_feedback_enabled : Bool?

        # The default message type of the configuration set that was deleted.
        @[JSON::Field(key: "DefaultMessageType")]
        getter default_message_type : String?

        # The default Sender ID of the configuration set that was deleted.
        @[JSON::Field(key: "DefaultSenderId")]
        getter default_sender_id : String?

        # An array of any EventDestination objects that were associated with the deleted configuration set.
        @[JSON::Field(key: "EventDestinations")]
        getter event_destinations : Array(Types::EventDestination)?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @created_timestamp : Time? = nil,
          @default_message_feedback_enabled : Bool? = nil,
          @default_message_type : String? = nil,
          @default_sender_id : String? = nil,
          @event_destinations : Array(Types::EventDestination)? = nil
        )
        end
      end

      struct DeleteDefaultMessageTypeRequest
        include JSON::Serializable

        # The name of the configuration set or the configuration set Amazon Resource Name (ARN) to delete the
        # default message type from. The ConfigurationSetName and ConfigurationSetArn can be found using the
        # DescribeConfigurationSets action.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      struct DeleteDefaultMessageTypeResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The current message type for the configuration set.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @message_type : String? = nil
        )
        end
      end

      struct DeleteDefaultSenderIdRequest
        include JSON::Serializable

        # The name of the configuration set or the configuration set Amazon Resource Name (ARN) to delete the
        # default sender ID from. The ConfigurationSetName and ConfigurationSetArn can be found using the
        # DescribeConfigurationSets action.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      struct DeleteDefaultSenderIdResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The current sender ID for the configuration set.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @sender_id : String? = nil
        )
        end
      end

      struct DeleteEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set or the configuration set's Amazon Resource Name (ARN) to remove
        # the event destination from. The ConfigurateSetName and ConfigurationSetArn can be found using the
        # DescribeConfigurationSets action.
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

      struct DeleteEventDestinationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set the event destination was deleted from.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The event destination object that was deleted.
        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestination?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @event_destination : Types::EventDestination? = nil
        )
        end
      end

      struct DeleteKeywordRequest
        include JSON::Serializable

        # The keyword to delete.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String

        # The origination identity to use such as a PhoneNumberId, PhoneNumberArn, PoolId or PoolArn. You can
        # use DescribePhoneNumbers to find the values for PhoneNumberId and PhoneNumberArn and DescribePools
        # to find the values of PoolId and PoolArn. If you are using a shared End User Messaging SMS resource
        # then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        def initialize(
          @keyword : String,
          @origination_identity : String
        )
        end
      end

      struct DeleteKeywordResult
        include JSON::Serializable

        # The keyword that was deleted.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String?

        # The action that was associated with the deleted keyword.
        @[JSON::Field(key: "KeywordAction")]
        getter keyword_action : String?

        # The message that was associated with the deleted keyword.
        @[JSON::Field(key: "KeywordMessage")]
        getter keyword_message : String?

        # The PhoneNumberId or PoolId that the keyword was associated with.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The PhoneNumberArn or PoolArn that the keyword was associated with.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String?

        def initialize(
          @keyword : String? = nil,
          @keyword_action : String? = nil,
          @keyword_message : String? = nil,
          @origination_identity : String? = nil,
          @origination_identity_arn : String? = nil
        )
        end
      end

      struct DeleteMediaMessageSpendLimitOverrideRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteMediaMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit, in US dollars.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      struct DeleteOptOutListRequest
        include JSON::Serializable

        # The OptOutListName or OptOutListArn of the OptOutList to delete. You can use DescribeOptOutLists to
        # find the values for OptOutListName and OptOutListArn. If you are using a shared End User Messaging
        # SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        def initialize(
          @opt_out_list_name : String
        )
        end
      end

      struct DeleteOptOutListResult
        include JSON::Serializable

        # The time when the OptOutList was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The Amazon Resource Name (ARN) of the OptOutList that was removed.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String?

        # The name of the OptOutList that was removed.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @opt_out_list_arn : String? = nil,
          @opt_out_list_name : String? = nil
        )
        end
      end

      struct DeleteOptedOutNumberRequest
        include JSON::Serializable

        # The OptOutListName or OptOutListArn to remove the phone number from. If you are using a shared End
        # User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # The phone number, in E.164 format, to remove from the OptOutList.
        @[JSON::Field(key: "OptedOutNumber")]
        getter opted_out_number : String

        def initialize(
          @opt_out_list_name : String,
          @opted_out_number : String
        )
        end
      end

      struct DeleteOptedOutNumberResult
        include JSON::Serializable

        # This is true if it was the end user who requested their phone number be removed.
        @[JSON::Field(key: "EndUserOptedOut")]
        getter end_user_opted_out : Bool?

        # The OptOutListArn that the phone number was removed from.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String?

        # The OptOutListName that the phone number was removed from.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The phone number that was removed from the OptOutList.
        @[JSON::Field(key: "OptedOutNumber")]
        getter opted_out_number : String?

        # The time that the number was removed at, in UNIX epoch time format.
        @[JSON::Field(key: "OptedOutTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter opted_out_timestamp : Time?

        def initialize(
          @end_user_opted_out : Bool? = nil,
          @opt_out_list_arn : String? = nil,
          @opt_out_list_name : String? = nil,
          @opted_out_number : String? = nil,
          @opted_out_timestamp : Time? = nil
        )
        end
      end

      struct DeletePoolRequest
        include JSON::Serializable

        # The PoolId or PoolArn of the pool to delete. You can use DescribePools to find the values for PoolId
        # and PoolArn . If you are using a shared End User Messaging SMS resource then you must use the full
        # Amazon Resource Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        def initialize(
          @pool_id : String
        )
        end
      end

      struct DeletePoolResult
        include JSON::Serializable

        # The time when the pool was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The message type that was associated with the deleted pool.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The name of the OptOutList that was associated with the deleted pool.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The Amazon Resource Name (ARN) of the pool that was deleted.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The PoolId of the pool that was deleted.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # By default this is set to false. When set to false and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # Indicates whether shared routes are enabled for the pool.
        @[JSON::Field(key: "SharedRoutesEnabled")]
        getter shared_routes_enabled : Bool?

        # The current status of the pool. CREATING: The pool is currently being created and isn't yet
        # available for use. ACTIVE: The pool is active and available for use. DELETING: The pool is being
        # deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the TwoWayChannel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @message_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @shared_routes_enabled : Bool? = nil,
          @status : String? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct DeleteProtectConfigurationRequest
        include JSON::Serializable

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @protect_configuration_id : String
        )
        end
      end

      struct DeleteProtectConfigurationResult
        include JSON::Serializable

        # This is true if the protect configuration is set as your account default protect configuration.
        @[JSON::Field(key: "AccountDefault")]
        getter account_default : Bool

        # The time when the protect configuration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The status of deletion protection for the protect configuration. When set to true deletion
        # protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @account_default : Bool,
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct DeleteProtectConfigurationRuleSetNumberOverrideRequest
        include JSON::Serializable

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @destination_phone_number : String,
          @protect_configuration_id : String
        )
        end
      end

      struct DeleteProtectConfigurationRuleSetNumberOverrideResult
        include JSON::Serializable

        # The action associated with the rule.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The time when the rule was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # The time when the resource-based policy was created, in UNIX epoch time format.
        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        def initialize(
          @action : String,
          @created_timestamp : Time,
          @destination_phone_number : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String,
          @expiration_timestamp : Time? = nil,
          @iso_country_code : String? = nil
        )
        end
      end

      struct DeleteRegistrationAttachmentRequest
        include JSON::Serializable

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String

        def initialize(
          @registration_attachment_id : String
        )
        end
      end

      struct DeleteRegistrationAttachmentResult
        include JSON::Serializable

        # The status of the registration attachment. UPLOAD_IN_PROGRESS The attachment is being uploaded.
        # UPLOAD_COMPLETE The attachment has been uploaded. UPLOAD_FAILED The attachment failed to uploaded.
        # DELETED The attachment has been deleted..
        @[JSON::Field(key: "AttachmentStatus")]
        getter attachment_status : String

        # The time when the registration attachment was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The Amazon Resource Name (ARN) for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentArn")]
        getter registration_attachment_arn : String

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String

        # The error message if the upload failed.
        @[JSON::Field(key: "AttachmentUploadErrorReason")]
        getter attachment_upload_error_reason : String?

        def initialize(
          @attachment_status : String,
          @created_timestamp : Time,
          @registration_attachment_arn : String,
          @registration_attachment_id : String,
          @attachment_upload_error_reason : String? = nil
        )
        end
      end

      struct DeleteRegistrationFieldValueRequest
        include JSON::Serializable

        # The path to the registration form field. You can use DescribeRegistrationFieldDefinitions for a list
        # of FieldPaths .
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        def initialize(
          @field_path : String,
          @registration_id : String
        )
        end
      end

      struct DeleteRegistrationFieldValueResult
        include JSON::Serializable

        # The path to the registration form field.
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String?

        # An array of values for the form field.
        @[JSON::Field(key: "SelectChoices")]
        getter select_choices : Array(String)?

        # The text data for a free form field.
        @[JSON::Field(key: "TextValue")]
        getter text_value : String?

        def initialize(
          @field_path : String,
          @registration_arn : String,
          @registration_id : String,
          @version_number : Int64,
          @registration_attachment_id : String? = nil,
          @select_choices : Array(String)? = nil,
          @text_value : String? = nil
        )
        end
      end

      struct DeleteRegistrationRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        def initialize(
          @registration_id : String
        )
        end
      end

      struct DeleteRegistrationResult
        include JSON::Serializable

        # The time when the registration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The current version number of the registration.
        @[JSON::Field(key: "CurrentVersionNumber")]
        getter current_version_number : Int64

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration. CLOSED : The phone number or sender ID has been deleted and you must
        # also delete the registration for the number. CREATED : Your registration is created but not
        # submitted. COMPLETE : Your registration has been approved and your origination identity has been
        # created. DELETED : The registration has been deleted. PROVISIONING : Your registration has been
        # approved and your origination identity is being created. REQUIRES_AUTHENTICATION : You need to
        # complete email authentication. REQUIRES_UPDATES : You must fix your registration and resubmit it.
        # REVIEWING : Your registration has been accepted and is being reviewed. SUBMITTED : Your registration
        # has been submitted and is awaiting review.
        @[JSON::Field(key: "RegistrationStatus")]
        getter registration_status : String

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # Metadata about a given registration which is specific to that registration type.
        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Hash(String, String)?

        # The version number of the registration that was approved.
        @[JSON::Field(key: "ApprovedVersionNumber")]
        getter approved_version_number : Int64?

        # The latest version number of the registration that was denied.
        @[JSON::Field(key: "LatestDeniedVersionNumber")]
        getter latest_denied_version_number : Int64?

        def initialize(
          @created_timestamp : Time,
          @current_version_number : Int64,
          @registration_arn : String,
          @registration_id : String,
          @registration_status : String,
          @registration_type : String,
          @additional_attributes : Hash(String, String)? = nil,
          @approved_version_number : Int64? = nil,
          @latest_denied_version_number : Int64? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource you're deleting the
        # resource-based policy from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResult
        include JSON::Serializable

        # The time when the resource-based policy was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The JSON formatted resource-based policy that was deleted.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource that the resource-based policy
        # was deleted from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct DeleteTextMessageSpendLimitOverrideRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTextMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit, in US dollars.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      struct DeleteVerifiedDestinationNumberRequest
        include JSON::Serializable

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        def initialize(
          @verified_destination_number_id : String
        )
        end
      end

      struct DeleteVerifiedDestinationNumberResult
        include JSON::Serializable

        # The time when the destination phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The verified destination phone number, in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The Amazon Resource Name (ARN) for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberArn")]
        getter verified_destination_number_arn : String

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        def initialize(
          @created_timestamp : Time,
          @destination_phone_number : String,
          @verified_destination_number_arn : String,
          @verified_destination_number_id : String
        )
        end
      end

      struct DeleteVoiceMessageSpendLimitOverrideRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteVoiceMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit, in US dollars.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      struct DescribeAccountAttributesRequest
        include JSON::Serializable

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAccountAttributesResult
        include JSON::Serializable

        # An array of AccountAttributes objects.
        @[JSON::Field(key: "AccountAttributes")]
        getter account_attributes : Array(Types::AccountAttribute)?

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_attributes : Array(Types::AccountAttribute)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAccountLimitsRequest
        include JSON::Serializable

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAccountLimitsResult
        include JSON::Serializable

        # An array of AccountLimit objects that show the current spend limits.
        @[JSON::Field(key: "AccountLimits")]
        getter account_limits : Array(Types::AccountLimit)?

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_limits : Array(Types::AccountLimit)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigurationSetsRequest
        include JSON::Serializable

        # An array of strings. Each element can be either a ConfigurationSetName or ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetNames")]
        getter configuration_set_names : Array(String)?

        # An array of filters to apply to the results that are returned.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ConfigurationSetFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_set_names : Array(String)? = nil,
          @filters : Array(Types::ConfigurationSetFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigurationSetsResult
        include JSON::Serializable

        # An array of ConfigurationSets objects.
        @[JSON::Field(key: "ConfigurationSets")]
        getter configuration_sets : Array(Types::ConfigurationSetInformation)?

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_sets : Array(Types::ConfigurationSetInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeKeywordsRequest
        include JSON::Serializable

        # The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or SenderIdArn.
        # You can use DescribePhoneNumbers to find the values for PhoneNumberId and PhoneNumberArn while
        # DescribeSenderIds can be used to get the values for SenderId and SenderIdArn. If you are using a
        # shared End User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # An array of keyword filters to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::KeywordFilter)?

        # An array of keywords to search for.
        @[JSON::Field(key: "Keywords")]
        getter keywords : Array(String)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @origination_identity : String,
          @filters : Array(Types::KeywordFilter)? = nil,
          @keywords : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeKeywordsResult
        include JSON::Serializable

        # An array of KeywordInformation objects that contain the results.
        @[JSON::Field(key: "Keywords")]
        getter keywords : Array(Types::KeywordInformation)?

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The PhoneNumberId or PoolId that is associated with the OriginationIdentity.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The PhoneNumberArn or PoolArn that is associated with the OriginationIdentity.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String?

        def initialize(
          @keywords : Array(Types::KeywordInformation)? = nil,
          @next_token : String? = nil,
          @origination_identity : String? = nil,
          @origination_identity_arn : String? = nil
        )
        end
      end

      struct DescribeOptOutListsRequest
        include JSON::Serializable

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The OptOutLists to show the details of. This is an array of strings that can be either the
        # OptOutListName or OptOutListArn. If you are using a shared End User Messaging SMS resource then you
        # must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListNames")]
        getter opt_out_list_names : Array(String)?

        # Use SELF to filter the list of Opt-Out List to ones your account owns or use SHARED to filter on
        # Opt-Out List shared with your account. The Owner and OptOutListNames parameters can't be used at the
        # same time.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @opt_out_list_names : Array(String)? = nil,
          @owner : String? = nil
        )
        end
      end

      struct DescribeOptOutListsResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of OptOutListInformation objects that contain the details for the requested OptOutLists.
        @[JSON::Field(key: "OptOutLists")]
        getter opt_out_lists : Array(Types::OptOutListInformation)?

        def initialize(
          @next_token : String? = nil,
          @opt_out_lists : Array(Types::OptOutListInformation)? = nil
        )
        end
      end

      struct DescribeOptedOutNumbersRequest
        include JSON::Serializable

        # The OptOutListName or OptOutListArn of the OptOutList. You can use DescribeOptOutLists to find the
        # values for OptOutListName and OptOutListArn. If you are using a shared End User Messaging SMS
        # resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # An array of OptedOutFilter objects to filter the results on.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OptedOutFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of phone numbers to search for in the OptOutList. If you specify an opted out number that
        # isn't valid, an exception is returned.
        @[JSON::Field(key: "OptedOutNumbers")]
        getter opted_out_numbers : Array(String)?

        def initialize(
          @opt_out_list_name : String,
          @filters : Array(Types::OptedOutFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @opted_out_numbers : Array(String)? = nil
        )
        end
      end

      struct DescribeOptedOutNumbersResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the OptOutList.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String?

        # The name of the OptOutList.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # An array of OptedOutNumbersInformation objects that provide information about the requested
        # OptedOutNumbers.
        @[JSON::Field(key: "OptedOutNumbers")]
        getter opted_out_numbers : Array(Types::OptedOutNumberInformation)?

        def initialize(
          @next_token : String? = nil,
          @opt_out_list_arn : String? = nil,
          @opt_out_list_name : String? = nil,
          @opted_out_numbers : Array(Types::OptedOutNumberInformation)? = nil
        )
        end
      end

      struct DescribePhoneNumbersRequest
        include JSON::Serializable

        # An array of PhoneNumberFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PhoneNumberFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Use SELF to filter the list of phone numbers to ones your account owns or use SHARED to filter on
        # phone numbers shared with your account. The Owner and PhoneNumberIds parameters can't be used at the
        # same time.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The unique identifier of phone numbers to find information about. This is an array of strings that
        # can be either the PhoneNumberId or PhoneNumberArn. If you are using a shared End User Messaging SMS
        # resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PhoneNumberIds")]
        getter phone_number_ids : Array(String)?

        def initialize(
          @filters : Array(Types::PhoneNumberFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil,
          @phone_number_ids : Array(String)? = nil
        )
        end
      end

      struct DescribePhoneNumbersResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of PhoneNumberInformation objects that contain the details for the requested phone numbers.
        @[JSON::Field(key: "PhoneNumbers")]
        getter phone_numbers : Array(Types::PhoneNumberInformation)?

        def initialize(
          @next_token : String? = nil,
          @phone_numbers : Array(Types::PhoneNumberInformation)? = nil
        )
        end
      end

      struct DescribePoolsRequest
        include JSON::Serializable

        # An array of PoolFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PoolFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Use SELF to filter the list of Pools to ones your account owns or use SHARED to filter on Pools
        # shared with your account. The Owner and PoolIds parameters can't be used at the same time.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The unique identifier of pools to find. This is an array of strings that can be either the PoolId or
        # PoolArn. If you are using a shared End User Messaging SMS resource then you must use the full Amazon
        # Resource Name(ARN).
        @[JSON::Field(key: "PoolIds")]
        getter pool_ids : Array(String)?

        def initialize(
          @filters : Array(Types::PoolFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil,
          @pool_ids : Array(String)? = nil
        )
        end
      end

      struct DescribePoolsResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of PoolInformation objects that contain the details for the requested pools.
        @[JSON::Field(key: "Pools")]
        getter pools : Array(Types::PoolInformation)?

        def initialize(
          @next_token : String? = nil,
          @pools : Array(Types::PoolInformation)? = nil
        )
        end
      end

      struct DescribeProtectConfigurationsRequest
        include JSON::Serializable

        # An array of ProtectConfigurationFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ProtectConfigurationFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of protect configuration identifiers to search for.
        @[JSON::Field(key: "ProtectConfigurationIds")]
        getter protect_configuration_ids : Array(String)?

        def initialize(
          @filters : Array(Types::ProtectConfigurationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @protect_configuration_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeProtectConfigurationsResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ProtectConfigurationInformation objects that contain the details for the request.
        @[JSON::Field(key: "ProtectConfigurations")]
        getter protect_configurations : Array(Types::ProtectConfigurationInformation)?

        def initialize(
          @next_token : String? = nil,
          @protect_configurations : Array(Types::ProtectConfigurationInformation)? = nil
        )
        end
      end

      struct DescribeRegistrationAttachmentsRequest
        include JSON::Serializable

        # An array of RegistrationAttachmentFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::RegistrationAttachmentFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifier of registration attachments to find. This is an array of
        # RegistrationAttachmentId .
        @[JSON::Field(key: "RegistrationAttachmentIds")]
        getter registration_attachment_ids : Array(String)?

        def initialize(
          @filters : Array(Types::RegistrationAttachmentFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registration_attachment_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeRegistrationAttachmentsResult
        include JSON::Serializable

        # An array of RegistrationAttachments objects that contain the details for the requested registration
        # attachments.
        @[JSON::Field(key: "RegistrationAttachments")]
        getter registration_attachments : Array(Types::RegistrationAttachmentsInformation)

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_attachments : Array(Types::RegistrationAttachmentsInformation),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationFieldDefinitionsRequest
        include JSON::Serializable

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # An array of paths to the registration form field.
        @[JSON::Field(key: "FieldPaths")]
        getter field_paths : Array(String)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The path to the section of the registration.
        @[JSON::Field(key: "SectionPath")]
        getter section_path : String?

        def initialize(
          @registration_type : String,
          @field_paths : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @section_path : String? = nil
        )
        end
      end

      struct DescribeRegistrationFieldDefinitionsResult
        include JSON::Serializable

        # An array of RegistrationFieldDefinitions objects that contain the details for the requested fields.
        @[JSON::Field(key: "RegistrationFieldDefinitions")]
        getter registration_field_definitions : Array(Types::RegistrationFieldDefinition)

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_field_definitions : Array(Types::RegistrationFieldDefinition),
          @registration_type : String,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationFieldValuesRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # An array of paths to the registration form field.
        @[JSON::Field(key: "FieldPaths")]
        getter field_paths : Array(String)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The path to the section of the registration.
        @[JSON::Field(key: "SectionPath")]
        getter section_path : String?

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64?

        def initialize(
          @registration_id : String,
          @field_paths : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @section_path : String? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      struct DescribeRegistrationFieldValuesResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # An array of RegistrationFieldValues objects that contain the values for the requested registration.
        @[JSON::Field(key: "RegistrationFieldValues")]
        getter registration_field_values : Array(Types::RegistrationFieldValueInformation)

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The current version of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_arn : String,
          @registration_field_values : Array(Types::RegistrationFieldValueInformation),
          @registration_id : String,
          @version_number : Int64,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationSectionDefinitionsRequest
        include JSON::Serializable

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of paths for the registration form section.
        @[JSON::Field(key: "SectionPaths")]
        getter section_paths : Array(String)?

        def initialize(
          @registration_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @section_paths : Array(String)? = nil
        )
        end
      end

      struct DescribeRegistrationSectionDefinitionsResult
        include JSON::Serializable

        # An array of RegistrationSectionDefinition objects.
        @[JSON::Field(key: "RegistrationSectionDefinitions")]
        getter registration_section_definitions : Array(Types::RegistrationSectionDefinition)

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_section_definitions : Array(Types::RegistrationSectionDefinition),
          @registration_type : String,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationTypeDefinitionsRequest
        include JSON::Serializable

        # An array of RegistrationFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::RegistrationTypeFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationTypes")]
        getter registration_types : Array(String)?

        def initialize(
          @filters : Array(Types::RegistrationTypeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registration_types : Array(String)? = nil
        )
        end
      end

      struct DescribeRegistrationTypeDefinitionsResult
        include JSON::Serializable

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationTypeDefinitions")]
        getter registration_type_definitions : Array(Types::RegistrationTypeDefinition)

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_type_definitions : Array(Types::RegistrationTypeDefinition),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationVersionsRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # An array of RegistrationVersionFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::RegistrationVersionFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of registration version numbers.
        @[JSON::Field(key: "VersionNumbers")]
        getter version_numbers : Array(Int64)?

        def initialize(
          @registration_id : String,
          @filters : Array(Types::RegistrationVersionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @version_numbers : Array(Int64)? = nil
        )
        end
      end

      struct DescribeRegistrationVersionsResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # An array of RegistrationVersions objects.
        @[JSON::Field(key: "RegistrationVersions")]
        getter registration_versions : Array(Types::RegistrationVersionInformation)

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_arn : String,
          @registration_id : String,
          @registration_versions : Array(Types::RegistrationVersionInformation),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistrationsRequest
        include JSON::Serializable

        # An array of RegistrationFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::RegistrationFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of unique identifiers for each registration.
        @[JSON::Field(key: "RegistrationIds")]
        getter registration_ids : Array(String)?

        def initialize(
          @filters : Array(Types::RegistrationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registration_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeRegistrationsResult
        include JSON::Serializable

        # An array of RegistrationInformation objects.
        @[JSON::Field(key: "Registrations")]
        getter registrations : Array(Types::RegistrationInformation)

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registrations : Array(Types::RegistrationInformation),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeSenderIdsRequest
        include JSON::Serializable

        # An array of SenderIdFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::SenderIdFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Use SELF to filter the list of Sender Ids to ones your account owns or use SHARED to filter on
        # Sender Ids shared with your account. The Owner and SenderIds parameters can't be used at the same
        # time.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # An array of SenderIdAndCountry objects to search for. If you are using a shared End User Messaging
        # SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "SenderIds")]
        getter sender_ids : Array(Types::SenderIdAndCountry)?

        def initialize(
          @filters : Array(Types::SenderIdFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil,
          @sender_ids : Array(Types::SenderIdAndCountry)? = nil
        )
        end
      end

      struct DescribeSenderIdsResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of SernderIdInformation objects that contain the details for the requested SenderIds.
        @[JSON::Field(key: "SenderIds")]
        getter sender_ids : Array(Types::SenderIdInformation)?

        def initialize(
          @next_token : String? = nil,
          @sender_ids : Array(Types::SenderIdInformation)? = nil
        )
        end
      end

      struct DescribeSpendLimitsRequest
        include JSON::Serializable

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeSpendLimitsResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of SpendLimit objects that contain the details for the requested spend limits.
        @[JSON::Field(key: "SpendLimits")]
        getter spend_limits : Array(Types::SpendLimit)?

        def initialize(
          @next_token : String? = nil,
          @spend_limits : Array(Types::SpendLimit)? = nil
        )
        end
      end

      struct DescribeVerifiedDestinationNumbersRequest
        include JSON::Serializable

        # An array of verified destination phone number, in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumbers")]
        getter destination_phone_numbers : Array(String)?

        # An array of VerifiedDestinationNumberFilter objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::VerifiedDestinationNumberFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of VerifiedDestinationNumberid to retrieve.
        @[JSON::Field(key: "VerifiedDestinationNumberIds")]
        getter verified_destination_number_ids : Array(String)?

        def initialize(
          @destination_phone_numbers : Array(String)? = nil,
          @filters : Array(Types::VerifiedDestinationNumberFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @verified_destination_number_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeVerifiedDestinationNumbersResult
        include JSON::Serializable

        # An array of VerifiedDestinationNumberInformation objects
        @[JSON::Field(key: "VerifiedDestinationNumbers")]
        getter verified_destination_numbers : Array(Types::VerifiedDestinationNumberInformation)

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @verified_destination_numbers : Array(Types::VerifiedDestinationNumberInformation),
          @next_token : String? = nil
        )
        end
      end

      struct DisassociateOriginationIdentityRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or SenderIdArn.
        # You can use DescribePhoneNumbers find the values for PhoneNumberId and PhoneNumberArn, or use
        # DescribeSenderIds to get the values for SenderId and SenderIdArn. If you are using a shared End User
        # Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The unique identifier for the pool to disassociate with the origination identity. This value can be
        # either the PoolId or PoolArn. If you are using a shared End User Messaging SMS resource then you
        # must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you don't
        # specify a client token, a randomly generated token is used for the request to ensure idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @iso_country_code : String,
          @origination_identity : String,
          @pool_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DisassociateOriginationIdentityResult
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The PhoneNumberId or SenderId of the origination identity.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The PhoneNumberArn or SenderIdArn of the origination identity.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String?

        # The Amazon Resource Name (ARN) of the pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The PoolId of the pool no longer associated with the origination identity.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        def initialize(
          @iso_country_code : String? = nil,
          @origination_identity : String? = nil,
          @origination_identity_arn : String? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil
        )
        end
      end

      struct DisassociateProtectConfigurationRequest
        include JSON::Serializable

        # The name of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @configuration_set_name : String,
          @protect_configuration_id : String
        )
        end
      end

      struct DisassociateProtectConfigurationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String

        # The name of the ConfigurationSet.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @configuration_set_arn : String,
          @configuration_set_name : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct DiscardRegistrationVersionRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        def initialize(
          @registration_id : String
        )
        end
      end

      struct DiscardRegistrationVersionResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration version. APPROVED : Your registration has been approved. ARCHIVED :
        # Your previously approved registration version moves into this status when a more recently submitted
        # version is approved. DENIED : You must fix your registration and resubmit it. DISCARDED : You've
        # abandon this version of their registration to start over with a new version. DRAFT : The initial
        # status of a registration version after it’s created. REQUIRES_AUTHENTICATION : You need to complete
        # email authentication. REVIEWING : Your registration has been accepted and is being reviewed. REVOKED
        # : Your previously approved registration has been revoked. SUBMITTED : Your registration has been
        # submitted.
        @[JSON::Field(key: "RegistrationVersionStatus")]
        getter registration_version_status : String

        # The RegistrationVersionStatusHistory object contains the time stamps for when the reservations
        # status changes.
        @[JSON::Field(key: "RegistrationVersionStatusHistory")]
        getter registration_version_status_history : Types::RegistrationVersionStatusHistory

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @registration_arn : String,
          @registration_id : String,
          @registration_version_status : String,
          @registration_version_status_history : Types::RegistrationVersionStatusHistory,
          @version_number : Int64
        )
        end
      end

      # Contains information about an event destination. Event destinations are associated with
      # configuration sets, which enable you to publish message sending events to CloudWatch, Firehose, or
      # Amazon SNS.
      struct EventDestination
        include JSON::Serializable

        # When set to true events will be logged.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The name of the EventDestination.
        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        # An array of event types that determine which events to log. The TEXT_SENT event type is not
        # supported.
        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)

        # An object that contains information about an event destination that sends logging events to Amazon
        # CloudWatch logs.
        @[JSON::Field(key: "CloudWatchLogsDestination")]
        getter cloud_watch_logs_destination : Types::CloudWatchLogsDestination?

        # An object that contains information about an event destination for logging to Amazon Data Firehose.
        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An object that contains information about an event destination that sends logging events to Amazon
        # SNS.
        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @enabled : Bool,
          @event_destination_name : String,
          @matching_event_types : Array(String),
          @cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      struct GetProtectConfigurationCountryRuleSetRequest
        include JSON::Serializable

        # The capability type to return the CountryRuleSet for. Valid values are SMS , VOICE , or MMS .
        @[JSON::Field(key: "NumberCapability")]
        getter number_capability : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @number_capability : String,
          @protect_configuration_id : String
        )
        end
      end

      struct GetProtectConfigurationCountryRuleSetResult
        include JSON::Serializable

        # A map of ProtectConfigurationCountryRuleSetInformation objects that contain the details for the
        # requested NumberCapability. The Key is the two-letter ISO country code. For a list of supported ISO
        # country codes, see Supported countries and regions (SMS channel) in the End User Messaging SMS User
        # Guide.
        @[JSON::Field(key: "CountryRuleSet")]
        getter country_rule_set : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation)

        # The capability type associated with the returned ProtectConfigurationCountryRuleSetInformation
        # objects.
        @[JSON::Field(key: "NumberCapability")]
        getter number_capability : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @country_rule_set : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation),
          @number_capability : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the resource-based
        # policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResult
        include JSON::Serializable

        # The time when the resource-based policy was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The JSON formatted string that contains the resource-based policy attached to the End User Messaging
        # SMS resource.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the resource-based
        # policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The API encountered an unexpected error and couldn't complete the request. You might be able to
      # successfully issue the request again in the future.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier of the request.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The information for keywords that meet a specified criteria.
      struct KeywordFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The information for all keywords in a pool.
      struct KeywordInformation
        include JSON::Serializable

        # The keyword as a string.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String

        # The action to perform for the keyword.
        @[JSON::Field(key: "KeywordAction")]
        getter keyword_action : String

        # A custom message that can be used with the keyword.
        @[JSON::Field(key: "KeywordMessage")]
        getter keyword_message : String

        def initialize(
          @keyword : String,
          @keyword_action : String,
          @keyword_message : String
        )
        end
      end

      # Contains the delivery stream Amazon Resource Name (ARN), and the ARN of the Identity and Access
      # Management (IAM) role associated with a Firehose event destination. Event destinations, such as
      # Firehose, are associated with configuration sets, which enable you to publish message sending
      # events.
      struct KinesisFirehoseDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delivery stream.
        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String

        # The ARN of an Identity and Access Management role that is able to write event data to an Amazon Data
        # Firehose destination.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        def initialize(
          @delivery_stream_arn : String,
          @iam_role_arn : String
        )
        end
      end

      struct ListPoolOriginationIdentitiesRequest
        include JSON::Serializable

        # The unique identifier for the pool. This value can be either the PoolId or PoolArn. If you are using
        # a shared End User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # An array of PoolOriginationIdentitiesFilter objects to filter the results..
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PoolOriginationIdentitiesFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @pool_id : String,
          @filters : Array(Types::PoolOriginationIdentitiesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPoolOriginationIdentitiesResult
        include JSON::Serializable

        # The token to be used for the next set of paginated results. If this field is empty then there are no
        # more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of any OriginationIdentityMetadata objects.
        @[JSON::Field(key: "OriginationIdentities")]
        getter origination_identities : Array(Types::OriginationIdentityMetadata)?

        # The Amazon Resource Name (ARN) for the pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The unique PoolId of the pool.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        def initialize(
          @next_token : String? = nil,
          @origination_identities : Array(Types::OriginationIdentityMetadata)? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil
        )
        end
      end

      struct ListProtectConfigurationRuleSetNumberOverridesRequest
        include JSON::Serializable

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # An array of ProtectConfigurationRuleSetNumberOverrideFilterItem objects to filter the results.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ProtectConfigurationRuleSetNumberOverrideFilterItem)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @protect_configuration_id : String,
          @filters : Array(Types::ProtectConfigurationRuleSetNumberOverrideFilterItem)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectConfigurationRuleSetNumberOverridesResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of RuleSetNumberOverrides objects.
        @[JSON::Field(key: "RuleSetNumberOverrides")]
        getter rule_set_number_overrides : Array(Types::ProtectConfigurationRuleSetNumberOverride)?

        def initialize(
          @protect_configuration_arn : String,
          @protect_configuration_id : String,
          @next_token : String? = nil,
          @rule_set_number_overrides : Array(Types::ProtectConfigurationRuleSetNumberOverride)? = nil
        )
        end
      end

      struct ListRegistrationAssociationsRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # An array of RegistrationAssociationFilter to apply to the results that are returned.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::RegistrationAssociationFilter)?

        # The maximum number of results to return per each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_id : String,
          @filters : Array(Types::RegistrationAssociationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRegistrationAssociationsResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # An array of RegistrationAssociationMetadata objects.
        @[JSON::Field(key: "RegistrationAssociations")]
        getter registration_associations : Array(Types::RegistrationAssociationMetadata)

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The token to be used for the next set of paginated results. You don't need to supply a value for
        # this field in the initial request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @registration_arn : String,
          @registration_associations : Array(Types::RegistrationAssociationMetadata),
          @registration_id : String,
          @registration_type : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to query for.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResult
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # An array of key and value pair tags that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The information for all OptOutList in an Amazon Web Services account.
      struct OptOutListInformation
        include JSON::Serializable

        # The time when the OutOutList was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The Amazon Resource Name (ARN) of the OptOutList.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String

        # The name of the OptOutList.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        def initialize(
          @created_timestamp : Time,
          @opt_out_list_arn : String,
          @opt_out_list_name : String
        )
        end
      end

      # The information for opted out numbers that meet a specified criteria.
      struct OptedOutFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The information for an opted out number in an Amazon Web Services account.
      struct OptedOutNumberInformation
        include JSON::Serializable

        # This is set to true if it was the end recipient that opted out.
        @[JSON::Field(key: "EndUserOptedOut")]
        getter end_user_opted_out : Bool

        # The phone number that is opted out.
        @[JSON::Field(key: "OptedOutNumber")]
        getter opted_out_number : String

        # The time that the op tout occurred, in UNIX epoch time format.
        @[JSON::Field(key: "OptedOutTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter opted_out_timestamp : Time

        def initialize(
          @end_user_opted_out : Bool,
          @opted_out_number : String,
          @opted_out_timestamp : Time
        )
        end
      end

      # The metadata for an origination identity associated with a pool.
      struct OriginationIdentityMetadata
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # Describes if the origination identity can be used for text messages, voice calls or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)

        # The unique identifier of the origination identity.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The Amazon Resource Name (ARN) associated with the origination identity.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String

        # The phone number in E.164 format.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @iso_country_code : String,
          @number_capabilities : Array(String),
          @origination_identity : String,
          @origination_identity_arn : String,
          @phone_number : String? = nil
        )
        end
      end

      # The information for a phone number that meets a specified criteria.
      struct PhoneNumberFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The information for a phone number, in E.164 format, in an Amazon Web Services account.
      struct PhoneNumberInformation
        include JSON::Serializable

        # The time when the phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # When set to true the phone number can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String

        # The price, in US dollars, to lease the phone number.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String

        # Describes if the origination identity can be used for text messages, voice calls or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)

        # The type of phone number.
        @[JSON::Field(key: "NumberType")]
        getter number_type : String

        # The name of the OptOutList associated with the phone number.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # The phone number in E.164 format.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        # The Amazon Resource Name (ARN) associated with the phone number.
        @[JSON::Field(key: "PhoneNumberArn")]
        getter phone_number_arn : String

        # When set to false and an end recipient sends a message that begins with HELP or STOP to one of your
        # dedicated numbers, End User Messaging SMS automatically replies with a customizable message and adds
        # the end recipient to the OptOutList. When set to true you're responsible for responding to HELP and
        # STOP requests. You're also responsible for tracking and honoring opt-out request. For more
        # information see Self-managed opt-outs
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool

        # The current status of the phone number.
        @[JSON::Field(key: "Status")]
        getter status : String

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients using the TwoWayChannelArn.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool

        # When set to true the international sending of phone number is Enabled.
        @[JSON::Field(key: "InternationalSendingEnabled")]
        getter international_sending_enabled : Bool?

        # The unique identifier for the phone number.
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The unique identifier of the pool associated with the phone number.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        def initialize(
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @iso_country_code : String,
          @message_type : String,
          @monthly_leasing_price : String,
          @number_capabilities : Array(String),
          @number_type : String,
          @opt_out_list_name : String,
          @phone_number : String,
          @phone_number_arn : String,
          @self_managed_opt_outs_enabled : Bool,
          @status : String,
          @two_way_enabled : Bool,
          @international_sending_enabled : Bool? = nil,
          @phone_number_id : String? = nil,
          @pool_id : String? = nil,
          @registration_id : String? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil
        )
        end
      end

      # The information for a pool that meets a specified criteria.
      struct PoolFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The information for a pool in an Amazon Web Services account.
      struct PoolInformation
        include JSON::Serializable

        # The time when the pool was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # When set to true the pool can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String

        # The name of the OptOutList associated with the pool.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # The Amazon Resource Name (ARN) for the pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String

        # The unique identifier for the pool.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # When set to false, an end recipient sends a message that begins with HELP or STOP to one of your
        # dedicated numbers, End User Messaging SMS automatically replies with a customizable message and adds
        # the end recipient to the OptOutList. When set to true you're responsible for responding to HELP and
        # STOP requests. You're also responsible for tracking and honoring opt-out requests. For more
        # information see Self-managed opt-outs
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool

        # Allows you to enable shared routes on your pool. By default, this is set to False . If you set this
        # value to True , your messages are sent using phone numbers or sender IDs (depending on the country)
        # that are shared with other users. In some countries, such as the United States, senders aren't
        # allowed to use shared routes and must use a dedicated phone number or short code.
        @[JSON::Field(key: "SharedRoutesEnabled")]
        getter shared_routes_enabled : Bool

        # The current status of the pool.
        @[JSON::Field(key: "Status")]
        getter status : String

        # When set to true you can receive incoming text messages from your end recipients using the
        # TwoWayChannelArn.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        def initialize(
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @message_type : String,
          @opt_out_list_name : String,
          @pool_arn : String,
          @pool_id : String,
          @self_managed_opt_outs_enabled : Bool,
          @shared_routes_enabled : Bool,
          @status : String,
          @two_way_enabled : Bool,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil
        )
        end
      end

      # Information about origination identities associated with a pool that meets a specified criteria.
      struct PoolOriginationIdentitiesFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The types of statuses that can be used.
      struct ProtectConfigurationCountryRuleSetInformation
        include JSON::Serializable

        # The types of protection that can be used.
        @[JSON::Field(key: "ProtectStatus")]
        getter protect_status : String

        def initialize(
          @protect_status : String
        )
        end
      end

      # The filter definition for filtering protect configurations that meet a specified criteria.
      struct ProtectConfigurationFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Provides information on the specified protect configuration.
      struct ProtectConfigurationInformation
        include JSON::Serializable

        # This is true if the protect configuration is set as your account default protect configuration.
        @[JSON::Field(key: "AccountDefault")]
        getter account_default : Bool

        # The time when the protect configuration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The status of deletion protection for the protect configuration. When set to true deletion
        # protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @account_default : Bool,
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      # Provides details on phone number rule overrides for a protect configuration.
      struct ProtectConfigurationRuleSetNumberOverride
        include JSON::Serializable

        # The action for the rule to perform of either blocking or allowing messages to the destination phone
        # number.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The time when the rule was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The time the rule will expire at. If ExpirationTimestamp is not set then the rule will not expire.
        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        def initialize(
          @action : String,
          @created_timestamp : Time,
          @destination_phone_number : String,
          @expiration_timestamp : Time? = nil,
          @iso_country_code : String? = nil
        )
        end
      end

      # The information for a protect configuration rule set number override that meets a specified
      # criteria.
      struct ProtectConfigurationRuleSetNumberOverrideFilterItem
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      struct PutKeywordRequest
        include JSON::Serializable

        # The new keyword to add.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String

        # The message associated with the keyword.
        @[JSON::Field(key: "KeywordMessage")]
        getter keyword_message : String

        # The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or SenderIdArn.
        # You can use DescribePhoneNumbers get the values for PhoneNumberId and PhoneNumberArn while
        # DescribeSenderIds can be used to get the values for SenderId and SenderIdArn. If you are using a
        # shared End User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The action to perform for the new keyword when it is received. AUTOMATIC_RESPONSE: A message is sent
        # to the recipient. OPT_OUT: Keeps the recipient from receiving future messages. OPT_IN: The recipient
        # wants to receive future messages.
        @[JSON::Field(key: "KeywordAction")]
        getter keyword_action : String?

        def initialize(
          @keyword : String,
          @keyword_message : String,
          @origination_identity : String,
          @keyword_action : String? = nil
        )
        end
      end

      struct PutKeywordResult
        include JSON::Serializable

        # The keyword that was added.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String?

        # The action to perform when the keyword is used.
        @[JSON::Field(key: "KeywordAction")]
        getter keyword_action : String?

        # The message associated with the keyword.
        @[JSON::Field(key: "KeywordMessage")]
        getter keyword_message : String?

        # The PhoneNumberId or PoolId that the keyword was associated with.
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The PhoneNumberArn or PoolArn that the keyword was associated with.
        @[JSON::Field(key: "OriginationIdentityArn")]
        getter origination_identity_arn : String?

        def initialize(
          @keyword : String? = nil,
          @keyword_action : String? = nil,
          @keyword_message : String? = nil,
          @origination_identity : String? = nil,
          @origination_identity_arn : String? = nil
        )
        end
      end

      struct PutMessageFeedbackRequest
        include JSON::Serializable

        # Set the message feedback to be either RECEIVED or FAILED .
        @[JSON::Field(key: "MessageFeedbackStatus")]
        getter message_feedback_status : String

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_feedback_status : String,
          @message_id : String
        )
        end
      end

      struct PutMessageFeedbackResult
        include JSON::Serializable

        # The current status of the message.
        @[JSON::Field(key: "MessageFeedbackStatus")]
        getter message_feedback_status : String

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_feedback_status : String,
          @message_id : String
        )
        end
      end

      struct PutOptedOutNumberRequest
        include JSON::Serializable

        # The OptOutListName or OptOutListArn to add the phone number to. If you are using a shared End User
        # Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String

        # The phone number to add to the OptOutList in E.164 format.
        @[JSON::Field(key: "OptedOutNumber")]
        getter opted_out_number : String

        def initialize(
          @opt_out_list_name : String,
          @opted_out_number : String
        )
        end
      end

      struct PutOptedOutNumberResult
        include JSON::Serializable

        # This is true if it was the end user who requested their phone number be removed.
        @[JSON::Field(key: "EndUserOptedOut")]
        getter end_user_opted_out : Bool?

        # The OptOutListArn that the phone number was removed from.
        @[JSON::Field(key: "OptOutListArn")]
        getter opt_out_list_arn : String?

        # The OptOutListName that the phone number was removed from.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The phone number that was added to the OptOutList.
        @[JSON::Field(key: "OptedOutNumber")]
        getter opted_out_number : String?

        # The time that the phone number was added to the OptOutList, in UNIX epoch time format.
        @[JSON::Field(key: "OptedOutTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter opted_out_timestamp : Time?

        def initialize(
          @end_user_opted_out : Bool? = nil,
          @opt_out_list_arn : String? = nil,
          @opt_out_list_name : String? = nil,
          @opted_out_number : String? = nil,
          @opted_out_timestamp : Time? = nil
        )
        end
      end

      struct PutProtectConfigurationRuleSetNumberOverrideRequest
        include JSON::Serializable

        # The action for the rule to either block or allow messages to the destination phone number.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The time the rule will expire at. If ExpirationTimestamp is not set then the rule does not expire.
        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        def initialize(
          @action : String,
          @destination_phone_number : String,
          @protect_configuration_id : String,
          @client_token : String? = nil,
          @expiration_timestamp : Time? = nil
        )
        end
      end

      struct PutProtectConfigurationRuleSetNumberOverrideResult
        include JSON::Serializable

        # The action for the rule to take.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The time when the rule was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # The time the rule will expire at.
        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        def initialize(
          @action : String,
          @created_timestamp : Time,
          @destination_phone_number : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String,
          @expiration_timestamp : Time? = nil,
          @iso_country_code : String? = nil
        )
        end
      end

      struct PutRegistrationFieldValueRequest
        include JSON::Serializable

        # The path to the registration form field. You can use DescribeRegistrationFieldDefinitions for a list
        # of FieldPaths .
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String?

        # An array of values for the form field.
        @[JSON::Field(key: "SelectChoices")]
        getter select_choices : Array(String)?

        # The text data for a free form field.
        @[JSON::Field(key: "TextValue")]
        getter text_value : String?

        def initialize(
          @field_path : String,
          @registration_id : String,
          @registration_attachment_id : String? = nil,
          @select_choices : Array(String)? = nil,
          @text_value : String? = nil
        )
        end
      end

      struct PutRegistrationFieldValueResult
        include JSON::Serializable

        # The path to the registration form field. You can use DescribeRegistrationFieldDefinitions for a list
        # of FieldPaths .
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String?

        # An array of values for the form field.
        @[JSON::Field(key: "SelectChoices")]
        getter select_choices : Array(String)?

        # The text data for a free form field.
        @[JSON::Field(key: "TextValue")]
        getter text_value : String?

        def initialize(
          @field_path : String,
          @registration_arn : String,
          @registration_id : String,
          @version_number : Int64,
          @registration_attachment_id : String? = nil,
          @select_choices : Array(String)? = nil,
          @text_value : String? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The JSON formatted resource-based policy to attach.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource to attach the resource-based
        # policy to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResult
        include JSON::Serializable

        # The time when the resource-based policy was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The JSON formatted Resource Policy.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the resource-based
        # policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The filter definition for filtering registrations that meets a specified criteria.
      struct RegistrationAssociationFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Metadata for the origination identity that is associated with the registration.
      struct RegistrationAssociationMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the origination identity that is associated with the registration.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The unique identifier for the origination identity. For example this could be a PhoneNumberId or
        # SenderId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The origination identity type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The phone number associated with the registration in E.164 format.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @resource_arn : String,
          @resource_id : String,
          @resource_type : String,
          @iso_country_code : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      # The filter definition for filtering registration attachments that meets a specified criteria.
      struct RegistrationAttachmentFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Provides information on the specified registration attachments.
      struct RegistrationAttachmentsInformation
        include JSON::Serializable

        # The status of the registration attachment. UPLOAD_IN_PROGRESS The attachment is being uploaded.
        # UPLOAD_COMPLETE The attachment has been uploaded. UPLOAD_FAILED The attachment failed to uploaded.
        # DELETED The attachment has been deleted..
        @[JSON::Field(key: "AttachmentStatus")]
        getter attachment_status : String

        # The time when the registration attachment was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The Amazon Resource Name (ARN) for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentArn")]
        getter registration_attachment_arn : String

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String

        # A description of why the upload didn't successfully complete.
        @[JSON::Field(key: "AttachmentUploadErrorReason")]
        getter attachment_upload_error_reason : String?

        def initialize(
          @attachment_status : String,
          @created_timestamp : Time,
          @registration_attachment_arn : String,
          @registration_attachment_id : String,
          @attachment_upload_error_reason : String? = nil
        )
        end
      end

      # Provides the reason a registration was rejected.
      struct RegistrationDeniedReasonInformation
        include JSON::Serializable

        # The reason a registration was rejected.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        # A short description of the rejection reason.
        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String

        # The link to the document.
        @[JSON::Field(key: "DocumentationLink")]
        getter documentation_link : String?

        # The title of the document.
        @[JSON::Field(key: "DocumentationTitle")]
        getter documentation_title : String?

        # A long description of the rejection reason.
        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        def initialize(
          @reason : String,
          @short_description : String,
          @documentation_link : String? = nil,
          @documentation_title : String? = nil,
          @long_description : String? = nil
        )
        end
      end

      # Provides a description of the specified field.
      struct RegistrationFieldDefinition
        include JSON::Serializable

        # An array of RegistrationFieldDisplayHints objects for the field.
        @[JSON::Field(key: "DisplayHints")]
        getter display_hints : Types::RegistrationFieldDisplayHints

        # The path to the registration form field. You can use DescribeRegistrationFieldDefinitions for a list
        # of FieldPaths .
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # Specifies if the field for the registration form is required, conditional or optional.
        @[JSON::Field(key: "FieldRequirement")]
        getter field_requirement : String

        # The type of field.
        @[JSON::Field(key: "FieldType")]
        getter field_type : String

        # The section path of the field.
        @[JSON::Field(key: "SectionPath")]
        getter section_path : String

        # The validation rules for a select field.
        @[JSON::Field(key: "SelectValidation")]
        getter select_validation : Types::SelectValidation?

        # The validation rules for a text field.
        @[JSON::Field(key: "TextValidation")]
        getter text_validation : Types::TextValidation?

        def initialize(
          @display_hints : Types::RegistrationFieldDisplayHints,
          @field_path : String,
          @field_requirement : String,
          @field_type : String,
          @section_path : String,
          @select_validation : Types::SelectValidation? = nil,
          @text_validation : Types::TextValidation? = nil
        )
        end
      end

      # Provides help information on the registration field.
      struct RegistrationFieldDisplayHints
        include JSON::Serializable

        # A short description of the display hint.
        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String

        # The title of the display hint.
        @[JSON::Field(key: "Title")]
        getter title : String

        # The link to the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationLink")]
        getter documentation_link : String?

        # The title of the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationTitle")]
        getter documentation_title : String?

        # Example text of what the value of a field should contain.
        @[JSON::Field(key: "ExampleTextValue")]
        getter example_text_value : String?

        # A full description of the display hint.
        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        # An array of SelectOptionDescription objects.
        @[JSON::Field(key: "SelectOptionDescriptions")]
        getter select_option_descriptions : Array(Types::SelectOptionDescription)?

        # The validation rules for the text field.
        @[JSON::Field(key: "TextValidationDescription")]
        getter text_validation_description : String?

        def initialize(
          @short_description : String,
          @title : String,
          @documentation_link : String? = nil,
          @documentation_title : String? = nil,
          @example_text_value : String? = nil,
          @long_description : String? = nil,
          @select_option_descriptions : Array(Types::SelectOptionDescription)? = nil,
          @text_validation_description : String? = nil
        )
        end
      end

      # Provides the values of the specified field.
      struct RegistrationFieldValueInformation
        include JSON::Serializable

        # The path to the registration form field. You can use DescribeRegistrationFieldDefinitions for a list
        # of FieldPaths .
        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # A description of why the registration was denied.
        @[JSON::Field(key: "DeniedReason")]
        getter denied_reason : String?

        # Feedback provided for this specific field during the registration review process. This may include
        # validation errors, suggestions for improvement, or additional requirements.
        @[JSON::Field(key: "Feedback")]
        getter feedback : String?

        # The unique identifier for the registration attachment.
        @[JSON::Field(key: "RegistrationAttachmentId")]
        getter registration_attachment_id : String?

        # An array of values for the form field.
        @[JSON::Field(key: "SelectChoices")]
        getter select_choices : Array(String)?

        # The text data for a free form field.
        @[JSON::Field(key: "TextValue")]
        getter text_value : String?

        def initialize(
          @field_path : String,
          @denied_reason : String? = nil,
          @feedback : String? = nil,
          @registration_attachment_id : String? = nil,
          @select_choices : Array(String)? = nil,
          @text_value : String? = nil
        )
        end
      end

      # The filter definition for filtering registrations that meets a specified criteria.
      struct RegistrationFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about the requested registration.
      struct RegistrationInformation
        include JSON::Serializable

        # The time when the registration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The current version number of the registration.
        @[JSON::Field(key: "CurrentVersionNumber")]
        getter current_version_number : Int64

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration. CLOSED : The phone number or sender ID has been deleted and you must
        # also delete the registration for the number. CREATED : Your registration is created but not
        # submitted. COMPLETE : Your registration has been approved and your origination identity has been
        # created. DELETED : The registration has been deleted. PROVISIONING : Your registration has been
        # approved and your origination identity is being created. REQUIRES_AUTHENTICATION : You need to
        # complete email authentication. REQUIRES_UPDATES : You must fix your registration and resubmit it.
        # REVIEWING : Your registration has been accepted and is being reviewed. SUBMITTED : Your registration
        # has been submitted and is awaiting review.
        @[JSON::Field(key: "RegistrationStatus")]
        getter registration_status : String

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # Metadata about a given registration which is specific to that registration type.
        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Hash(String, String)?

        # The version number of the registration that was approved.
        @[JSON::Field(key: "ApprovedVersionNumber")]
        getter approved_version_number : Int64?

        # The latest version number of the registration that was denied.
        @[JSON::Field(key: "LatestDeniedVersionNumber")]
        getter latest_denied_version_number : Int64?

        def initialize(
          @created_timestamp : Time,
          @current_version_number : Int64,
          @registration_arn : String,
          @registration_id : String,
          @registration_status : String,
          @registration_type : String,
          @additional_attributes : Hash(String, String)? = nil,
          @approved_version_number : Int64? = nil,
          @latest_denied_version_number : Int64? = nil
        )
        end
      end

      # Provides information on the specified section definition.
      struct RegistrationSectionDefinition
        include JSON::Serializable

        # The path to the section of the registration.
        @[JSON::Field(key: "DisplayHints")]
        getter display_hints : Types::RegistrationSectionDisplayHints

        # The path to the section of the registration.
        @[JSON::Field(key: "SectionPath")]
        getter section_path : String

        def initialize(
          @display_hints : Types::RegistrationSectionDisplayHints,
          @section_path : String
        )
        end
      end

      # Provides help information on the registration section.
      struct RegistrationSectionDisplayHints
        include JSON::Serializable

        # A short description of the display hint.
        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String

        # The title of the display hint.
        @[JSON::Field(key: "Title")]
        getter title : String

        # The link to the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationLink")]
        getter documentation_link : String?

        # The title of the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationTitle")]
        getter documentation_title : String?

        # A full description of the display hint.
        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        def initialize(
          @short_description : String,
          @title : String,
          @documentation_link : String? = nil,
          @documentation_title : String? = nil,
          @long_description : String? = nil
        )
        end
      end

      # Provides information on the supported registration type.
      struct RegistrationTypeDefinition
        include JSON::Serializable

        # Provides help information on the registration.
        @[JSON::Field(key: "DisplayHints")]
        getter display_hints : Types::RegistrationTypeDisplayHints

        # The type of registration form. The list of RegistrationTypes can be found using the
        # DescribeRegistrationTypeDefinitions action.
        @[JSON::Field(key: "RegistrationType")]
        getter registration_type : String

        # The supported association behavior for the registration type.
        @[JSON::Field(key: "SupportedAssociations")]
        getter supported_associations : Array(Types::SupportedAssociation)?

        def initialize(
          @display_hints : Types::RegistrationTypeDisplayHints,
          @registration_type : String,
          @supported_associations : Array(Types::SupportedAssociation)? = nil
        )
        end
      end

      # Provides help information on the registration type.
      struct RegistrationTypeDisplayHints
        include JSON::Serializable

        # The title of the display hint.
        @[JSON::Field(key: "Title")]
        getter title : String

        # The link to the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationLink")]
        getter documentation_link : String?

        # The title of the document the display hint is associated with.
        @[JSON::Field(key: "DocumentationTitle")]
        getter documentation_title : String?

        # A full description of the display hint.
        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        # A short description of the display hint.
        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String?

        def initialize(
          @title : String,
          @documentation_link : String? = nil,
          @documentation_title : String? = nil,
          @long_description : String? = nil,
          @short_description : String? = nil
        )
        end
      end

      # The filter definition for filtering registration types that meets a specified criteria.
      struct RegistrationTypeFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The filter definition for filtering registration versions that meets a specified criteria.
      struct RegistrationVersionFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about the specified version of the registration.
      struct RegistrationVersionInformation
        include JSON::Serializable

        # The status of the registration. APPROVED : Your registration has been approved. ARCHIVED : Your
        # previously approved registration version moves into this status when a more recently submitted
        # version is approved. DENIED : You must fix your registration and resubmit it. DISCARDED : You've
        # abandon this version of their registration to start over with a new version. DRAFT : The initial
        # status of a registration version after it’s created. REQUIRES_AUTHENTICATION : You need to complete
        # email authentication. REVIEWING : Your registration has been accepted and is being reviewed. REVOKED
        # : Your previously approved registration has been revoked. SUBMITTED : Your registration has been
        # submitted.
        @[JSON::Field(key: "RegistrationVersionStatus")]
        getter registration_version_status : String

        # The RegistrationVersionStatusHistory object contains the time stamps for when the reservations
        # status changes.
        @[JSON::Field(key: "RegistrationVersionStatusHistory")]
        getter registration_version_status_history : Types::RegistrationVersionStatusHistory

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # An array of RegistrationDeniedReasonInformation objects.
        @[JSON::Field(key: "DeniedReasons")]
        getter denied_reasons : Array(Types::RegistrationDeniedReasonInformation)?

        # Feedback information provided during the registration review process. This includes comments,
        # suggestions, or additional requirements.
        @[JSON::Field(key: "Feedback")]
        getter feedback : String?

        def initialize(
          @registration_version_status : String,
          @registration_version_status_history : Types::RegistrationVersionStatusHistory,
          @version_number : Int64,
          @denied_reasons : Array(Types::RegistrationDeniedReasonInformation)? = nil,
          @feedback : String? = nil
        )
        end
      end

      # The RegistrationVersionStatusHistory object contains the time stamps for when the reservations
      # status changes.
      struct RegistrationVersionStatusHistory
        include JSON::Serializable

        # The time when the registration was in the draft state, in UNIX epoch time format.
        @[JSON::Field(key: "DraftTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter draft_timestamp : Time

        # The time when the registration was in the approved state, in UNIX epoch time format.
        @[JSON::Field(key: "ApprovedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter approved_timestamp : Time?

        # The time when the registration was in the archived state, in UNIX epoch time format.
        @[JSON::Field(key: "ArchivedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter archived_timestamp : Time?

        # The time when the registration was in the AWS reviewing state, in UNIX epoch time format.
        @[JSON::Field(key: "AwsReviewingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter aws_reviewing_timestamp : Time?

        # The time when the registration was in the denied state, in UNIX epoch time format.
        @[JSON::Field(key: "DeniedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter denied_timestamp : Time?

        # The time when the registration was in the discarded state, in UNIX epoch time format.
        @[JSON::Field(key: "DiscardedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter discarded_timestamp : Time?

        # The time when the registration was in the requires authentication state, in UNIX epoch time format.
        @[JSON::Field(key: "RequiresAuthenticationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requires_authentication_timestamp : Time?

        # The time when the registration was in the reviewing state, in UNIX epoch time format.
        @[JSON::Field(key: "ReviewingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter reviewing_timestamp : Time?

        # The time when the registration was in the revoked state, in UNIX epoch time format.
        @[JSON::Field(key: "RevokedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter revoked_timestamp : Time?

        # The time when the registration was in the submitted state, in UNIX epoch time format.
        @[JSON::Field(key: "SubmittedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_timestamp : Time?

        def initialize(
          @draft_timestamp : Time,
          @approved_timestamp : Time? = nil,
          @archived_timestamp : Time? = nil,
          @aws_reviewing_timestamp : Time? = nil,
          @denied_timestamp : Time? = nil,
          @discarded_timestamp : Time? = nil,
          @requires_authentication_timestamp : Time? = nil,
          @reviewing_timestamp : Time? = nil,
          @revoked_timestamp : Time? = nil,
          @submitted_timestamp : Time? = nil
        )
        end
      end

      struct ReleasePhoneNumberRequest
        include JSON::Serializable

        # The PhoneNumberId or PhoneNumberArn of the phone number to release. You can use DescribePhoneNumbers
        # to get the values for PhoneNumberId and PhoneNumberArn. If you are using a shared End User Messaging
        # SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end

      struct ReleasePhoneNumberResult
        include JSON::Serializable

        # The time when the phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The message type that was associated with the phone number.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The monthly price of the phone number, in US dollars.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String?

        # Specifies if the number could be used for text messages, voice, or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)?

        # The type of number that was released.
        @[JSON::Field(key: "NumberType")]
        getter number_type : String?

        # The name of the OptOutList that was associated with the phone number.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The phone number that was released.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The PhoneNumberArn of the phone number that was released.
        @[JSON::Field(key: "PhoneNumberArn")]
        getter phone_number_arn : String?

        # The PhoneNumberId of the phone number that was released.
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        # By default this is set to false. When set to false and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # The current status of the request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the TwoWayChannel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @iso_country_code : String? = nil,
          @message_type : String? = nil,
          @monthly_leasing_price : String? = nil,
          @number_capabilities : Array(String)? = nil,
          @number_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @phone_number : String? = nil,
          @phone_number_arn : String? = nil,
          @phone_number_id : String? = nil,
          @registration_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @status : String? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct ReleaseSenderIdRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The sender ID to release.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        def initialize(
          @iso_country_code : String,
          @sender_id : String
        )
        end
      end

      struct ReleaseSenderIdResult
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)

        # The monthly price, in US dollars, to lease the sender ID.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String

        # True if the sender ID is registered.
        @[JSON::Field(key: "Registered")]
        getter registered : Bool

        # The sender ID that was released.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # The Amazon Resource Name (ARN) associated with the SenderId.
        @[JSON::Field(key: "SenderIdArn")]
        getter sender_id_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        def initialize(
          @iso_country_code : String,
          @message_types : Array(String),
          @monthly_leasing_price : String,
          @registered : Bool,
          @sender_id : String,
          @sender_id_arn : String,
          @registration_id : String? = nil
        )
        end
      end

      struct RequestPhoneNumberRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String

        # Indicates if the phone number will be used for text messages, voice messages, or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)

        # The type of phone number to request. When you request a SIMULATOR phone number, you must set
        # MessageType as TRANSACTIONAL .
        @[JSON::Field(key: "NumberType")]
        getter number_type : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # By default this is set to false. When set to true the phone number can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # By default this is set to false. When set to true the international sending of phone number is
        # Enabled.
        @[JSON::Field(key: "InternationalSendingEnabled")]
        getter international_sending_enabled : Bool?

        # The name of the OptOutList to associate with the phone number. You can use the OptOutListName or
        # OptOutListArn. If you are using a shared End User Messaging SMS resource then you must use the full
        # Amazon Resource Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The pool to associated with the phone number. You can use the PoolId or PoolArn. If you are using a
        # shared End User Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # Use this field to attach your phone number for an external registration process.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        # An array of tags (key and value pairs) to associate with the requested phone number.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @iso_country_code : String,
          @message_type : String,
          @number_capabilities : Array(String),
          @number_type : String,
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @international_sending_enabled : Bool? = nil,
          @opt_out_list_name : String? = nil,
          @pool_id : String? = nil,
          @registration_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct RequestPhoneNumberResult
        include JSON::Serializable

        # The time when the phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # By default this is set to false. When set to true the phone number can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # By default this is set to false. When set to true the international sending of phone number is
        # Enabled.
        @[JSON::Field(key: "InternationalSendingEnabled")]
        getter international_sending_enabled : Bool?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The monthly price, in US dollars, to lease the phone number.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String?

        # Indicates if the phone number will be used for text messages, voice messages or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)?

        # The type of number that was released.
        @[JSON::Field(key: "NumberType")]
        getter number_type : String?

        # The name of the OptOutList that is associated with the requested phone number.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The new phone number that was requested.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The Amazon Resource Name (ARN) of the requested phone number.
        @[JSON::Field(key: "PhoneNumberArn")]
        getter phone_number_arn : String?

        # The unique identifier of the new phone number.
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The unique identifier of the pool associated with the phone number
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        # By default this is set to false. When set to false and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # The current status of the request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # An array of key and value pair tags that are associated with the phone number.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The ARN used to identify the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @international_sending_enabled : Bool? = nil,
          @iso_country_code : String? = nil,
          @message_type : String? = nil,
          @monthly_leasing_price : String? = nil,
          @number_capabilities : Array(String)? = nil,
          @number_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @phone_number : String? = nil,
          @phone_number_arn : String? = nil,
          @phone_number_id : String? = nil,
          @pool_id : String? = nil,
          @registration_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct RequestSenderIdRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The sender ID string to request.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you
        # don't specify a client token, a randomly generated token is used for the request to ensure
        # idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # By default this is set to false. When set to true the sender ID can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)?

        # An array of tags (key and value pairs) to associate with the sender ID.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @iso_country_code : String,
          @sender_id : String,
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @message_types : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct RequestSenderIdResult
        include JSON::Serializable

        # By default this is set to false. When set to true the sender ID can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)

        # The monthly price, in US dollars, to lease the sender ID.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String

        # True if the sender ID is registered.
        @[JSON::Field(key: "Registered")]
        getter registered : Bool

        # The sender ID that was requested.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # The Amazon Resource Name (ARN) associated with the SenderId.
        @[JSON::Field(key: "SenderIdArn")]
        getter sender_id_arn : String

        # An array of tags (key and value pairs) to associate with the sender ID.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @deletion_protection_enabled : Bool,
          @iso_country_code : String,
          @message_types : Array(String),
          @monthly_leasing_price : String,
          @registered : Bool,
          @sender_id : String,
          @sender_id_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A requested resource couldn't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource that caused the exception.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A description of each select option.
      struct SelectOptionDescription
        include JSON::Serializable

        # The value of the option.
        @[JSON::Field(key: "Option")]
        getter option : String

        # A description of the option meaning.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The title of the select option.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @option : String,
          @description : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Validation rules for a select field.
      struct SelectValidation
        include JSON::Serializable

        # The maximum number of choices for the select.
        @[JSON::Field(key: "MaxChoices")]
        getter max_choices : Int32

        # The minimum number of choices for the select.
        @[JSON::Field(key: "MinChoices")]
        getter min_choices : Int32

        # An array of strings for the possible selection options.
        @[JSON::Field(key: "Options")]
        getter options : Array(String)

        def initialize(
          @max_choices : Int32,
          @min_choices : Int32,
          @options : Array(String)
        )
        end
      end

      struct SendDestinationNumberVerificationCodeRequest
        include JSON::Serializable

        # Choose to send the verification code as an SMS or voice message.
        @[JSON::Field(key: "VerificationChannel")]
        getter verification_channel : String

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        # The name of the configuration set to use. This can be either the ConfigurationSetName or
        # ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # You can specify custom data in this field. If you do, that data is logged to the event destination.
        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # This field is used for any country-specific registration requirements. Currently, this setting is
        # only used when you send messages to recipients in India using a sender ID. For more information see
        # Special requirements for sending SMS messages to recipients in India .
        @[JSON::Field(key: "DestinationCountryParameters")]
        getter destination_country_parameters : Hash(String, String)?

        # Choose the language to use for the message.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The origination identity of the message. This can be either the PhoneNumber, PhoneNumberId,
        # PhoneNumberArn, SenderId, SenderIdArn, PoolId, or PoolArn. If you are using a shared End User
        # Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        def initialize(
          @verification_channel : String,
          @verified_destination_number_id : String,
          @configuration_set_name : String? = nil,
          @context : Hash(String, String)? = nil,
          @destination_country_parameters : Hash(String, String)? = nil,
          @language_code : String? = nil,
          @origination_identity : String? = nil
        )
        end
      end

      struct SendDestinationNumberVerificationCodeResult
        include JSON::Serializable

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end

      struct SendMediaMessageRequest
        include JSON::Serializable

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The origination identity of the message. This can be either the PhoneNumber, PhoneNumberId,
        # PhoneNumberArn, SenderId, SenderIdArn, PoolId, or PoolArn. If you are using a shared End User
        # Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The name of the configuration set to use. This can be either the ConfigurationSetName or
        # ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # You can specify custom data in this field. If you do, that data is logged to the event destination.
        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # When set to true, the message is checked and validated, but isn't sent to the end recipient.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The maximum amount that you want to spend, in US dollars, per each MMS message.
        @[JSON::Field(key: "MaxPrice")]
        getter max_price : String?

        # An array of URLs to each media file to send. The media files have to be stored in an S3 bucket.
        # Supported media file formats are listed in MMS file types, size and character limits . For more
        # information on creating an S3 bucket and managing objects, see Creating a bucket , Uploading objects
        # in the Amazon S3 User Guide , and Setting up an Amazon S3 bucket for MMS files in the Amazon Web
        # Services End User Messaging SMS User Guide .
        @[JSON::Field(key: "MediaUrls")]
        getter media_urls : Array(String)?

        # The text body of the message.
        @[JSON::Field(key: "MessageBody")]
        getter message_body : String?

        # Set to true to enable message feedback for the message. When a user receives the message you need to
        # update the message status using PutMessageFeedback .
        @[JSON::Field(key: "MessageFeedbackEnabled")]
        getter message_feedback_enabled : Bool?

        # The unique identifier of the protect configuration to use.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String?

        # How long the media message is valid for. By default this is 72 hours.
        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        def initialize(
          @destination_phone_number : String,
          @origination_identity : String,
          @configuration_set_name : String? = nil,
          @context : Hash(String, String)? = nil,
          @dry_run : Bool? = nil,
          @max_price : String? = nil,
          @media_urls : Array(String)? = nil,
          @message_body : String? = nil,
          @message_feedback_enabled : Bool? = nil,
          @protect_configuration_id : String? = nil,
          @time_to_live : Int32? = nil
        )
        end
      end

      struct SendMediaMessageResult
        include JSON::Serializable

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      struct SendTextMessageRequest
        include JSON::Serializable

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The name of the configuration set to use. This can be either the ConfigurationSetName or
        # ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # You can specify custom data in this field. If you do, that data is logged to the event destination.
        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # This field is used for any country-specific registration requirements. Currently, this setting is
        # only used when you send messages to recipients in India using a sender ID. For more information see
        # Special requirements for sending SMS messages to recipients in India . IN_ENTITY_ID The entity ID or
        # Principal Entity (PE) ID that you received after completing the sender ID registration process.
        # IN_TEMPLATE_ID The template ID that you received after completing the sender ID registration
        # process. Make sure that the Template ID that you specify matches your message template exactly. If
        # your message doesn't match the template that you provided during the registration process, the
        # mobile carriers might reject your message.
        @[JSON::Field(key: "DestinationCountryParameters")]
        getter destination_country_parameters : Hash(String, String)?

        # When set to true, the message is checked and validated, but isn't sent to the end recipient. You are
        # not charged for using DryRun . The Message Parts per Second (MPS) limit when using DryRun is five.
        # If your origination identity has a lower MPS limit then the lower MPS limit is used. For more
        # information about MPS limits, see Message Parts per Second (MPS) limits in the End User Messaging
        # SMS User Guide ..
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # When you register a short code in the US, you must specify a program name. If you don’t have a US
        # short code, omit this attribute.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String?

        # The maximum amount that you want to spend, in US dollars, per each text message. If the calculated
        # amount to send the text message is greater than MaxPrice , the message is not sent and an error is
        # returned.
        @[JSON::Field(key: "MaxPrice")]
        getter max_price : String?

        # The body of the text message.
        @[JSON::Field(key: "MessageBody")]
        getter message_body : String?

        # Set to true to enable message feedback for the message. When a user receives the message you need to
        # update the message status using PutMessageFeedback .
        @[JSON::Field(key: "MessageFeedbackEnabled")]
        getter message_feedback_enabled : Bool?

        # The type of message. Valid values are for messages that are critical or time-sensitive and
        # PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The origination identity of the message. This can be either the PhoneNumber, PhoneNumberId,
        # PhoneNumberArn, SenderId, SenderIdArn, PoolId, or PoolArn. If you are using a shared End User
        # Messaging SMS resource then you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String?

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String?

        # How long the text message is valid for, in seconds. By default this is 72 hours. If the messages
        # isn't handed off before the TTL expires we stop attempting to hand off the message and return
        # TTL_EXPIRED event.
        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        def initialize(
          @destination_phone_number : String,
          @configuration_set_name : String? = nil,
          @context : Hash(String, String)? = nil,
          @destination_country_parameters : Hash(String, String)? = nil,
          @dry_run : Bool? = nil,
          @keyword : String? = nil,
          @max_price : String? = nil,
          @message_body : String? = nil,
          @message_feedback_enabled : Bool? = nil,
          @message_type : String? = nil,
          @origination_identity : String? = nil,
          @protect_configuration_id : String? = nil,
          @time_to_live : Int32? = nil
        )
        end
      end

      struct SendTextMessageResult
        include JSON::Serializable

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      struct SendVoiceMessageRequest
        include JSON::Serializable

        # The destination phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The origination identity to use for the voice call. This can be the PhoneNumber, PhoneNumberId,
        # PhoneNumberArn, PoolId, or PoolArn. If you are using a shared End User Messaging SMS resource then
        # you must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # The name of the configuration set to use. This can be either the ConfigurationSetName or
        # ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # You can specify custom data in this field. If you do, that data is logged to the event destination.
        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # When set to true, the message is checked and validated, but isn't sent to the end recipient.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The maximum amount to spend per voice message, in US dollars.
        @[JSON::Field(key: "MaxPricePerMinute")]
        getter max_price_per_minute : String?

        # The text to convert to a voice message.
        @[JSON::Field(key: "MessageBody")]
        getter message_body : String?

        # Specifies if the MessageBody field contains text or speech synthesis markup language (SSML) . TEXT:
        # This is the default value. When used the maximum character limit is 3000. SSML: When used the
        # maximum character limit is 6000 including SSML tagging.
        @[JSON::Field(key: "MessageBodyTextType")]
        getter message_body_text_type : String?

        # Set to true to enable message feedback for the message. When a user receives the message you need to
        # update the message status using PutMessageFeedback .
        @[JSON::Field(key: "MessageFeedbackEnabled")]
        getter message_feedback_enabled : Bool?

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String?

        # How long the voice message is valid for. By default this is 72 hours.
        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        # The voice for the Amazon Polly service to use. By default this is set to "MATTHEW".
        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        def initialize(
          @destination_phone_number : String,
          @origination_identity : String,
          @configuration_set_name : String? = nil,
          @context : Hash(String, String)? = nil,
          @dry_run : Bool? = nil,
          @max_price_per_minute : String? = nil,
          @message_body : String? = nil,
          @message_body_text_type : String? = nil,
          @message_feedback_enabled : Bool? = nil,
          @protect_configuration_id : String? = nil,
          @time_to_live : Int32? = nil,
          @voice_id : String? = nil
        )
        end
      end

      struct SendVoiceMessageResult
        include JSON::Serializable

        # The unique identifier for the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # The alphanumeric sender ID in a specific country that you want to describe. For more information on
      # sender IDs see Requesting sender IDs in the End User Messaging SMS User Guide .
      struct SenderIdAndCountry
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The unique identifier of the sender.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        def initialize(
          @iso_country_code : String,
          @sender_id : String
        )
        end
      end

      # The information for a sender ID that meets a specified criteria.
      struct SenderIdFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The information for all SenderIds in an Amazon Web Services account.
      struct SenderIdInformation
        include JSON::Serializable

        # By default this is set to false. When set to true the sender ID can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)

        # The monthly leasing price, in US dollars.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String

        # True if the sender ID is registered.
        @[JSON::Field(key: "Registered")]
        getter registered : Bool

        # The alphanumeric sender ID in a specific country that you'd like to describe.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # The Amazon Resource Name (ARN) associated with the SenderId.
        @[JSON::Field(key: "SenderIdArn")]
        getter sender_id_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        def initialize(
          @deletion_protection_enabled : Bool,
          @iso_country_code : String,
          @message_types : Array(String),
          @monthly_leasing_price : String,
          @registered : Bool,
          @sender_id : String,
          @sender_id_arn : String,
          @registration_id : String? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      struct SetAccountDefaultProtectConfigurationRequest
        include JSON::Serializable

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @protect_configuration_id : String
        )
        end
      end

      struct SetAccountDefaultProtectConfigurationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the account default protect configuration.
        @[JSON::Field(key: "DefaultProtectConfigurationArn")]
        getter default_protect_configuration_arn : String

        # The unique identifier of the account default protect configuration.
        @[JSON::Field(key: "DefaultProtectConfigurationId")]
        getter default_protect_configuration_id : String

        def initialize(
          @default_protect_configuration_arn : String,
          @default_protect_configuration_id : String
        )
        end
      end

      struct SetDefaultMessageFeedbackEnabledRequest
        include JSON::Serializable

        # The name of the configuration set to use. This can be either the ConfigurationSetName or
        # ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # Set to true to enable message feedback.
        @[JSON::Field(key: "MessageFeedbackEnabled")]
        getter message_feedback_enabled : Bool

        def initialize(
          @configuration_set_name : String,
          @message_feedback_enabled : Bool
        )
        end
      end

      struct SetDefaultMessageFeedbackEnabledResult
        include JSON::Serializable

        # The arn of the configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # True if message feedback is enabled.
        @[JSON::Field(key: "MessageFeedbackEnabled")]
        getter message_feedback_enabled : Bool?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @message_feedback_enabled : Bool? = nil
        )
        end
      end

      struct SetDefaultMessageTypeRequest
        include JSON::Serializable

        # The configuration set to update with a new default message type. This field can be the
        # ConsigurationSetName or ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String

        def initialize(
          @configuration_set_name : String,
          @message_type : String
        )
        end
      end

      struct SetDefaultMessageTypeResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set that was updated.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The new default message type of the configuration set.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @message_type : String? = nil
        )
        end
      end

      struct SetDefaultSenderIdRequest
        include JSON::Serializable

        # The configuration set to updated with a new default SenderId. This field can be the
        # ConsigurationSetName or ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The current sender ID for the configuration set. When sending a text message to a destination
        # country which supports SenderIds, the default sender ID on the configuration set specified on
        # SendTextMessage will be used if no dedicated origination phone numbers or registered SenderIds are
        # available in your account, instead of a generic sender ID, such as 'NOTICE'.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        def initialize(
          @configuration_set_name : String,
          @sender_id : String
        )
        end
      end

      struct SetDefaultSenderIdResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated configuration set.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set that was updated.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The default sender ID to set for the ConfigurationSet.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @sender_id : String? = nil
        )
        end
      end

      struct SetMediaMessageSpendLimitOverrideRequest
        include JSON::Serializable

        # The new monthly limit to enforce on text messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64

        def initialize(
          @monthly_limit : Int64
        )
        end
      end

      struct SetMediaMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit to enforce on sending text messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      struct SetTextMessageSpendLimitOverrideRequest
        include JSON::Serializable

        # The new monthly limit to enforce on text messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64

        def initialize(
          @monthly_limit : Int64
        )
        end
      end

      struct SetTextMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit to enforce on sending text messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      struct SetVoiceMessageSpendLimitOverrideRequest
        include JSON::Serializable

        # The new monthly limit to enforce on voice messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64

        def initialize(
          @monthly_limit : Int64
        )
        end
      end

      struct SetVoiceMessageSpendLimitOverrideResult
        include JSON::Serializable

        # The current monthly limit to enforce on sending voice messages.
        @[JSON::Field(key: "MonthlyLimit")]
        getter monthly_limit : Int64?

        def initialize(
          @monthly_limit : Int64? = nil
        )
        end
      end

      # An object that defines an Amazon SNS destination for events. You can use Amazon SNS to send
      # notification when certain events occur.
      struct SnsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish events to.
        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # Describes the current monthly spend limits for sending voice and text messages. For more information
      # on increasing your monthly spend limit, see Requesting a spending quota increase in the End User
      # Messaging SMS User Guide .
      struct SpendLimit
        include JSON::Serializable

        # The maximum amount of money, in US dollars, that you want to be able to spend sending messages each
        # month. This value has to be less than or equal to the amount in MaxLimit . To use this custom limit,
        # Overridden must be set to true.
        @[JSON::Field(key: "EnforcedLimit")]
        getter enforced_limit : Int64

        # The maximum amount of money that you are able to spend to send messages each month, in US dollars.
        @[JSON::Field(key: "MaxLimit")]
        getter max_limit : Int64

        # The name for the SpendLimit.
        @[JSON::Field(key: "Name")]
        getter name : String

        # When set to True , the value that has been specified in the EnforcedLimit is used to determine the
        # maximum amount in US dollars that can be spent to send messages each month, in US dollars.
        @[JSON::Field(key: "Overridden")]
        getter overridden : Bool

        def initialize(
          @enforced_limit : Int64,
          @max_limit : Int64,
          @name : String,
          @overridden : Bool
        )
        end
      end

      struct SubmitRegistrationVersionRequest
        include JSON::Serializable

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # Set to true to request AWS review of the registration. When enabled, AWS will perform additional
        # validation and review of the registration submission before processing.
        @[JSON::Field(key: "AwsReview")]
        getter aws_review : Bool?

        def initialize(
          @registration_id : String,
          @aws_review : Bool? = nil
        )
        end
      end

      struct SubmitRegistrationVersionResult
        include JSON::Serializable

        # Indicates whether AWS review was requested for this registration submission.
        @[JSON::Field(key: "AwsReview")]
        getter aws_review : Bool

        # The Amazon Resource Name (ARN) for the registration.
        @[JSON::Field(key: "RegistrationArn")]
        getter registration_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The status of the registration version. APPROVED : Your registration has been approved. ARCHIVED :
        # Your previously approved registration version moves into this status when a more recently submitted
        # version is approved. DENIED : You must fix your registration and resubmit it. DISCARDED : You've
        # abandon this version of their registration to start over with a new version. DRAFT : The initial
        # status of a registration version after it’s created. REQUIRES_AUTHENTICATION : You need to complete
        # email authentication. REVIEWING : Your registration has been accepted and is being reviewed. REVOKED
        # : Your previously approved registration has been revoked. SUBMITTED : Your registration has been
        # submitted.
        @[JSON::Field(key: "RegistrationVersionStatus")]
        getter registration_version_status : String

        # The RegistrationVersionStatusHistory object contains the time stamps for when the reservations
        # status changes.
        @[JSON::Field(key: "RegistrationVersionStatusHistory")]
        getter registration_version_status_history : Types::RegistrationVersionStatusHistory

        # The version number of the registration.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @aws_review : Bool,
          @registration_arn : String,
          @registration_id : String,
          @registration_version_status : String,
          @registration_version_status_history : Types::RegistrationVersionStatusHistory,
          @version_number : Int64
        )
        end
      end

      # The processing rules for when a registration can be associated with an origination identity and
      # disassociated from an origination identity.
      struct SupportedAssociation
        include JSON::Serializable

        # The association behavior. ASSOCIATE_BEFORE_SUBMIT The origination identity has to be supplied when
        # creating a registration. ASSOCIATE_ON_APPROVAL This applies to all sender ID registrations. The
        # sender ID will be automatically provisioned once the registration is approved.
        # ASSOCIATE_AFTER_COMPLETE This applies to phone number registrations when you must complete a
        # registration first, then associate one or more phone numbers later. For example 10DLC campaigns and
        # long codes.
        @[JSON::Field(key: "AssociationBehavior")]
        getter association_behavior : String

        # The disassociation behavior. DISASSOCIATE_ALL_CLOSES_REGISTRATION All origination identities must be
        # disassociated from the registration before the registration can be closed.
        # DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION All origination identities must be disassociated from
        # the registration before the registration can be deleted. DELETE_REGISTRATION_DISASSOCIATES The
        # registration can be deleted and all origination identities will be disasscoiated.
        @[JSON::Field(key: "DisassociationBehavior")]
        getter disassociation_behavior : String

        # Defines the behavior of when an origination identity and registration can be associated with each
        # other.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        def initialize(
          @association_behavior : String,
          @disassociation_behavior : String,
          @resource_type : String,
          @iso_country_code : String? = nil
        )
        end
      end

      # The list of tags to be added to the specified topic.
      struct Tag
        include JSON::Serializable

        # The key identifier, or name, of the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The string value associated with the key of the tag.
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

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An array of key and value pair tags that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # Validation rules for a text field.
      struct TextValidation
        include JSON::Serializable

        # The maximum number of characters for the text field.
        @[JSON::Field(key: "MaxLength")]
        getter max_length : Int32

        # The minimum number of characters for the text field.
        @[JSON::Field(key: "MinLength")]
        getter min_length : Int32

        # The regular expression used to validate the text field.
        @[JSON::Field(key: "Pattern")]
        getter pattern : String

        def initialize(
          @max_length : Int32,
          @min_length : Int32,
          @pattern : String
        )
        end
      end

      # An error that occurred because too many requests were sent during a certain amount of time.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An array of tag key values to unassociate with the resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateEventDestinationRequest
        include JSON::Serializable

        # The configuration set to update with the new event destination. Valid values for this can be the
        # ConfigurationSetName or ConfigurationSetArn.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The name to use for the event destination.
        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        # An object that contains information about an event destination that sends data to CloudWatch Logs.
        @[JSON::Field(key: "CloudWatchLogsDestination")]
        getter cloud_watch_logs_destination : Types::CloudWatchLogsDestination?

        # When set to true logging is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that contains information about an event destination for logging to Firehose.
        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An array of event types that determine which events to log. The TEXT_SENT event type is not
        # supported.
        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)?

        # An object that contains information about an event destination that sends data to Amazon SNS.
        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @configuration_set_name : String,
          @event_destination_name : String,
          @cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
          @enabled : Bool? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @matching_event_types : Array(String)? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      struct UpdateEventDestinationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the ConfigurationSet that was updated.
        @[JSON::Field(key: "ConfigurationSetArn")]
        getter configuration_set_arn : String?

        # The name of the configuration set.
        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # An EventDestination object containing the details of where events will be logged.
        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestination?

        def initialize(
          @configuration_set_arn : String? = nil,
          @configuration_set_name : String? = nil,
          @event_destination : Types::EventDestination? = nil
        )
        end
      end

      struct UpdatePhoneNumberRequest
        include JSON::Serializable

        # The unique identifier of the phone number. Valid values for this field can be either the
        # PhoneNumberId or PhoneNumberArn. If you are using a shared End User Messaging SMS resource then you
        # must use the full Amazon Resource Name(ARN).
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String

        # By default this is set to false. When set to true the phone number can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # By default this is set to false. When set to true the international sending of phone number is
        # Enabled.
        @[JSON::Field(key: "InternationalSendingEnabled")]
        getter international_sending_enabled : Bool?

        # The OptOutList to add the phone number to. You can use either the opt out list name or the opt out
        # list ARN.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # By default this is set to false. When set to false and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @phone_number_id : String,
          @deletion_protection_enabled : Bool? = nil,
          @international_sending_enabled : Bool? = nil,
          @opt_out_list_name : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct UpdatePhoneNumberResult
        include JSON::Serializable

        # The time when the phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # When set to true the phone number can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # When set to true the international sending of phone number is Enabled.
        @[JSON::Field(key: "InternationalSendingEnabled")]
        getter international_sending_enabled : Bool?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The monthly leasing price of the phone number, in US dollars.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String?

        # Specifies if the number could be used for text messages, voice or both.
        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)?

        # The type of number that was requested.
        @[JSON::Field(key: "NumberType")]
        getter number_type : String?

        # The name of the OptOutList associated with the phone number.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The phone number that was updated.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The Amazon Resource Name (ARN) of the updated phone number.
        @[JSON::Field(key: "PhoneNumberArn")]
        getter phone_number_arn : String?

        # The unique identifier of the phone number.
        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        # This is true if self managed opt-out are enabled.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # The current status of the request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @international_sending_enabled : Bool? = nil,
          @iso_country_code : String? = nil,
          @message_type : String? = nil,
          @monthly_leasing_price : String? = nil,
          @number_capabilities : Array(String)? = nil,
          @number_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @phone_number : String? = nil,
          @phone_number_arn : String? = nil,
          @phone_number_id : String? = nil,
          @registration_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @status : String? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct UpdatePoolRequest
        include JSON::Serializable

        # The unique identifier of the pool to update. Valid values are either the PoolId or PoolArn. If you
        # are using a shared End User Messaging SMS resource then you must use the full Amazon Resource
        # Name(ARN).
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # When set to true the pool can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The OptOutList to associate with the pool. Valid values are either OptOutListName or OptOutListArn.
        # If you are using a shared End User Messaging SMS resource then you must use the full Amazon Resource
        # Name(ARN).
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # By default this is set to false. When set to false and an end recipient sends a message that begins
        # with HELP or STOP to one of your dedicated numbers, End User Messaging SMS automatically replies
        # with a customizable message and adds the end recipient to the OptOutList. When set to true you're
        # responsible for responding to HELP and STOP requests. You're also responsible for tracking and
        # honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # Indicates whether shared routes are enabled for the pool.
        @[JSON::Field(key: "SharedRoutesEnabled")]
        getter shared_routes_enabled : Bool?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @pool_id : String,
          @deletion_protection_enabled : Bool? = nil,
          @opt_out_list_name : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @shared_routes_enabled : Bool? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct UpdatePoolResult
        include JSON::Serializable

        # The time when the pool was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # When set to true the pool can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The type of message for the pool to use.
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The name of the OptOutList associated with the pool.
        @[JSON::Field(key: "OptOutListName")]
        getter opt_out_list_name : String?

        # The ARN of the pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The unique identifier of the pool.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # When set to false and an end recipient sends a message that begins with HELP or STOP to one of your
        # dedicated numbers, End User Messaging SMS automatically replies with a customizable message and adds
        # the end recipient to the OptOutList. When set to true you're responsible for responding to HELP and
        # STOP requests. You're also responsible for tracking and honoring opt-out requests.
        @[JSON::Field(key: "SelfManagedOptOutsEnabled")]
        getter self_managed_opt_outs_enabled : Bool?

        # Indicates whether shared routes are enabled for the pool.
        @[JSON::Field(key: "SharedRoutesEnabled")]
        getter shared_routes_enabled : Bool?

        # The current status of the pool update request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the two way channel.
        @[JSON::Field(key: "TwoWayChannelArn")]
        getter two_way_channel_arn : String?

        # An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.
        @[JSON::Field(key: "TwoWayChannelRole")]
        getter two_way_channel_role : String?

        # By default this is set to false. When set to true you can receive incoming text messages from your
        # end recipients.
        @[JSON::Field(key: "TwoWayEnabled")]
        getter two_way_enabled : Bool?

        def initialize(
          @created_timestamp : Time? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @message_type : String? = nil,
          @opt_out_list_name : String? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil,
          @self_managed_opt_outs_enabled : Bool? = nil,
          @shared_routes_enabled : Bool? = nil,
          @status : String? = nil,
          @two_way_channel_arn : String? = nil,
          @two_way_channel_role : String? = nil,
          @two_way_enabled : Bool? = nil
        )
        end
      end

      struct UpdateProtectConfigurationCountryRuleSetRequest
        include JSON::Serializable

        # A map of ProtectConfigurationCountryRuleSetInformation objects that contain the details for the
        # requested NumberCapability. The Key is the two-letter ISO country code. For a list of supported ISO
        # country codes, see Supported countries and regions (SMS channel) in the End User Messaging SMS User
        # Guide. For example, to set the United States as allowed and Canada as blocked, the
        # CountryRuleSetUpdates would be formatted as: "CountryRuleSetUpdates": { "US" : { "ProtectStatus":
        # "ALLOW" } "CA" : { "ProtectStatus": "BLOCK" } }
        @[JSON::Field(key: "CountryRuleSetUpdates")]
        getter country_rule_set_updates : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation)

        # The number capability to apply the CountryRuleSetUpdates updates to.
        @[JSON::Field(key: "NumberCapability")]
        getter number_capability : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @country_rule_set_updates : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation),
          @number_capability : String,
          @protect_configuration_id : String
        )
        end
      end

      struct UpdateProtectConfigurationCountryRuleSetResult
        include JSON::Serializable

        # An array of ProtectConfigurationCountryRuleSetInformation containing the rules for the
        # NumberCapability.
        @[JSON::Field(key: "CountryRuleSet")]
        getter country_rule_set : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation)

        # The number capability that was updated
        @[JSON::Field(key: "NumberCapability")]
        getter number_capability : String

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @country_rule_set : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation),
          @number_capability : String,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct UpdateProtectConfigurationRequest
        include JSON::Serializable

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        # When set to true deletion protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        def initialize(
          @protect_configuration_id : String,
          @deletion_protection_enabled : Bool? = nil
        )
        end
      end

      struct UpdateProtectConfigurationResult
        include JSON::Serializable

        # This is true if the protect configuration is set as your account default protect configuration.
        @[JSON::Field(key: "AccountDefault")]
        getter account_default : Bool

        # The time when the protect configuration was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The status of deletion protection for the protect configuration. When set to true deletion
        # protection is enabled. By default this is set to false.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The Amazon Resource Name (ARN) of the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationArn")]
        getter protect_configuration_arn : String

        # The unique identifier for the protect configuration.
        @[JSON::Field(key: "ProtectConfigurationId")]
        getter protect_configuration_id : String

        def initialize(
          @account_default : Bool,
          @created_timestamp : Time,
          @deletion_protection_enabled : Bool,
          @protect_configuration_arn : String,
          @protect_configuration_id : String
        )
        end
      end

      struct UpdateSenderIdRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The sender ID to update.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # By default this is set to false. When set to true the sender ID can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        def initialize(
          @iso_country_code : String,
          @sender_id : String,
          @deletion_protection_enabled : Bool? = nil
        )
        end
      end

      struct UpdateSenderIdResult
        include JSON::Serializable

        # By default this is set to false. When set to true the sender ID can't be deleted.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.
        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String

        # The type of message. Valid values are TRANSACTIONAL for messages that are critical or time-sensitive
        # and PROMOTIONAL for messages that aren't critical or time-sensitive.
        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)

        # The monthly price, in US dollars, to lease the sender ID.
        @[JSON::Field(key: "MonthlyLeasingPrice")]
        getter monthly_leasing_price : String

        # True if the sender ID is registered..
        @[JSON::Field(key: "Registered")]
        getter registered : Bool

        # The sender ID that was updated.
        @[JSON::Field(key: "SenderId")]
        getter sender_id : String

        # The Amazon Resource Name (ARN) associated with the SenderId.
        @[JSON::Field(key: "SenderIdArn")]
        getter sender_id_arn : String

        # The unique identifier for the registration.
        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String?

        def initialize(
          @deletion_protection_enabled : Bool,
          @iso_country_code : String,
          @message_types : Array(String),
          @monthly_leasing_price : String,
          @registered : Bool,
          @sender_id : String,
          @sender_id_arn : String,
          @registration_id : String? = nil
        )
        end
      end

      # A validation exception for a field.
      struct ValidationException
        include JSON::Serializable

        # The field that failed validation.
        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The field associated with the validation exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message associated with the validation exception with information to help determine its cause.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The filter definition for filtering verified destination phone numbers that meets a specified
      # criteria.
      struct VerifiedDestinationNumberFilter
        include JSON::Serializable

        # The name of the attribute to filter on.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about the requested verified destintion phone number.
      struct VerifiedDestinationNumberInformation
        include JSON::Serializable

        # The time when the destination phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The verified destination phone number, in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The status of the verified destination phone number. PENDING : The phone number hasn't been verified
        # yet. VERIFIED : The phone number is verified and can receive messages.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Amazon Resource Name (ARN) for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberArn")]
        getter verified_destination_number_arn : String

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        def initialize(
          @created_timestamp : Time,
          @destination_phone_number : String,
          @status : String,
          @verified_destination_number_arn : String,
          @verified_destination_number_id : String
        )
        end
      end

      struct VerifyDestinationNumberRequest
        include JSON::Serializable

        # The verification code that was received by the verified destination phone number.
        @[JSON::Field(key: "VerificationCode")]
        getter verification_code : String

        # The unique identifier for the verififed destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        def initialize(
          @verification_code : String,
          @verified_destination_number_id : String
        )
        end
      end

      struct VerifyDestinationNumberResult
        include JSON::Serializable

        # The time when the destination phone number was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The phone number in E.164 format.
        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String

        # The status for being able to send messages to the phone number.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Amazon Resource Name (ARN) for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberArn")]
        getter verified_destination_number_arn : String

        # The unique identifier for the verified destination phone number.
        @[JSON::Field(key: "VerifiedDestinationNumberId")]
        getter verified_destination_number_id : String

        def initialize(
          @created_timestamp : Time,
          @destination_phone_number : String,
          @status : String,
          @verified_destination_number_arn : String,
          @verified_destination_number_id : String
        )
        end
      end
    end
  end
end
