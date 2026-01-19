require "json"
require "time"

module AwsSdk
  module IoTEvents
    module Types

      # Specifies whether to get notified for alarm state changes.
      struct AcknowledgeFlow
        include JSON::Serializable

        # The value must be TRUE or FALSE . If TRUE , you receive a notification when the alarm state changes.
        # You must choose to acknowledge the notification before the alarm state can return to NORMAL . If
        # FALSE , you won't receive notifications. The alarm automatically changes to the NORMAL state when
        # the input property value returns to the specified range.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # An action to be performed when the condition is TRUE.
      struct Action
        include JSON::Serializable

        # Information needed to clear the timer.
        @[JSON::Field(key: "clearTimer")]
        getter clear_timer : Types::ClearTimerAction?

        # Writes to the DynamoDB table that you created. The default action payload contains all
        # attribute-value pairs that have the information about the detector model instance and the event that
        # triggered the action. You can customize the payload . One column of the DynamoDB table receives all
        # attribute-value pairs in the payload that you specify. For more information, see Actions in AWS IoT
        # Events Developer Guide .
        @[JSON::Field(key: "dynamoDB")]
        getter dynamo_db : Types::DynamoDBAction?

        # Writes to the DynamoDB table that you created. The default action payload contains all
        # attribute-value pairs that have the information about the detector model instance and the event that
        # triggered the action. You can customize the payload . A separate column of the DynamoDB table
        # receives one attribute-value pair in the payload that you specify. For more information, see Actions
        # in AWS IoT Events Developer Guide .
        @[JSON::Field(key: "dynamoDBv2")]
        getter dynamo_d_bv2 : Types::DynamoDBv2Action?

        # Sends information about the detector model instance and the event that triggered the action to an
        # Amazon Kinesis Data Firehose delivery stream.
        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseAction?

        # Sends AWS IoT Events input, which passes information about the detector model instance and the event
        # that triggered the action.
        @[JSON::Field(key: "iotEvents")]
        getter iot_events : Types::IotEventsAction?

        # Sends information about the detector model instance and the event that triggered the action to an
        # asset property in AWS IoT SiteWise .
        @[JSON::Field(key: "iotSiteWise")]
        getter iot_site_wise : Types::IotSiteWiseAction?

        # Publishes an MQTT message with the given topic to the AWS IoT message broker.
        @[JSON::Field(key: "iotTopicPublish")]
        getter iot_topic_publish : Types::IotTopicPublishAction?

        # Calls a Lambda function, passing in information about the detector model instance and the event that
        # triggered the action.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaAction?

        # Information needed to reset the timer.
        @[JSON::Field(key: "resetTimer")]
        getter reset_timer : Types::ResetTimerAction?

        # Information needed to set the timer.
        @[JSON::Field(key: "setTimer")]
        getter set_timer : Types::SetTimerAction?

        # Sets a variable to a specified value.
        @[JSON::Field(key: "setVariable")]
        getter set_variable : Types::SetVariableAction?

        # Sends an Amazon SNS message.
        @[JSON::Field(key: "sns")]
        getter sns : Types::SNSTopicPublishAction?

        # Sends information about the detector model instance and the event that triggered the action to an
        # Amazon SQS queue.
        @[JSON::Field(key: "sqs")]
        getter sqs : Types::SqsAction?

        def initialize(
          @clear_timer : Types::ClearTimerAction? = nil,
          @dynamo_db : Types::DynamoDBAction? = nil,
          @dynamo_d_bv2 : Types::DynamoDBv2Action? = nil,
          @firehose : Types::FirehoseAction? = nil,
          @iot_events : Types::IotEventsAction? = nil,
          @iot_site_wise : Types::IotSiteWiseAction? = nil,
          @iot_topic_publish : Types::IotTopicPublishAction? = nil,
          @lambda : Types::LambdaAction? = nil,
          @reset_timer : Types::ResetTimerAction? = nil,
          @set_timer : Types::SetTimerAction? = nil,
          @set_variable : Types::SetVariableAction? = nil,
          @sns : Types::SNSTopicPublishAction? = nil,
          @sqs : Types::SqsAction? = nil
        )
        end
      end

      # Specifies one of the following actions to receive notifications when the alarm state changes.
      struct AlarmAction
        include JSON::Serializable

        @[JSON::Field(key: "dynamoDB")]
        getter dynamo_db : Types::DynamoDBAction?

        @[JSON::Field(key: "dynamoDBv2")]
        getter dynamo_d_bv2 : Types::DynamoDBv2Action?

        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseAction?

        @[JSON::Field(key: "iotEvents")]
        getter iot_events : Types::IotEventsAction?

        @[JSON::Field(key: "iotSiteWise")]
        getter iot_site_wise : Types::IotSiteWiseAction?

        @[JSON::Field(key: "iotTopicPublish")]
        getter iot_topic_publish : Types::IotTopicPublishAction?

        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaAction?

        @[JSON::Field(key: "sns")]
        getter sns : Types::SNSTopicPublishAction?

        @[JSON::Field(key: "sqs")]
        getter sqs : Types::SqsAction?

        def initialize(
          @dynamo_db : Types::DynamoDBAction? = nil,
          @dynamo_d_bv2 : Types::DynamoDBv2Action? = nil,
          @firehose : Types::FirehoseAction? = nil,
          @iot_events : Types::IotEventsAction? = nil,
          @iot_site_wise : Types::IotSiteWiseAction? = nil,
          @iot_topic_publish : Types::IotTopicPublishAction? = nil,
          @lambda : Types::LambdaAction? = nil,
          @sns : Types::SNSTopicPublishAction? = nil,
          @sqs : Types::SqsAction? = nil
        )
        end
      end

      # Contains the configuration information of alarm state changes.
      struct AlarmCapabilities
        include JSON::Serializable

        # Specifies whether to get notified for alarm state changes.
        @[JSON::Field(key: "acknowledgeFlow")]
        getter acknowledge_flow : Types::AcknowledgeFlow?

        # Specifies the default alarm state. The configuration applies to all alarms that were created based
        # on this alarm model.
        @[JSON::Field(key: "initializationConfiguration")]
        getter initialization_configuration : Types::InitializationConfiguration?

        def initialize(
          @acknowledge_flow : Types::AcknowledgeFlow? = nil,
          @initialization_configuration : Types::InitializationConfiguration? = nil
        )
        end
      end

      # Contains information about one or more alarm actions.
      struct AlarmEventActions
        include JSON::Serializable

        # Specifies one or more supported actions to receive notifications when the alarm state changes.
        @[JSON::Field(key: "alarmActions")]
        getter alarm_actions : Array(Types::AlarmAction)?

        def initialize(
          @alarm_actions : Array(Types::AlarmAction)? = nil
        )
        end
      end

      # Contains a summary of an alarm model.
      struct AlarmModelSummary
        include JSON::Serializable

        # The description of the alarm model.
        @[JSON::Field(key: "alarmModelDescription")]
        getter alarm_model_description : String?

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String?

        # The time the alarm model was created, in the Unix epoch format.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        def initialize(
          @alarm_model_description : String? = nil,
          @alarm_model_name : String? = nil,
          @creation_time : Time? = nil
        )
        end
      end

      # Contains a summary of an alarm model version.
      struct AlarmModelVersionSummary
        include JSON::Serializable

        # The ARN of the alarm model. For more information, see Amazon Resource Names (ARNs) in the AWS
        # General Reference .
        @[JSON::Field(key: "alarmModelArn")]
        getter alarm_model_arn : String?

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String?

        # The version of the alarm model.
        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # The time the alarm model was created, in the Unix epoch format.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time the alarm model was last updated, in the Unix epoch format.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The ARN of the IAM role that allows the alarm to perform actions and access AWS resources. For more
        # information, see Amazon Resource Names (ARNs) in the AWS General Reference .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the alarm model. The status can be one of the following values: ACTIVE - The alarm
        # model is active and it's ready to evaluate data. ACTIVATING - AWS IoT Events is activating your
        # alarm model. Activating an alarm model can take up to a few minutes. INACTIVE - The alarm model is
        # inactive, so it isn't ready to evaluate data. Check your alarm model information and update the
        # alarm model. FAILED - You couldn't create or update the alarm model. Check your alarm model
        # information and try again.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Contains information about the status of the alarm model version.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @alarm_model_arn : String? = nil,
          @alarm_model_name : String? = nil,
          @alarm_model_version : String? = nil,
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains information about one or more notification actions.
      struct AlarmNotification
        include JSON::Serializable

        # Contains the notification settings of an alarm model. The settings apply to all alarms that were
        # created based on this alarm model.
        @[JSON::Field(key: "notificationActions")]
        getter notification_actions : Array(Types::NotificationAction)?

        def initialize(
          @notification_actions : Array(Types::NotificationAction)? = nil
        )
        end
      end

      # Defines when your alarm is invoked.
      struct AlarmRule
        include JSON::Serializable

        # A rule that compares an input property value to a threshold value with a comparison operator.
        @[JSON::Field(key: "simpleRule")]
        getter simple_rule : Types::SimpleRule?

        def initialize(
          @simple_rule : Types::SimpleRule? = nil
        )
        end
      end

      # Contains the result of the analysis.
      struct AnalysisResult
        include JSON::Serializable

        # The severity level of the analysis result. Based on the severity level, analysis results fall into
        # three general categories: INFO - An information result tells you about a significant field in your
        # detector model. This type of result usually doesn't require immediate action. WARNING - A warning
        # result draws special attention to fields that might cause issues for your detector model. We
        # recommend that you review warnings and take necessary actions before you use your detector model in
        # production environments. Otherwise, the detector model might not work as expected. ERROR - An error
        # result notifies you about a problem found in your detector model. You must fix all errors before you
        # can publish your detector model.
        @[JSON::Field(key: "level")]
        getter level : String?

        # Contains one or more locations that you can use to locate the fields in your detector model that the
        # analysis result references.
        @[JSON::Field(key: "locations")]
        getter locations : Array(Types::AnalysisResultLocation)?

        # Contains additional information about the analysis result.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The type of the analysis result. Analyses fall into the following types based on the validators used
        # to generate the analysis result: supported-actions - You must specify AWS IoT Events supported
        # actions that work with other AWS services in a supported AWS Region. service-limits - Resources or
        # API operations can't exceed service quotas (also known as limits). Update your detector model or
        # request a quota increase. structure - The detector model must follow a structure that AWS IoT Events
        # supports. expression-syntax - Your expression must follow the required syntax. data-type - Data
        # types referenced in the detector model must be compatible. referenced-data - You must define the
        # data referenced in your detector model before you can use the data. referenced-resource - Resources
        # that the detector model uses must be available. For more information, see Running detector model
        # analyses in the AWS IoT Events Developer Guide .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @level : String? = nil,
          @locations : Array(Types::AnalysisResultLocation)? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information that you can use to locate the field in your detector model that the analysis
      # result references.
      struct AnalysisResultLocation
        include JSON::Serializable

        # A JsonPath expression that identifies the error field in your detector model.
        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @path : String? = nil
        )
        end
      end

      # A structure that contains timestamp information. For more information, see TimeInNanos in the AWS
      # IoT SiteWise API Reference . You must use expressions for all parameters in AssetPropertyTimestamp .
      # The expressions accept literals, operators, functions, references, and substitution templates.
      # Examples For literal values, the expressions must contain single quotes. For example, the value for
      # the timeInSeconds parameter can be '1586400675' . For references, you must specify either variables
      # or input values. For example, the value for the offsetInNanos parameter can be $variable.time . For
      # a substitution template, you must use ${} , and the template must be in single quotes. A
      # substitution template can also contain a combination of literals, operators, functions, references,
      # and substitution templates. In the following example, the value for the timeInSeconds parameter uses
      # a substitution template. '${$input.TemperatureInput.sensorData.timestamp / 1000}' For more
      # information, see Expressions in the AWS IoT Events Developer Guide .
      struct AssetPropertyTimestamp
        include JSON::Serializable

        # The timestamp, in seconds, in the Unix epoch format. The valid range is between 1-31556889864403199.
        @[JSON::Field(key: "timeInSeconds")]
        getter time_in_seconds : String

        # The nanosecond offset converted from timeInSeconds . The valid range is between 0-999999999.
        @[JSON::Field(key: "offsetInNanos")]
        getter offset_in_nanos : String?

        def initialize(
          @time_in_seconds : String,
          @offset_in_nanos : String? = nil
        )
        end
      end

      # A structure that contains value information. For more information, see AssetPropertyValue in the AWS
      # IoT SiteWise API Reference . You must use expressions for all parameters in AssetPropertyValue . The
      # expressions accept literals, operators, functions, references, and substitution templates. Examples
      # For literal values, the expressions must contain single quotes. For example, the value for the
      # quality parameter can be 'GOOD' . For references, you must specify either variables or input values.
      # For example, the value for the quality parameter can be $input.TemperatureInput.sensorData.quality .
      # For more information, see Expressions in the AWS IoT Events Developer Guide .
      struct AssetPropertyValue
        include JSON::Serializable

        # The quality of the asset property value. The value must be 'GOOD' , 'BAD' , or 'UNCERTAIN' .
        @[JSON::Field(key: "quality")]
        getter quality : String?

        # The timestamp associated with the asset property value. The default is the current event time.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::AssetPropertyTimestamp?

        # The value to send to an asset property.
        @[JSON::Field(key: "value")]
        getter value : Types::AssetPropertyVariant?

        def initialize(
          @quality : String? = nil,
          @timestamp : Types::AssetPropertyTimestamp? = nil,
          @value : Types::AssetPropertyVariant? = nil
        )
        end
      end

      # A structure that contains an asset property value. For more information, see Variant in the AWS IoT
      # SiteWise API Reference . You must use expressions for all parameters in AssetPropertyVariant . The
      # expressions accept literals, operators, functions, references, and substitution templates. Examples
      # For literal values, the expressions must contain single quotes. For example, the value for the
      # integerValue parameter can be '100' . For references, you must specify either variables or
      # parameters. For example, the value for the booleanValue parameter can be $variable.offline . For a
      # substitution template, you must use ${} , and the template must be in single quotes. A substitution
      # template can also contain a combination of literals, operators, functions, references, and
      # substitution templates. In the following example, the value for the doubleValue parameter uses a
      # substitution template. '${$input.TemperatureInput.sensorData.temperature * 6 / 5 + 32}' For more
      # information, see Expressions in the AWS IoT Events Developer Guide . You must specify one of the
      # following value types, depending on the dataType of the specified asset property. For more
      # information, see AssetProperty in the AWS IoT SiteWise API Reference .
      struct AssetPropertyVariant
        include JSON::Serializable

        # The asset property value is a Boolean value that must be 'TRUE' or 'FALSE' . You must use an
        # expression, and the evaluated result should be a Boolean value.
        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : String?

        # The asset property value is a double. You must use an expression, and the evaluated result should be
        # a double.
        @[JSON::Field(key: "doubleValue")]
        getter double_value : String?

        # The asset property value is an integer. You must use an expression, and the evaluated result should
        # be an integer.
        @[JSON::Field(key: "integerValue")]
        getter integer_value : String?

        # The asset property value is a string. You must use an expression, and the evaluated result should be
        # a string.
        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : String? = nil,
          @double_value : String? = nil,
          @integer_value : String? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The attributes from the JSON payload that are made available by the input. Inputs are derived from
      # messages sent to the AWS IoT Events system using BatchPutMessage . Each such message contains a JSON
      # payload. Those attributes (and their paired values) specified here are available for use in the
      # condition expressions used by detectors.
      struct Attribute
        include JSON::Serializable

        # An expression that specifies an attribute-value pair in a JSON structure. Use this to specify an
        # attribute from the JSON payload that is made available by the input. Inputs are derived from
        # messages sent to AWS IoT Events ( BatchPutMessage ). Each such message contains a JSON payload. The
        # attribute (and its paired value) specified here are available for use in the condition expressions
        # used by detectors. Syntax: &lt;field-name&gt;.&lt;field-name&gt;...
        @[JSON::Field(key: "jsonPath")]
        getter json_path : String

        def initialize(
          @json_path : String
        )
        end
      end

      # Information needed to clear the timer.
      struct ClearTimerAction
        include JSON::Serializable

        # The name of the timer to clear.
        @[JSON::Field(key: "timerName")]
        getter timer_name : String

        def initialize(
          @timer_name : String
        )
        end
      end

      struct CreateAlarmModelRequest
        include JSON::Serializable

        # A unique name that helps you identify the alarm model. You can't change this name after you create
        # the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # Defines when your alarm is invoked.
        @[JSON::Field(key: "alarmRule")]
        getter alarm_rule : Types::AlarmRule

        # The ARN of the IAM role that allows the alarm to perform actions and access AWS resources. For more
        # information, see Amazon Resource Names (ARNs) in the AWS General Reference .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains the configuration information of alarm state changes.
        @[JSON::Field(key: "alarmCapabilities")]
        getter alarm_capabilities : Types::AlarmCapabilities?

        # Contains information about one or more alarm actions.
        @[JSON::Field(key: "alarmEventActions")]
        getter alarm_event_actions : Types::AlarmEventActions?

        # A description that tells you what the alarm model detects.
        @[JSON::Field(key: "alarmModelDescription")]
        getter alarm_model_description : String?

        # Contains information about one or more notification actions.
        @[JSON::Field(key: "alarmNotification")]
        getter alarm_notification : Types::AlarmNotification?

        # An input attribute used as a key to create an alarm. AWS IoT Events routes inputs associated with
        # this key to the alarm.
        @[JSON::Field(key: "key")]
        getter key : String?

        # A non-negative integer that reflects the severity level of the alarm.
        @[JSON::Field(key: "severity")]
        getter severity : Int32?

        # A list of key-value pairs that contain metadata for the alarm model. The tags help you manage the
        # alarm model. For more information, see Tagging your AWS IoT Events resources in the AWS IoT Events
        # Developer Guide . You can create up to 50 tags for one alarm model.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @alarm_model_name : String,
          @alarm_rule : Types::AlarmRule,
          @role_arn : String,
          @alarm_capabilities : Types::AlarmCapabilities? = nil,
          @alarm_event_actions : Types::AlarmEventActions? = nil,
          @alarm_model_description : String? = nil,
          @alarm_notification : Types::AlarmNotification? = nil,
          @key : String? = nil,
          @severity : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAlarmModelResponse
        include JSON::Serializable

        # The ARN of the alarm model. For more information, see Amazon Resource Names (ARNs) in the AWS
        # General Reference .
        @[JSON::Field(key: "alarmModelArn")]
        getter alarm_model_arn : String?

        # The version of the alarm model.
        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # The time the alarm model was created, in the Unix epoch format.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time the alarm model was last updated, in the Unix epoch format.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the alarm model. The status can be one of the following values: ACTIVE - The alarm
        # model is active and it's ready to evaluate data. ACTIVATING - AWS IoT Events is activating your
        # alarm model. Activating an alarm model can take up to a few minutes. INACTIVE - The alarm model is
        # inactive, so it isn't ready to evaluate data. Check your alarm model information and update the
        # alarm model. FAILED - You couldn't create or update the alarm model. Check your alarm model
        # information and try again.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @alarm_model_arn : String? = nil,
          @alarm_model_version : String? = nil,
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateDetectorModelRequest
        include JSON::Serializable

        # Information that defines how the detectors operate.
        @[JSON::Field(key: "detectorModelDefinition")]
        getter detector_model_definition : Types::DetectorModelDefinition

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The ARN of the role that grants permission to AWS IoT Events to perform its operations.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A brief description of the detector model.
        @[JSON::Field(key: "detectorModelDescription")]
        getter detector_model_description : String?

        # Information about the order in which events are evaluated and how actions are executed.
        @[JSON::Field(key: "evaluationMethod")]
        getter evaluation_method : String?

        # The input attribute key used to identify a device or system to create a detector (an instance of the
        # detector model) and then to route each input received to the appropriate detector (instance). This
        # parameter uses a JSON-path expression in the message payload of each input to specify the
        # attribute-value pair that is used to identify the device associated with the input.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Metadata that can be used to manage the detector model.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @detector_model_definition : Types::DetectorModelDefinition,
          @detector_model_name : String,
          @role_arn : String,
          @detector_model_description : String? = nil,
          @evaluation_method : String? = nil,
          @key : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDetectorModelResponse
        include JSON::Serializable

        # Information about how the detector model is configured.
        @[JSON::Field(key: "detectorModelConfiguration")]
        getter detector_model_configuration : Types::DetectorModelConfiguration?

        def initialize(
          @detector_model_configuration : Types::DetectorModelConfiguration? = nil
        )
        end
      end

      struct CreateInputRequest
        include JSON::Serializable

        # The definition of the input.
        @[JSON::Field(key: "inputDefinition")]
        getter input_definition : Types::InputDefinition

        # The name you want to give to the input.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # A brief description of the input.
        @[JSON::Field(key: "inputDescription")]
        getter input_description : String?

        # Metadata that can be used to manage the input.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @input_definition : Types::InputDefinition,
          @input_name : String,
          @input_description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateInputResponse
        include JSON::Serializable

        # Information about the configuration of the input.
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::InputConfiguration?

        def initialize(
          @input_configuration : Types::InputConfiguration? = nil
        )
        end
      end

      struct DeleteAlarmModelRequest
        include JSON::Serializable

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        def initialize(
          @alarm_model_name : String
        )
        end
      end

      struct DeleteAlarmModelResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDetectorModelRequest
        include JSON::Serializable

        # The name of the detector model to be deleted.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        def initialize(
          @detector_model_name : String
        )
        end
      end

      struct DeleteDetectorModelResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteInputRequest
        include JSON::Serializable

        # The name of the input to delete.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        def initialize(
          @input_name : String
        )
        end
      end

      struct DeleteInputResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeAlarmModelRequest
        include JSON::Serializable

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The version of the alarm model.
        @[JSON::Field(key: "version")]
        getter alarm_model_version : String?

        def initialize(
          @alarm_model_name : String,
          @alarm_model_version : String? = nil
        )
        end
      end

      struct DescribeAlarmModelResponse
        include JSON::Serializable

        # Contains the configuration information of alarm state changes.
        @[JSON::Field(key: "alarmCapabilities")]
        getter alarm_capabilities : Types::AlarmCapabilities?

        # Contains information about one or more alarm actions.
        @[JSON::Field(key: "alarmEventActions")]
        getter alarm_event_actions : Types::AlarmEventActions?

        # The ARN of the alarm model. For more information, see Amazon Resource Names (ARNs) in the AWS
        # General Reference .
        @[JSON::Field(key: "alarmModelArn")]
        getter alarm_model_arn : String?

        # The description of the alarm model.
        @[JSON::Field(key: "alarmModelDescription")]
        getter alarm_model_description : String?

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String?

        # The version of the alarm model.
        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # Contains information about one or more notification actions.
        @[JSON::Field(key: "alarmNotification")]
        getter alarm_notification : Types::AlarmNotification?

        # Defines when your alarm is invoked.
        @[JSON::Field(key: "alarmRule")]
        getter alarm_rule : Types::AlarmRule?

        # The time the alarm model was created, in the Unix epoch format.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # An input attribute used as a key to create an alarm. AWS IoT Events routes inputs associated with
        # this key to the alarm.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The time the alarm model was last updated, in the Unix epoch format.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The ARN of the IAM role that allows the alarm to perform actions and access AWS resources. For more
        # information, see Amazon Resource Names (ARNs) in the AWS General Reference .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A non-negative integer that reflects the severity level of the alarm.
        @[JSON::Field(key: "severity")]
        getter severity : Int32?

        # The status of the alarm model. The status can be one of the following values: ACTIVE - The alarm
        # model is active and it's ready to evaluate data. ACTIVATING - AWS IoT Events is activating your
        # alarm model. Activating an alarm model can take up to a few minutes. INACTIVE - The alarm model is
        # inactive, so it isn't ready to evaluate data. Check your alarm model information and update the
        # alarm model. FAILED - You couldn't create or update the alarm model. Check your alarm model
        # information and try again.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Contains information about the status of the alarm model.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @alarm_capabilities : Types::AlarmCapabilities? = nil,
          @alarm_event_actions : Types::AlarmEventActions? = nil,
          @alarm_model_arn : String? = nil,
          @alarm_model_description : String? = nil,
          @alarm_model_name : String? = nil,
          @alarm_model_version : String? = nil,
          @alarm_notification : Types::AlarmNotification? = nil,
          @alarm_rule : Types::AlarmRule? = nil,
          @creation_time : Time? = nil,
          @key : String? = nil,
          @last_update_time : Time? = nil,
          @role_arn : String? = nil,
          @severity : Int32? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct DescribeDetectorModelAnalysisRequest
        include JSON::Serializable

        # The ID of the analysis result that you want to retrieve.
        @[JSON::Field(key: "analysisId")]
        getter analysis_id : String

        def initialize(
          @analysis_id : String
        )
        end
      end

      struct DescribeDetectorModelAnalysisResponse
        include JSON::Serializable

        # The status of the analysis activity. The status can be one of the following values: RUNNING - AWS
        # IoT Events is analyzing your detector model. This process can take several minutes to complete.
        # COMPLETE - AWS IoT Events finished analyzing your detector model. FAILED - AWS IoT Events couldn't
        # analyze your detector model. Try again later.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DescribeDetectorModelRequest
        include JSON::Serializable

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The version of the detector model.
        @[JSON::Field(key: "version")]
        getter detector_model_version : String?

        def initialize(
          @detector_model_name : String,
          @detector_model_version : String? = nil
        )
        end
      end

      struct DescribeDetectorModelResponse
        include JSON::Serializable

        # Information about the detector model.
        @[JSON::Field(key: "detectorModel")]
        getter detector_model : Types::DetectorModel?

        def initialize(
          @detector_model : Types::DetectorModel? = nil
        )
        end
      end

      struct DescribeInputRequest
        include JSON::Serializable

        # The name of the input.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        def initialize(
          @input_name : String
        )
        end
      end

      struct DescribeInputResponse
        include JSON::Serializable

        # Information about the input.
        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end

      struct DescribeLoggingOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeLoggingOptionsResponse
        include JSON::Serializable

        # The current settings of the AWS IoT Events logging options.
        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions?

        def initialize(
          @logging_options : Types::LoggingOptions? = nil
        )
        end
      end

      # The detector model and the specific detectors (instances) for which the logging level is given.
      struct DetectorDebugOption
        include JSON::Serializable

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The value of the input attribute key used to create the detector (the instance of the detector
        # model).
        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @detector_model_name : String,
          @key_value : String? = nil
        )
        end
      end

      # Information about the detector model.
      struct DetectorModel
        include JSON::Serializable

        # Information about how the detector is configured.
        @[JSON::Field(key: "detectorModelConfiguration")]
        getter detector_model_configuration : Types::DetectorModelConfiguration?

        # Information that defines how a detector operates.
        @[JSON::Field(key: "detectorModelDefinition")]
        getter detector_model_definition : Types::DetectorModelDefinition?

        def initialize(
          @detector_model_configuration : Types::DetectorModelConfiguration? = nil,
          @detector_model_definition : Types::DetectorModelDefinition? = nil
        )
        end
      end

      # Information about how the detector model is configured.
      struct DetectorModelConfiguration
        include JSON::Serializable

        # The time the detector model was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The ARN of the detector model.
        @[JSON::Field(key: "detectorModelArn")]
        getter detector_model_arn : String?

        # A brief description of the detector model.
        @[JSON::Field(key: "detectorModelDescription")]
        getter detector_model_description : String?

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String?

        # The version of the detector model.
        @[JSON::Field(key: "detectorModelVersion")]
        getter detector_model_version : String?

        # Information about the order in which events are evaluated and how actions are executed.
        @[JSON::Field(key: "evaluationMethod")]
        getter evaluation_method : String?

        # The value used to identify a detector instance. When a device or system sends input, a new detector
        # instance with a unique key value is created. AWS IoT Events can continue to route input to its
        # corresponding detector instance based on this identifying information. This parameter uses a
        # JSON-path expression to select the attribute-value pair in the message payload that is used for
        # identification. To route the message to the correct detector instance, the device must send a
        # message payload that contains the same attribute-value.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The time the detector model was last updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The ARN of the role that grants permission to AWS IoT Events to perform its operations.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the detector model.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @detector_model_arn : String? = nil,
          @detector_model_description : String? = nil,
          @detector_model_name : String? = nil,
          @detector_model_version : String? = nil,
          @evaluation_method : String? = nil,
          @key : String? = nil,
          @last_update_time : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information that defines how a detector operates.
      struct DetectorModelDefinition
        include JSON::Serializable

        # The state that is entered at the creation of each detector (instance).
        @[JSON::Field(key: "initialStateName")]
        getter initial_state_name : String

        # Information about the states of the detector.
        @[JSON::Field(key: "states")]
        getter states : Array(Types::State)

        def initialize(
          @initial_state_name : String,
          @states : Array(Types::State)
        )
        end
      end

      # Information about the detector model.
      struct DetectorModelSummary
        include JSON::Serializable

        # The time the detector model was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # A brief description of the detector model.
        @[JSON::Field(key: "detectorModelDescription")]
        getter detector_model_description : String?

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @detector_model_description : String? = nil,
          @detector_model_name : String? = nil
        )
        end
      end

      # Information about the detector model version.
      struct DetectorModelVersionSummary
        include JSON::Serializable

        # The time the detector model version was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The ARN of the detector model version.
        @[JSON::Field(key: "detectorModelArn")]
        getter detector_model_arn : String?

        # The name of the detector model.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String?

        # The ID of the detector model version.
        @[JSON::Field(key: "detectorModelVersion")]
        getter detector_model_version : String?

        # Information about the order in which events are evaluated and how actions are executed.
        @[JSON::Field(key: "evaluationMethod")]
        getter evaluation_method : String?

        # The last time the detector model version was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The ARN of the role that grants the detector model permission to perform its tasks.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the detector model version.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @detector_model_arn : String? = nil,
          @detector_model_name : String? = nil,
          @detector_model_version : String? = nil,
          @evaluation_method : String? = nil,
          @last_update_time : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Defines an action to write to the Amazon DynamoDB table that you created. The standard action
      # payload contains all the information about the detector model instance and the event that triggered
      # the action. You can customize the payload . One column of the DynamoDB table receives all
      # attribute-value pairs in the payload that you specify. You must use expressions for all parameters
      # in DynamoDBAction . The expressions accept literals, operators, functions, references, and
      # substitution templates. Examples For literal values, the expressions must contain single quotes. For
      # example, the value for the hashKeyType parameter can be 'STRING' . For references, you must specify
      # either variables or input values. For example, the value for the hashKeyField parameter can be
      # $input.GreenhouseInput.name . For a substitution template, you must use ${} , and the template must
      # be in single quotes. A substitution template can also contain a combination of literals, operators,
      # functions, references, and substitution templates. In the following example, the value for the
      # hashKeyValue parameter uses a substitution template. '${$input.GreenhouseInput.temperature * 6 / 5 +
      # 32} in Fahrenheit' For a string concatenation, you must use + . A string concatenation can also
      # contain a combination of literals, operators, functions, references, and substitution templates. In
      # the following example, the value for the tableName parameter uses a string concatenation.
      # 'GreenhouseTemperatureTable ' + $input.GreenhouseInput.date For more information, see Expressions in
      # the AWS IoT Events Developer Guide . If the defined payload type is a string, DynamoDBAction writes
      # non-JSON data to the DynamoDB table as binary data. The DynamoDB console displays the data as
      # Base64-encoded text. The value for the payloadField parameter is &lt;payload-field&gt;_raw .
      struct DynamoDBAction
        include JSON::Serializable

        # The name of the hash key (also called the partition key). The hashKeyField value must match the
        # partition key of the target DynamoDB table.
        @[JSON::Field(key: "hashKeyField")]
        getter hash_key_field : String

        # The value of the hash key (also called the partition key).
        @[JSON::Field(key: "hashKeyValue")]
        getter hash_key_value : String

        # The name of the DynamoDB table. The tableName value must match the table name of the target DynamoDB
        # table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The data type for the hash key (also called the partition key). You can specify the following
        # values: 'STRING' - The hash key is a string. 'NUMBER' - The hash key is a number. If you don't
        # specify hashKeyType , the default value is 'STRING' .
        @[JSON::Field(key: "hashKeyType")]
        getter hash_key_type : String?

        # The type of operation to perform. You can specify the following values: 'INSERT' - Insert data as a
        # new item into the DynamoDB table. This item uses the specified hash key as a partition key. If you
        # specified a range key, the item uses the range key as a sort key. 'UPDATE' - Update an existing item
        # of the DynamoDB table with new data. This item's partition key must match the specified hash key. If
        # you specified a range key, the range key must match the item's sort key. 'DELETE' - Delete an
        # existing item of the DynamoDB table. This item's partition key must match the specified hash key. If
        # you specified a range key, the range key must match the item's sort key. If you don't specify this
        # parameter, AWS IoT Events triggers the 'INSERT' operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        # The name of the DynamoDB column that receives the action payload. If you don't specify this
        # parameter, the name of the DynamoDB column is payload .
        @[JSON::Field(key: "payloadField")]
        getter payload_field : String?

        # The name of the range key (also called the sort key). The rangeKeyField value must match the sort
        # key of the target DynamoDB table.
        @[JSON::Field(key: "rangeKeyField")]
        getter range_key_field : String?

        # The data type for the range key (also called the sort key), You can specify the following values:
        # 'STRING' - The range key is a string. 'NUMBER' - The range key is number. If you don't specify
        # rangeKeyField , the default value is 'STRING' .
        @[JSON::Field(key: "rangeKeyType")]
        getter range_key_type : String?

        # The value of the range key (also called the sort key).
        @[JSON::Field(key: "rangeKeyValue")]
        getter range_key_value : String?

        def initialize(
          @hash_key_field : String,
          @hash_key_value : String,
          @table_name : String,
          @hash_key_type : String? = nil,
          @operation : String? = nil,
          @payload : Types::Payload? = nil,
          @payload_field : String? = nil,
          @range_key_field : String? = nil,
          @range_key_type : String? = nil,
          @range_key_value : String? = nil
        )
        end
      end

      # Defines an action to write to the Amazon DynamoDB table that you created. The default action payload
      # contains all the information about the detector model instance and the event that triggered the
      # action. You can customize the payload . A separate column of the DynamoDB table receives one
      # attribute-value pair in the payload that you specify. You must use expressions for all parameters in
      # DynamoDBv2Action . The expressions accept literals, operators, functions, references, and
      # substitution templates. Examples For literal values, the expressions must contain single quotes. For
      # example, the value for the tableName parameter can be 'GreenhouseTemperatureTable' . For references,
      # you must specify either variables or input values. For example, the value for the tableName
      # parameter can be $variable.ddbtableName . For a substitution template, you must use ${} , and the
      # template must be in single quotes. A substitution template can also contain a combination of
      # literals, operators, functions, references, and substitution templates. In the following example,
      # the value for the contentExpression parameter in Payload uses a substitution template.
      # '{\"sensorID\": \"${$input.GreenhouseInput.sensor_id}\", \"temperature\":
      # \"${$input.GreenhouseInput.temperature * 9 / 5 + 32}\"}' For a string concatenation, you must use +
      # . A string concatenation can also contain a combination of literals, operators, functions,
      # references, and substitution templates. In the following example, the value for the tableName
      # parameter uses a string concatenation. 'GreenhouseTemperatureTable ' + $input.GreenhouseInput.date
      # For more information, see Expressions in the AWS IoT Events Developer Guide . The value for the type
      # parameter in Payload must be JSON .
      struct DynamoDBv2Action
        include JSON::Serializable

        # The name of the DynamoDB table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        def initialize(
          @table_name : String,
          @payload : Types::Payload? = nil
        )
        end
      end

      # Contains the configuration information of email notifications.
      struct EmailConfiguration
        include JSON::Serializable

        # The email address that sends emails. If you use the AWS IoT Events managed AWS Lambda function to
        # manage your emails, you must verify the email address that sends emails in Amazon SES .
        @[JSON::Field(key: "from")]
        getter from : String

        # Contains the information of one or more recipients who receive the emails. You must add the users
        # that receive emails to your AWS SSO store .
        @[JSON::Field(key: "recipients")]
        getter recipients : Types::EmailRecipients

        # Contains the subject and message of an email.
        @[JSON::Field(key: "content")]
        getter content : Types::EmailContent?

        def initialize(
          @from : String,
          @recipients : Types::EmailRecipients,
          @content : Types::EmailContent? = nil
        )
        end
      end

      # Contains the subject and message of an email.
      struct EmailContent
        include JSON::Serializable

        # The message that you want to send. The message can be up to 200 characters.
        @[JSON::Field(key: "additionalMessage")]
        getter additional_message : String?

        # The subject of the email.
        @[JSON::Field(key: "subject")]
        getter subject : String?

        def initialize(
          @additional_message : String? = nil,
          @subject : String? = nil
        )
        end
      end

      # Contains the information of one or more recipients who receive the emails. You must add the users
      # that receive emails to your AWS SSO store .
      struct EmailRecipients
        include JSON::Serializable

        # Specifies one or more recipients who receive the email.
        @[JSON::Field(key: "to")]
        getter to : Array(Types::RecipientDetail)?

        def initialize(
          @to : Array(Types::RecipientDetail)? = nil
        )
        end
      end

      # Specifies the actions to be performed when the condition evaluates to TRUE.
      struct Event
        include JSON::Serializable

        # The name of the event.
        @[JSON::Field(key: "eventName")]
        getter event_name : String

        # The actions to be performed.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        # Optional. The Boolean expression that, when TRUE, causes the actions to be performed. If not
        # present, the actions are performed (=TRUE). If the expression result is not a Boolean value, the
        # actions are not performed (=FALSE).
        @[JSON::Field(key: "condition")]
        getter condition : String?

        def initialize(
          @event_name : String,
          @actions : Array(Types::Action)? = nil,
          @condition : String? = nil
        )
        end
      end

      # Sends information about the detector model instance and the event that triggered the action to an
      # Amazon Kinesis Data Firehose delivery stream.
      struct FirehoseAction
        include JSON::Serializable

        # The name of the Kinesis Data Firehose delivery stream where the data is written.
        @[JSON::Field(key: "deliveryStreamName")]
        getter delivery_stream_name : String

        # You can configure the action payload when you send a message to an Amazon Kinesis Data Firehose
        # delivery stream.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        # A character separator that is used to separate records written to the Kinesis Data Firehose delivery
        # stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).
        @[JSON::Field(key: "separator")]
        getter separator : String?

        def initialize(
          @delivery_stream_name : String,
          @payload : Types::Payload? = nil,
          @separator : String? = nil
        )
        end
      end

      struct GetDetectorModelAnalysisResultsRequest
        include JSON::Serializable

        # The ID of the analysis result that you want to retrieve.
        @[JSON::Field(key: "analysisId")]
        getter analysis_id : String

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @analysis_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetDetectorModelAnalysisResultsResponse
        include JSON::Serializable

        # Contains information about one or more analysis results.
        @[JSON::Field(key: "analysisResults")]
        getter analysis_results : Array(Types::AnalysisResult)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @analysis_results : Array(Types::AnalysisResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies the default alarm state. The configuration applies to all alarms that were created based
      # on this alarm model.
      struct InitializationConfiguration
        include JSON::Serializable

        # The value must be TRUE or FALSE . If FALSE , all alarm instances created based on the alarm model
        # are activated. The default value is TRUE .
        @[JSON::Field(key: "disabledOnInitialization")]
        getter disabled_on_initialization : Bool

        def initialize(
          @disabled_on_initialization : Bool
        )
        end
      end

      # Information about the input.
      struct Input
        include JSON::Serializable

        # Information about the configuration of an input.
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::InputConfiguration?

        # The definition of the input.
        @[JSON::Field(key: "inputDefinition")]
        getter input_definition : Types::InputDefinition?

        def initialize(
          @input_configuration : Types::InputConfiguration? = nil,
          @input_definition : Types::InputDefinition? = nil
        )
        end
      end

      # Information about the configuration of an input.
      struct InputConfiguration
        include JSON::Serializable

        # The time the input was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ARN of the input.
        @[JSON::Field(key: "inputArn")]
        getter input_arn : String

        # The name of the input.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # The last time the input was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time

        # The status of the input.
        @[JSON::Field(key: "status")]
        getter status : String

        # A brief description of the input.
        @[JSON::Field(key: "inputDescription")]
        getter input_description : String?

        def initialize(
          @creation_time : Time,
          @input_arn : String,
          @input_name : String,
          @last_update_time : Time,
          @status : String,
          @input_description : String? = nil
        )
        end
      end

      # The definition of the input.
      struct InputDefinition
        include JSON::Serializable

        # The attributes from the JSON payload that are made available by the input. Inputs are derived from
        # messages sent to the AWS IoT Events system using BatchPutMessage . Each such message contains a JSON
        # payload, and those attributes (and their paired values) specified here are available for use in the
        # condition expressions used by detectors that monitor this input.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)

        def initialize(
          @attributes : Array(Types::Attribute)
        )
        end
      end

      # The identifer of the input.
      struct InputIdentifier
        include JSON::Serializable

        # The identifier of the input routed to AWS IoT Events.
        @[JSON::Field(key: "iotEventsInputIdentifier")]
        getter iot_events_input_identifier : Types::IotEventsInputIdentifier?

        # The identifer of the input routed from AWS IoT SiteWise.
        @[JSON::Field(key: "iotSiteWiseInputIdentifier")]
        getter iot_site_wise_input_identifier : Types::IotSiteWiseInputIdentifier?

        def initialize(
          @iot_events_input_identifier : Types::IotEventsInputIdentifier? = nil,
          @iot_site_wise_input_identifier : Types::IotSiteWiseInputIdentifier? = nil
        )
        end
      end

      # Information about the input.
      struct InputSummary
        include JSON::Serializable

        # The time the input was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The ARN of the input.
        @[JSON::Field(key: "inputArn")]
        getter input_arn : String?

        # A brief description of the input.
        @[JSON::Field(key: "inputDescription")]
        getter input_description : String?

        # The name of the input.
        @[JSON::Field(key: "inputName")]
        getter input_name : String?

        # The last time the input was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the input.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @input_arn : String? = nil,
          @input_description : String? = nil,
          @input_name : String? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An internal failure occurred.
      struct InternalFailureException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was invalid.
      struct InvalidRequestException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Sends an AWS IoT Events input, passing in information about the detector model instance and the
      # event that triggered the action.
      struct IotEventsAction
        include JSON::Serializable

        # The name of the AWS IoT Events input where the data is sent.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # You can configure the action payload when you send a message to an AWS IoT Events input.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        def initialize(
          @input_name : String,
          @payload : Types::Payload? = nil
        )
        end
      end

      # The identifier of the input routed to AWS IoT Events.
      struct IotEventsInputIdentifier
        include JSON::Serializable

        # The name of the input routed to AWS IoT Events.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        def initialize(
          @input_name : String
        )
        end
      end

      # Sends information about the detector model instance and the event that triggered the action to a
      # specified asset property in AWS IoT SiteWise. You must use expressions for all parameters in
      # IotSiteWiseAction . The expressions accept literals, operators, functions, references, and
      # substitutions templates. Examples For literal values, the expressions must contain single quotes.
      # For example, the value for the propertyAlias parameter can be
      # '/company/windfarm/3/turbine/7/temperature' . For references, you must specify either variables or
      # input values. For example, the value for the assetId parameter can be $input.TurbineInput.assetId1 .
      # For a substitution template, you must use ${} , and the template must be in single quotes. A
      # substitution template can also contain a combination of literals, operators, functions, references,
      # and substitution templates. In the following example, the value for the propertyAlias parameter uses
      # a substitution template. 'company/windfarm/${$input.TemperatureInput.sensorData.windfarmID}/turbine/
      # ${$input.TemperatureInput.sensorData.turbineID}/temperature' You must specify either propertyAlias
      # or both assetId and propertyId to identify the target asset property in AWS IoT SiteWise. For more
      # information, see Expressions in the AWS IoT Events Developer Guide .
      struct IotSiteWiseAction
        include JSON::Serializable

        # The ID of the asset that has the specified property.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # A unique identifier for this entry. You can use the entry ID to track which data entry causes an
        # error in case of failure. The default is a new unique identifier.
        @[JSON::Field(key: "entryId")]
        getter entry_id : String?

        # The alias of the asset property.
        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property.
        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The value to send to the asset property. This value contains timestamp, quality, and value (TQV)
        # information.
        @[JSON::Field(key: "propertyValue")]
        getter property_value : Types::AssetPropertyValue?

        def initialize(
          @asset_id : String? = nil,
          @entry_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @property_value : Types::AssetPropertyValue? = nil
        )
        end
      end

      # The asset model property identifer of the input routed from AWS IoT SiteWise.
      struct IotSiteWiseAssetModelPropertyIdentifier
        include JSON::Serializable

        # The ID of the AWS IoT SiteWise asset model.
        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the AWS IoT SiteWise asset property.
        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_model_id : String,
          @property_id : String
        )
        end
      end

      # The identifer of the input routed from AWS IoT SiteWise.
      struct IotSiteWiseInputIdentifier
        include JSON::Serializable

        # The identifier of the AWS IoT SiteWise asset model property.
        @[JSON::Field(key: "iotSiteWiseAssetModelPropertyIdentifier")]
        getter iot_site_wise_asset_model_property_identifier : Types::IotSiteWiseAssetModelPropertyIdentifier?

        def initialize(
          @iot_site_wise_asset_model_property_identifier : Types::IotSiteWiseAssetModelPropertyIdentifier? = nil
        )
        end
      end

      # Information required to publish the MQTT message through the AWS IoT message broker.
      struct IotTopicPublishAction
        include JSON::Serializable

        # The MQTT topic of the message. You can use a string expression that includes variables (
        # $variable.&lt;variable-name&gt; ) and input values ( $input.&lt;input-name&gt;.&lt;path-to-datum&gt;
        # ) as the topic string.
        @[JSON::Field(key: "mqttTopic")]
        getter mqtt_topic : String

        # You can configure the action payload when you publish a message to an AWS IoT Core topic.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        def initialize(
          @mqtt_topic : String,
          @payload : Types::Payload? = nil
        )
        end
      end

      # Calls a Lambda function, passing in information about the detector model instance and the event that
      # triggered the action.
      struct LambdaAction
        include JSON::Serializable

        # The ARN of the Lambda function that is executed.
        @[JSON::Field(key: "functionArn")]
        getter function_arn : String

        # You can configure the action payload when you send a message to a Lambda function.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        def initialize(
          @function_arn : String,
          @payload : Types::Payload? = nil
        )
        end
      end

      # A limit was exceeded.
      struct LimitExceededException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAlarmModelVersionsRequest
        include JSON::Serializable

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alarm_model_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAlarmModelVersionsResponse
        include JSON::Serializable

        # A list that summarizes each alarm model version.
        @[JSON::Field(key: "alarmModelVersionSummaries")]
        getter alarm_model_version_summaries : Array(Types::AlarmModelVersionSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alarm_model_version_summaries : Array(Types::AlarmModelVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAlarmModelsRequest
        include JSON::Serializable

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAlarmModelsResponse
        include JSON::Serializable

        # A list that summarizes each alarm model.
        @[JSON::Field(key: "alarmModelSummaries")]
        getter alarm_model_summaries : Array(Types::AlarmModelSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alarm_model_summaries : Array(Types::AlarmModelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorModelVersionsRequest
        include JSON::Serializable

        # The name of the detector model whose versions are returned.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_model_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorModelVersionsResponse
        include JSON::Serializable

        # Summary information about the detector model versions.
        @[JSON::Field(key: "detectorModelVersionSummaries")]
        getter detector_model_version_summaries : Array(Types::DetectorModelVersionSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_model_version_summaries : Array(Types::DetectorModelVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorModelsRequest
        include JSON::Serializable

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorModelsResponse
        include JSON::Serializable

        # Summary information about the detector models.
        @[JSON::Field(key: "detectorModelSummaries")]
        getter detector_model_summaries : Array(Types::DetectorModelSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_model_summaries : Array(Types::DetectorModelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInputRoutingsRequest
        include JSON::Serializable

        # The identifer of the routed input.
        @[JSON::Field(key: "inputIdentifier")]
        getter input_identifier : Types::InputIdentifier

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_identifier : Types::InputIdentifier,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInputRoutingsResponse
        include JSON::Serializable

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Summary information about the routed resources.
        @[JSON::Field(key: "routedResources")]
        getter routed_resources : Array(Types::RoutedResource)?

        def initialize(
          @next_token : String? = nil,
          @routed_resources : Array(Types::RoutedResource)? = nil
        )
        end
      end

      struct ListInputsRequest
        include JSON::Serializable

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInputsResponse
        include JSON::Serializable

        # Summary information about the inputs.
        @[JSON::Field(key: "inputSummaries")]
        getter input_summaries : Array(Types::InputSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_summaries : Array(Types::InputSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The values of the AWS IoT Events logging options.
      struct LoggingOptions
        include JSON::Serializable

        # If TRUE, logging is enabled for AWS IoT Events.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The logging level.
        @[JSON::Field(key: "level")]
        getter level : String

        # The ARN of the role that grants permission to AWS IoT Events to perform logging.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Information that identifies those detector models and their detectors (instances) for which the
        # logging level is given.
        @[JSON::Field(key: "detectorDebugOptions")]
        getter detector_debug_options : Array(Types::DetectorDebugOption)?

        def initialize(
          @enabled : Bool,
          @level : String,
          @role_arn : String,
          @detector_debug_options : Array(Types::DetectorDebugOption)? = nil
        )
        end
      end

      # Contains the notification settings of an alarm model. The settings apply to all alarms that were
      # created based on this alarm model.
      struct NotificationAction
        include JSON::Serializable

        # Specifies an AWS Lambda function to manage alarm notifications. You can create one or use the AWS
        # Lambda function provided by AWS IoT Events .
        @[JSON::Field(key: "action")]
        getter action : Types::NotificationTargetActions

        # Contains the configuration information of email notifications.
        @[JSON::Field(key: "emailConfigurations")]
        getter email_configurations : Array(Types::EmailConfiguration)?

        # Contains the configuration information of SMS notifications.
        @[JSON::Field(key: "smsConfigurations")]
        getter sms_configurations : Array(Types::SMSConfiguration)?

        def initialize(
          @action : Types::NotificationTargetActions,
          @email_configurations : Array(Types::EmailConfiguration)? = nil,
          @sms_configurations : Array(Types::SMSConfiguration)? = nil
        )
        end
      end

      # Specifies an AWS Lambda function to manage alarm notifications. You can create one or use the AWS
      # Lambda function provided by AWS IoT Events .
      struct NotificationTargetActions
        include JSON::Serializable

        @[JSON::Field(key: "lambdaAction")]
        getter lambda_action : Types::LambdaAction?

        def initialize(
          @lambda_action : Types::LambdaAction? = nil
        )
        end
      end

      # When entering this state, perform these actions if the condition is TRUE.
      struct OnEnterLifecycle
        include JSON::Serializable

        # Specifies the actions that are performed when the state is entered and the condition is TRUE .
        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)?

        def initialize(
          @events : Array(Types::Event)? = nil
        )
        end
      end

      # When exiting this state, perform these actions if the specified condition is TRUE .
      struct OnExitLifecycle
        include JSON::Serializable

        # Specifies the actions that are performed when the state is exited and the condition is TRUE .
        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)?

        def initialize(
          @events : Array(Types::Event)? = nil
        )
        end
      end

      # Specifies the actions performed when the condition evaluates to TRUE.
      struct OnInputLifecycle
        include JSON::Serializable

        # Specifies the actions performed when the condition evaluates to TRUE.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)?

        # Specifies the actions performed, and the next state entered, when a condition evaluates to TRUE.
        @[JSON::Field(key: "transitionEvents")]
        getter transition_events : Array(Types::TransitionEvent)?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @transition_events : Array(Types::TransitionEvent)? = nil
        )
        end
      end

      # Information needed to configure the payload. By default, AWS IoT Events generates a standard payload
      # in JSON for any action. This action payload contains all attribute-value pairs that have the
      # information about the detector model instance and the event triggered the action. To configure the
      # action payload, you can use contentExpression .
      struct Payload
        include JSON::Serializable

        # The content of the payload. You can use a string expression that includes quoted strings (
        # '&lt;string&gt;' ), variables ( $variable.&lt;variable-name&gt; ), input values (
        # $input.&lt;input-name&gt;.&lt;path-to-datum&gt; ), string concatenations, and quoted strings that
        # contain ${} as the content. The recommended maximum size of a content expression is 1 KB.
        @[JSON::Field(key: "contentExpression")]
        getter content_expression : String

        # The value of the payload type can be either STRING or JSON .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @content_expression : String,
          @type : String
        )
        end
      end

      struct PutLoggingOptionsRequest
        include JSON::Serializable

        # The new values of the AWS IoT Events logging options.
        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions

        def initialize(
          @logging_options : Types::LoggingOptions
        )
        end
      end

      # The information that identifies the recipient.
      struct RecipientDetail
        include JSON::Serializable

        # The AWS Single Sign-On (AWS SSO) authentication information.
        @[JSON::Field(key: "ssoIdentity")]
        getter sso_identity : Types::SSOIdentity?

        def initialize(
          @sso_identity : Types::SSOIdentity? = nil
        )
        end
      end

      # Information required to reset the timer. The timer is reset to the previously evaluated result of
      # the duration. The duration expression isn't reevaluated when you reset the timer.
      struct ResetTimerAction
        include JSON::Serializable

        # The name of the timer to reset.
        @[JSON::Field(key: "timerName")]
        getter timer_name : String

        def initialize(
          @timer_name : String
        )
        end
      end

      # The resource already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # The resource is in use.
      struct ResourceInUseException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the routed resource.
      struct RoutedResource
        include JSON::Serializable

        # The ARN of the routed resource. For more information, see Amazon Resource Names (ARNs) in the AWS
        # General Reference .
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the routed resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains the configuration information of SMS notifications.
      struct SMSConfiguration
        include JSON::Serializable

        # Specifies one or more recipients who receive the message. You must add the users that receive SMS
        # messages to your AWS SSO store .
        @[JSON::Field(key: "recipients")]
        getter recipients : Array(Types::RecipientDetail)

        # The message that you want to send. The message can be up to 200 characters.
        @[JSON::Field(key: "additionalMessage")]
        getter additional_message : String?

        # The sender ID.
        @[JSON::Field(key: "senderId")]
        getter sender_id : String?

        def initialize(
          @recipients : Array(Types::RecipientDetail),
          @additional_message : String? = nil,
          @sender_id : String? = nil
        )
        end
      end

      # Information required to publish the Amazon SNS message.
      struct SNSTopicPublishAction
        include JSON::Serializable

        # The ARN of the Amazon SNS target where the message is sent.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # You can configure the action payload when you send a message as an Amazon SNS push notification.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        def initialize(
          @target_arn : String,
          @payload : Types::Payload? = nil
        )
        end
      end

      # Contains information about your identity source in AWS Single Sign-On. For more information, see the
      # AWS Single Sign-On User Guide .
      struct SSOIdentity
        include JSON::Serializable

        # The ID of the AWS SSO identity store.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The user ID.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @identity_store_id : String,
          @user_id : String? = nil
        )
        end
      end

      # The service is currently unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information needed to set the timer.
      struct SetTimerAction
        include JSON::Serializable

        # The name of the timer.
        @[JSON::Field(key: "timerName")]
        getter timer_name : String

        # The duration of the timer, in seconds. You can use a string expression that includes numbers,
        # variables ( $variable.&lt;variable-name&gt; ), and input values (
        # $input.&lt;input-name&gt;.&lt;path-to-datum&gt; ) as the duration. The range of the duration is
        # 1-31622400 seconds. To ensure accuracy, the minimum duration is 60 seconds. The evaluated result of
        # the duration is rounded down to the nearest whole number.
        @[JSON::Field(key: "durationExpression")]
        getter duration_expression : String?

        # The number of seconds until the timer expires. The minimum value is 60 seconds to ensure accuracy.
        # The maximum value is 31622400 seconds.
        @[JSON::Field(key: "seconds")]
        getter seconds : Int32?

        def initialize(
          @timer_name : String,
          @duration_expression : String? = nil,
          @seconds : Int32? = nil
        )
        end
      end

      # Information about the variable and its new value.
      struct SetVariableAction
        include JSON::Serializable

        # The new value of the variable.
        @[JSON::Field(key: "value")]
        getter value : String

        # The name of the variable.
        @[JSON::Field(key: "variableName")]
        getter variable_name : String

        def initialize(
          @value : String,
          @variable_name : String
        )
        end
      end

      # A rule that compares an input property value to a threshold value with a comparison operator.
      struct SimpleRule
        include JSON::Serializable

        # The comparison operator.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String

        # The value on the left side of the comparison operator. You can specify an AWS IoT Events input
        # attribute as an input property.
        @[JSON::Field(key: "inputProperty")]
        getter input_property : String

        # The value on the right side of the comparison operator. You can enter a number or specify an AWS IoT
        # Events input attribute.
        @[JSON::Field(key: "threshold")]
        getter threshold : String

        def initialize(
          @comparison_operator : String,
          @input_property : String,
          @threshold : String
        )
        end
      end

      # Sends information about the detector model instance and the event that triggered the action to an
      # Amazon SQS queue.
      struct SqsAction
        include JSON::Serializable

        # The URL of the SQS queue where the data is written.
        @[JSON::Field(key: "queueUrl")]
        getter queue_url : String

        # You can configure the action payload when you send a message to an Amazon SQS queue.
        @[JSON::Field(key: "payload")]
        getter payload : Types::Payload?

        # Set this to TRUE if you want the data to be base-64 encoded before it is written to the queue.
        # Otherwise, set this to FALSE.
        @[JSON::Field(key: "useBase64")]
        getter use_base64 : Bool?

        def initialize(
          @queue_url : String,
          @payload : Types::Payload? = nil,
          @use_base64 : Bool? = nil
        )
        end
      end

      struct StartDetectorModelAnalysisRequest
        include JSON::Serializable

        @[JSON::Field(key: "detectorModelDefinition")]
        getter detector_model_definition : Types::DetectorModelDefinition

        def initialize(
          @detector_model_definition : Types::DetectorModelDefinition
        )
        end
      end

      struct StartDetectorModelAnalysisResponse
        include JSON::Serializable

        # The ID that you can use to retrieve the analysis result.
        @[JSON::Field(key: "analysisId")]
        getter analysis_id : String?

        def initialize(
          @analysis_id : String? = nil
        )
        end
      end

      # Information that defines a state of a detector.
      struct State
        include JSON::Serializable

        # The name of the state.
        @[JSON::Field(key: "stateName")]
        getter state_name : String

        # When entering this state, perform these actions if the condition is TRUE.
        @[JSON::Field(key: "onEnter")]
        getter on_enter : Types::OnEnterLifecycle?

        # When exiting this state, perform these actions if the specified condition is TRUE .
        @[JSON::Field(key: "onExit")]
        getter on_exit : Types::OnExitLifecycle?

        # When an input is received and the condition is TRUE, perform the specified actions .
        @[JSON::Field(key: "onInput")]
        getter on_input : Types::OnInputLifecycle?

        def initialize(
          @state_name : String,
          @on_enter : Types::OnEnterLifecycle? = nil,
          @on_exit : Types::OnExitLifecycle? = nil,
          @on_input : Types::OnInputLifecycle? = nil
        )
        end
      end

      # Metadata that can be used to manage the resource.
      struct Tag
        include JSON::Serializable

        # The tag's key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The tag's value.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The new or modified tags for the resource.
        @[JSON::Field(key: "tags")]
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

      # The request could not be completed due to throttling.
      struct ThrottlingException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies the actions performed and the next state entered when a condition evaluates to TRUE.
      struct TransitionEvent
        include JSON::Serializable

        # Required. A Boolean expression that when TRUE causes the actions to be performed and the nextState
        # to be entered.
        @[JSON::Field(key: "condition")]
        getter condition : String

        # The name of the transition event.
        @[JSON::Field(key: "eventName")]
        getter event_name : String

        # The next state to enter.
        @[JSON::Field(key: "nextState")]
        getter next_state : String

        # The actions to be performed.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        def initialize(
          @condition : String,
          @event_name : String,
          @next_state : String,
          @actions : Array(Types::Action)? = nil
        )
        end
      end

      # The requested operation is not supported.
      struct UnsupportedOperationException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of the keys of the tags to be removed from the resource.
        @[JSON::Field(key: "tagKeys")]
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

      struct UpdateAlarmModelRequest
        include JSON::Serializable

        # The name of the alarm model.
        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # Defines when your alarm is invoked.
        @[JSON::Field(key: "alarmRule")]
        getter alarm_rule : Types::AlarmRule

        # The ARN of the IAM role that allows the alarm to perform actions and access AWS resources. For more
        # information, see Amazon Resource Names (ARNs) in the AWS General Reference .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains the configuration information of alarm state changes.
        @[JSON::Field(key: "alarmCapabilities")]
        getter alarm_capabilities : Types::AlarmCapabilities?

        # Contains information about one or more alarm actions.
        @[JSON::Field(key: "alarmEventActions")]
        getter alarm_event_actions : Types::AlarmEventActions?

        # The description of the alarm model.
        @[JSON::Field(key: "alarmModelDescription")]
        getter alarm_model_description : String?

        # Contains information about one or more notification actions.
        @[JSON::Field(key: "alarmNotification")]
        getter alarm_notification : Types::AlarmNotification?

        # A non-negative integer that reflects the severity level of the alarm.
        @[JSON::Field(key: "severity")]
        getter severity : Int32?

        def initialize(
          @alarm_model_name : String,
          @alarm_rule : Types::AlarmRule,
          @role_arn : String,
          @alarm_capabilities : Types::AlarmCapabilities? = nil,
          @alarm_event_actions : Types::AlarmEventActions? = nil,
          @alarm_model_description : String? = nil,
          @alarm_notification : Types::AlarmNotification? = nil,
          @severity : Int32? = nil
        )
        end
      end

      struct UpdateAlarmModelResponse
        include JSON::Serializable

        # The ARN of the alarm model. For more information, see Amazon Resource Names (ARNs) in the AWS
        # General Reference .
        @[JSON::Field(key: "alarmModelArn")]
        getter alarm_model_arn : String?

        # The version of the alarm model.
        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # The time the alarm model was created, in the Unix epoch format.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time the alarm model was last updated, in the Unix epoch format.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the alarm model. The status can be one of the following values: ACTIVE - The alarm
        # model is active and it's ready to evaluate data. ACTIVATING - AWS IoT Events is activating your
        # alarm model. Activating an alarm model can take up to a few minutes. INACTIVE - The alarm model is
        # inactive, so it isn't ready to evaluate data. Check your alarm model information and update the
        # alarm model. FAILED - You couldn't create or update the alarm model. Check your alarm model
        # information and try again.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @alarm_model_arn : String? = nil,
          @alarm_model_version : String? = nil,
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateDetectorModelRequest
        include JSON::Serializable

        # Information that defines how a detector operates.
        @[JSON::Field(key: "detectorModelDefinition")]
        getter detector_model_definition : Types::DetectorModelDefinition

        # The name of the detector model that is updated.
        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The ARN of the role that grants permission to AWS IoT Events to perform its operations.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A brief description of the detector model.
        @[JSON::Field(key: "detectorModelDescription")]
        getter detector_model_description : String?

        # Information about the order in which events are evaluated and how actions are executed.
        @[JSON::Field(key: "evaluationMethod")]
        getter evaluation_method : String?

        def initialize(
          @detector_model_definition : Types::DetectorModelDefinition,
          @detector_model_name : String,
          @role_arn : String,
          @detector_model_description : String? = nil,
          @evaluation_method : String? = nil
        )
        end
      end

      struct UpdateDetectorModelResponse
        include JSON::Serializable

        # Information about how the detector model is configured.
        @[JSON::Field(key: "detectorModelConfiguration")]
        getter detector_model_configuration : Types::DetectorModelConfiguration?

        def initialize(
          @detector_model_configuration : Types::DetectorModelConfiguration? = nil
        )
        end
      end

      struct UpdateInputRequest
        include JSON::Serializable

        # The definition of the input.
        @[JSON::Field(key: "inputDefinition")]
        getter input_definition : Types::InputDefinition

        # The name of the input you want to update.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # A brief description of the input.
        @[JSON::Field(key: "inputDescription")]
        getter input_description : String?

        def initialize(
          @input_definition : Types::InputDefinition,
          @input_name : String,
          @input_description : String? = nil
        )
        end
      end

      struct UpdateInputResponse
        include JSON::Serializable

        # Information about the configuration of the input.
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::InputConfiguration?

        def initialize(
          @input_configuration : Types::InputConfiguration? = nil
        )
        end
      end
    end
  end
end
