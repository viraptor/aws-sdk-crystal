require "json"
require "time"

module Aws
  module PinpointSMSVoice
    module Types

      # The resource specified in your request already exists.

      struct AlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input you provided is invalid.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that defines a message that contains text formatted using Amazon Pinpoint Voice
      # Instructions markup.

      struct CallInstructionsMessageType
        include JSON::Serializable

        # The language to use when delivering the message. For a complete list of supported languages, see the
        # Amazon Polly Developer Guide.

        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # An object that contains information about an event destination that sends data to Amazon CloudWatch
      # Logs.

      struct CloudWatchLogsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Identity and Access Management (IAM) role that is able
        # to write event data to an Amazon CloudWatch destination.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The name of the Amazon CloudWatch Log Group that you want to record events in.

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @iam_role_arn : String? = nil,
          @log_group_arn : String? = nil
        )
        end
      end

      # Create a new event destination in a configuration set.

      struct CreateConfigurationSetEventDestinationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String


        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestinationDefinition?

        # A name that identifies the event destination.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String,
          @event_destination : Types::EventDestinationDefinition? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # An empty object that indicates that the event destination was created successfully.

      struct CreateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to create a new configuration set.

      struct CreateConfigurationSetRequest
        include JSON::Serializable

        # The name that you want to give the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # An empty object that indicates that the configuration set was successfully created.

      struct CreateConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfigurationSetEventDestinationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String


        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        def initialize(
          @configuration_set_name : String,
          @event_destination_name : String
        )
        end
      end

      # An empty object that indicates that the event destination was deleted successfully.

      struct DeleteConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfigurationSetRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # An empty object that indicates that the configuration set was deleted successfully.

      struct DeleteConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that defines an event destination.

      struct EventDestination
        include JSON::Serializable


        @[JSON::Field(key: "CloudWatchLogsDestination")]
        getter cloud_watch_logs_destination : Types::CloudWatchLogsDestination?

        # Indicates whether or not the event destination is enabled. If the event destination is enabled, then
        # Amazon Pinpoint sends response data to the specified event destination.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?


        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)?

        # A name that identifies the event destination configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
          @enabled : Bool? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @matching_event_types : Array(String)? = nil,
          @name : String? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      # An object that defines a single event destination.

      struct EventDestinationDefinition
        include JSON::Serializable


        @[JSON::Field(key: "CloudWatchLogsDestination")]
        getter cloud_watch_logs_destination : Types::CloudWatchLogsDestination?

        # Indicates whether or not the event destination is enabled. If the event destination is enabled, then
        # Amazon Pinpoint sends response data to the specified event destination.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?


        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)?


        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
          @enabled : Bool? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @matching_event_types : Array(String)? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end


      struct GetConfigurationSetEventDestinationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # An object that contains information about an event destination.

      struct GetConfigurationSetEventDestinationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "EventDestinations")]
        getter event_destinations : Array(Types::EventDestination)?

        def initialize(
          @event_destinations : Array(Types::EventDestination)? = nil
        )
        end
      end

      # The API encountered an unexpected error and couldn't complete the request. You might be able to
      # successfully issue the request again in the future.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains information about an event destination that sends data to Amazon Kinesis
      # Data Firehose.

      struct KinesisFirehoseDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role that can write data to an Amazon Kinesis Data Firehose
        # stream.

        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose destination that you want to use
        # in the event destination.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        def initialize(
          @delivery_stream_arn : String? = nil,
          @iam_role_arn : String? = nil
        )
        end
      end

      # There are too many instances of the specified resource type.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListConfigurationSetsRequest
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "PageSize")]
        getter page_size : String?

        def initialize(
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end

      # An object that contains information about the configuration sets for your account in the current
      # region.

      struct ListConfigurationSetsResponse
        include JSON::Serializable

        # An object that contains a list of configuration sets for your account in the current region.

        @[JSON::Field(key: "ConfigurationSets")]
        getter configuration_sets : Array(String)?

        # A token returned from a previous call to ListConfigurationSets to indicate the position in the list
        # of configuration sets.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_sets : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The resource you attempted to access doesn't exist.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that defines a message that contains unformatted text.

      struct PlainTextMessageType
        include JSON::Serializable

        # The language to use when delivering the message. For a complete list of supported languages, see the
        # Amazon Polly Developer Guide.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The plain (not SSML-formatted) text to deliver to the recipient.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # The name of the voice that you want to use to deliver the message. For a complete list of supported
        # voices, see the Amazon Polly Developer Guide.

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        def initialize(
          @language_code : String? = nil,
          @text : String? = nil,
          @voice_id : String? = nil
        )
        end
      end

      # An object that defines a message that contains SSML-formatted text.

      struct SSMLMessageType
        include JSON::Serializable

        # The language to use when delivering the message. For a complete list of supported languages, see the
        # Amazon Polly Developer Guide.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The SSML-formatted text to deliver to the recipient.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # The name of the voice that you want to use to deliver the message. For a complete list of supported
        # voices, see the Amazon Polly Developer Guide.

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        def initialize(
          @language_code : String? = nil,
          @text : String? = nil,
          @voice_id : String? = nil
        )
        end
      end

      # A request to create and send a new voice message.

      struct SendVoiceMessageRequest
        include JSON::Serializable

        # The phone number that appears on recipients' devices when they receive the message.

        @[JSON::Field(key: "CallerId")]
        getter caller_id : String?

        # The name of the configuration set that you want to use to send the message.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?


        @[JSON::Field(key: "Content")]
        getter content : Types::VoiceMessageContent?

        # The phone number that you want to send the voice message to.

        @[JSON::Field(key: "DestinationPhoneNumber")]
        getter destination_phone_number : String?

        # The phone number that Amazon Pinpoint should use to send the voice message. This isn't necessarily
        # the phone number that appears on recipients' devices when they receive the message, because you can
        # specify a CallerId parameter in the request.

        @[JSON::Field(key: "OriginationPhoneNumber")]
        getter origination_phone_number : String?

        def initialize(
          @caller_id : String? = nil,
          @configuration_set_name : String? = nil,
          @content : Types::VoiceMessageContent? = nil,
          @destination_phone_number : String? = nil,
          @origination_phone_number : String? = nil
        )
        end
      end

      # An object that that contains the Message ID of a Voice message that was sent successfully.

      struct SendVoiceMessageResponse
        include JSON::Serializable

        # A unique identifier for the voice message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # An object that contains information about an event destination that sends data to Amazon SNS.

      struct SnsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish events to.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @topic_arn : String? = nil
        )
        end
      end

      # You've issued too many requests to the resource. Wait a few minutes, and then try again.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that defines a request to update an existing event destination.

      struct UpdateConfigurationSetEventDestinationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String


        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String


        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestinationDefinition?

        def initialize(
          @configuration_set_name : String,
          @event_destination_name : String,
          @event_destination : Types::EventDestinationDefinition? = nil
        )
        end
      end

      # An empty object that indicates that the event destination was updated successfully.

      struct UpdateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains a voice message and information about the recipient that you want to send it
      # to.

      struct VoiceMessageContent
        include JSON::Serializable


        @[JSON::Field(key: "CallInstructionsMessage")]
        getter call_instructions_message : Types::CallInstructionsMessageType?


        @[JSON::Field(key: "PlainTextMessage")]
        getter plain_text_message : Types::PlainTextMessageType?


        @[JSON::Field(key: "SSMLMessage")]
        getter ssml_message : Types::SSMLMessageType?

        def initialize(
          @call_instructions_message : Types::CallInstructionsMessageType? = nil,
          @plain_text_message : Types::PlainTextMessageType? = nil,
          @ssml_message : Types::SSMLMessageType? = nil
        )
        end
      end
    end
  end
end
