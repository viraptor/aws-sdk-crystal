require "json"
require "time"

module Aws
  module IoTEventsData
    module Types

      # Contains the configuration information of an acknowledge action.

      struct AcknowledgeActionConfiguration
        include JSON::Serializable

        # The note that you can leave when you acknowledge the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @note : String? = nil
        )
        end
      end

      # Information needed to acknowledge the alarm.

      struct AcknowledgeAlarmActionRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The note that you can leave when you acknowledge the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @alarm_model_name : String,
          @request_id : String,
          @key_value : String? = nil,
          @note : String? = nil
        )
        end
      end

      # Contains information about an alarm.

      struct Alarm
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String?

        # The version of the alarm model.

        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # Contains information about the current state of the alarm.

        @[JSON::Field(key: "alarmState")]
        getter alarm_state : Types::AlarmState?

        # The time the alarm was created, in the Unix epoch format.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The time the alarm was last updated, in the Unix epoch format.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # A non-negative integer that reflects the severity level of the alarm.

        @[JSON::Field(key: "severity")]
        getter severity : Int32?

        def initialize(
          @alarm_model_name : String? = nil,
          @alarm_model_version : String? = nil,
          @alarm_state : Types::AlarmState? = nil,
          @creation_time : Time? = nil,
          @key_value : String? = nil,
          @last_update_time : Time? = nil,
          @severity : Int32? = nil
        )
        end
      end

      # Contains information about the current state of the alarm.

      struct AlarmState
        include JSON::Serializable

        # Contains information about the action that you can take to respond to the alarm.

        @[JSON::Field(key: "customerAction")]
        getter customer_action : Types::CustomerAction?

        # Information needed to evaluate data.

        @[JSON::Field(key: "ruleEvaluation")]
        getter rule_evaluation : Types::RuleEvaluation?

        # The name of the alarm state. The state name can be one of the following values: DISABLED - When the
        # alarm is in the DISABLED state, it isn't ready to evaluate data. To enable the alarm, you must
        # change the alarm to the NORMAL state. NORMAL - When the alarm is in the NORMAL state, it's ready to
        # evaluate data. ACTIVE - If the alarm is in the ACTIVE state, the alarm is invoked. ACKNOWLEDGED -
        # When the alarm is in the ACKNOWLEDGED state, the alarm was invoked and you acknowledged the alarm.
        # SNOOZE_DISABLED - When the alarm is in the SNOOZE_DISABLED state, the alarm is disabled for a
        # specified period of time. After the snooze time, the alarm automatically changes to the NORMAL
        # state. LATCHED - When the alarm is in the LATCHED state, the alarm was invoked. However, the data
        # that the alarm is currently evaluating is within the specified range. To change the alarm to the
        # NORMAL state, you must acknowledge the alarm.

        @[JSON::Field(key: "stateName")]
        getter state_name : String?

        # Contains information about alarm state changes.

        @[JSON::Field(key: "systemEvent")]
        getter system_event : Types::SystemEvent?

        def initialize(
          @customer_action : Types::CustomerAction? = nil,
          @rule_evaluation : Types::RuleEvaluation? = nil,
          @state_name : String? = nil,
          @system_event : Types::SystemEvent? = nil
        )
        end
      end

      # Contains a summary of an alarm.

      struct AlarmSummary
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String?

        # The version of the alarm model.

        @[JSON::Field(key: "alarmModelVersion")]
        getter alarm_model_version : String?

        # The time the alarm was created, in the Unix epoch format.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The time the alarm was last updated, in the Unix epoch format.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the alarm state. The state name can be one of the following values: DISABLED - When the
        # alarm is in the DISABLED state, it isn't ready to evaluate data. To enable the alarm, you must
        # change the alarm to the NORMAL state. NORMAL - When the alarm is in the NORMAL state, it's ready to
        # evaluate data. ACTIVE - If the alarm is in the ACTIVE state, the alarm is invoked. ACKNOWLEDGED -
        # When the alarm is in the ACKNOWLEDGED state, the alarm was invoked and you acknowledged the alarm.
        # SNOOZE_DISABLED - When the alarm is in the SNOOZE_DISABLED state, the alarm is disabled for a
        # specified period of time. After the snooze time, the alarm automatically changes to the NORMAL
        # state. LATCHED - When the alarm is in the LATCHED state, the alarm was invoked. However, the data
        # that the alarm is currently evaluating is within the specified range. To change the alarm to the
        # NORMAL state, you must acknowledge the alarm.

        @[JSON::Field(key: "stateName")]
        getter state_name : String?

        def initialize(
          @alarm_model_name : String? = nil,
          @alarm_model_version : String? = nil,
          @creation_time : Time? = nil,
          @key_value : String? = nil,
          @last_update_time : Time? = nil,
          @state_name : String? = nil
        )
        end
      end


      struct BatchAcknowledgeAlarmRequest
        include JSON::Serializable

        # The list of acknowledge action requests. You can specify up to 10 requests per operation.

        @[JSON::Field(key: "acknowledgeActionRequests")]
        getter acknowledge_action_requests : Array(Types::AcknowledgeAlarmActionRequest)

        def initialize(
          @acknowledge_action_requests : Array(Types::AcknowledgeAlarmActionRequest)
        )
        end
      end


      struct BatchAcknowledgeAlarmResponse
        include JSON::Serializable

        # A list of errors associated with the request, or null if there are no errors. Each error entry
        # contains an entry ID that helps you identify the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchAlarmActionErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchAlarmActionErrorEntry)? = nil
        )
        end
      end

      # Contains error messages associated with one of the following requests: BatchAcknowledgeAlarm
      # BatchDisableAlarm BatchEnableAlarm BatchResetAlarm BatchSnoozeAlarm

      struct BatchAlarmActionErrorEntry
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A message that describes the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains error messages associated with the deletion request.

      struct BatchDeleteDetectorErrorEntry
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A message that describes the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the message that caused the error. (See the value of the "messageId" in the detectors
        # object of the DeleteDetectorRequest .)

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @message_id : String? = nil
        )
        end
      end


      struct BatchDeleteDetectorRequest
        include JSON::Serializable

        # The list of one or more detectors to be deleted.

        @[JSON::Field(key: "detectors")]
        getter detectors : Array(Types::DeleteDetectorRequest)

        def initialize(
          @detectors : Array(Types::DeleteDetectorRequest)
        )
        end
      end


      struct BatchDeleteDetectorResponse
        include JSON::Serializable

        # A list of errors associated with the request, or an empty array ( [] ) if there are no errors. Each
        # error entry contains a messageId that helps you identify the entry that failed.

        @[JSON::Field(key: "batchDeleteDetectorErrorEntries")]
        getter batch_delete_detector_error_entries : Array(Types::BatchDeleteDetectorErrorEntry)?

        def initialize(
          @batch_delete_detector_error_entries : Array(Types::BatchDeleteDetectorErrorEntry)? = nil
        )
        end
      end


      struct BatchDisableAlarmRequest
        include JSON::Serializable

        # The list of disable action requests. You can specify up to 10 requests per operation.

        @[JSON::Field(key: "disableActionRequests")]
        getter disable_action_requests : Array(Types::DisableAlarmActionRequest)

        def initialize(
          @disable_action_requests : Array(Types::DisableAlarmActionRequest)
        )
        end
      end


      struct BatchDisableAlarmResponse
        include JSON::Serializable

        # A list of errors associated with the request, or null if there are no errors. Each error entry
        # contains an entry ID that helps you identify the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchAlarmActionErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchAlarmActionErrorEntry)? = nil
        )
        end
      end


      struct BatchEnableAlarmRequest
        include JSON::Serializable

        # The list of enable action requests. You can specify up to 10 requests per operation.

        @[JSON::Field(key: "enableActionRequests")]
        getter enable_action_requests : Array(Types::EnableAlarmActionRequest)

        def initialize(
          @enable_action_requests : Array(Types::EnableAlarmActionRequest)
        )
        end
      end


      struct BatchEnableAlarmResponse
        include JSON::Serializable

        # A list of errors associated with the request, or null if there are no errors. Each error entry
        # contains an entry ID that helps you identify the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchAlarmActionErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchAlarmActionErrorEntry)? = nil
        )
        end
      end

      # Contains information about the errors encountered.

      struct BatchPutMessageErrorEntry
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A message that describes the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the message that caused the error. (See the value corresponding to the "messageId" key in
        # the "message" object.)

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @message_id : String? = nil
        )
        end
      end


      struct BatchPutMessageRequest
        include JSON::Serializable

        # The list of messages to send. Each message has the following format: '{ "messageId": "string",
        # "inputName": "string", "payload": "string"}'

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        def initialize(
          @messages : Array(Types::Message)
        )
        end
      end


      struct BatchPutMessageResponse
        include JSON::Serializable

        # A list of any errors encountered when sending the messages.

        @[JSON::Field(key: "BatchPutMessageErrorEntries")]
        getter batch_put_message_error_entries : Array(Types::BatchPutMessageErrorEntry)?

        def initialize(
          @batch_put_message_error_entries : Array(Types::BatchPutMessageErrorEntry)? = nil
        )
        end
      end


      struct BatchResetAlarmRequest
        include JSON::Serializable

        # The list of reset action requests. You can specify up to 10 requests per operation.

        @[JSON::Field(key: "resetActionRequests")]
        getter reset_action_requests : Array(Types::ResetAlarmActionRequest)

        def initialize(
          @reset_action_requests : Array(Types::ResetAlarmActionRequest)
        )
        end
      end


      struct BatchResetAlarmResponse
        include JSON::Serializable

        # A list of errors associated with the request, or null if there are no errors. Each error entry
        # contains an entry ID that helps you identify the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchAlarmActionErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchAlarmActionErrorEntry)? = nil
        )
        end
      end


      struct BatchSnoozeAlarmRequest
        include JSON::Serializable

        # The list of snooze action requests. You can specify up to 10 requests per operation.

        @[JSON::Field(key: "snoozeActionRequests")]
        getter snooze_action_requests : Array(Types::SnoozeAlarmActionRequest)

        def initialize(
          @snooze_action_requests : Array(Types::SnoozeAlarmActionRequest)
        )
        end
      end


      struct BatchSnoozeAlarmResponse
        include JSON::Serializable

        # A list of errors associated with the request, or null if there are no errors. Each error entry
        # contains an entry ID that helps you identify the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchAlarmActionErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchAlarmActionErrorEntry)? = nil
        )
        end
      end

      # Information about the error that occurred when attempting to update a detector.

      struct BatchUpdateDetectorErrorEntry
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A message that describes the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The "messageId" of the update request that caused the error. (The value of the "messageId" in the
        # update request "Detector" object.)

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @message_id : String? = nil
        )
        end
      end


      struct BatchUpdateDetectorRequest
        include JSON::Serializable

        # The list of detectors (instances) to update, along with the values to update.

        @[JSON::Field(key: "detectors")]
        getter detectors : Array(Types::UpdateDetectorRequest)

        def initialize(
          @detectors : Array(Types::UpdateDetectorRequest)
        )
        end
      end


      struct BatchUpdateDetectorResponse
        include JSON::Serializable

        # A list of those detector updates that resulted in errors. (If an error is listed here, the specific
        # update did not occur.)

        @[JSON::Field(key: "batchUpdateDetectorErrorEntries")]
        getter batch_update_detector_error_entries : Array(Types::BatchUpdateDetectorErrorEntry)?

        def initialize(
          @batch_update_detector_error_entries : Array(Types::BatchUpdateDetectorErrorEntry)? = nil
        )
        end
      end

      # Contains information about the action that you can take to respond to the alarm.

      struct CustomerAction
        include JSON::Serializable

        # Contains the configuration information of an acknowledge action.

        @[JSON::Field(key: "acknowledgeActionConfiguration")]
        getter acknowledge_action_configuration : Types::AcknowledgeActionConfiguration?

        # The name of the action. The action name can be one of the following values: SNOOZE - When you snooze
        # the alarm, the alarm state changes to SNOOZE_DISABLED . ENABLE - When you enable the alarm, the
        # alarm state changes to NORMAL . DISABLE - When you disable the alarm, the alarm state changes to
        # DISABLED . ACKNOWLEDGE - When you acknowledge the alarm, the alarm state changes to ACKNOWLEDGED .
        # RESET - When you reset the alarm, the alarm state changes to NORMAL . For more information, see the
        # AlarmState API.

        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Contains the configuration information of a disable action.

        @[JSON::Field(key: "disableActionConfiguration")]
        getter disable_action_configuration : Types::DisableActionConfiguration?

        # Contains the configuration information of an enable action.

        @[JSON::Field(key: "enableActionConfiguration")]
        getter enable_action_configuration : Types::EnableActionConfiguration?

        # Contains the configuration information of a reset action.

        @[JSON::Field(key: "resetActionConfiguration")]
        getter reset_action_configuration : Types::ResetActionConfiguration?

        # Contains the configuration information of a snooze action.

        @[JSON::Field(key: "snoozeActionConfiguration")]
        getter snooze_action_configuration : Types::SnoozeActionConfiguration?

        def initialize(
          @acknowledge_action_configuration : Types::AcknowledgeActionConfiguration? = nil,
          @action_name : String? = nil,
          @disable_action_configuration : Types::DisableActionConfiguration? = nil,
          @enable_action_configuration : Types::EnableActionConfiguration? = nil,
          @reset_action_configuration : Types::ResetActionConfiguration? = nil,
          @snooze_action_configuration : Types::SnoozeActionConfiguration? = nil
        )
        end
      end

      # Information used to delete the detector model.

      struct DeleteDetectorRequest
        include JSON::Serializable

        # The name of the detector model that was used to create the detector instance.

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The ID to assign to the DeleteDetectorRequest . Each "messageId" must be unique within each batch
        # sent.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The value of the key used to identify the detector.

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @detector_model_name : String,
          @message_id : String,
          @key_value : String? = nil
        )
        end
      end


      struct DescribeAlarmRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @alarm_model_name : String,
          @key_value : String? = nil
        )
        end
      end


      struct DescribeAlarmResponse
        include JSON::Serializable

        # Contains information about an alarm.

        @[JSON::Field(key: "alarm")]
        getter alarm : Types::Alarm?

        def initialize(
          @alarm : Types::Alarm? = nil
        )
        end
      end


      struct DescribeDetectorRequest
        include JSON::Serializable

        # The name of the detector model whose detectors (instances) you want information about.

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # A filter used to limit results to detectors (instances) created because of the given key ID.

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @detector_model_name : String,
          @key_value : String? = nil
        )
        end
      end


      struct DescribeDetectorResponse
        include JSON::Serializable

        # Information about the detector (instance).

        @[JSON::Field(key: "detector")]
        getter detector : Types::Detector?

        def initialize(
          @detector : Types::Detector? = nil
        )
        end
      end

      # Information about the detector (instance).

      struct Detector
        include JSON::Serializable

        # The time the detector (instance) was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The name of the detector model that created this detector (instance).

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String?

        # The version of the detector model that created this detector (instance).

        @[JSON::Field(key: "detectorModelVersion")]
        getter detector_model_version : String?

        # The value of the key (identifying the device or system) that caused the creation of this detector
        # (instance).

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The time the detector (instance) was last updated.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The current state of the detector (instance).

        @[JSON::Field(key: "state")]
        getter state : Types::DetectorState?

        def initialize(
          @creation_time : Time? = nil,
          @detector_model_name : String? = nil,
          @detector_model_version : String? = nil,
          @key_value : String? = nil,
          @last_update_time : Time? = nil,
          @state : Types::DetectorState? = nil
        )
        end
      end

      # Information about the current state of the detector instance.

      struct DetectorState
        include JSON::Serializable

        # The name of the state.

        @[JSON::Field(key: "stateName")]
        getter state_name : String

        # The current state of the detector's timers.

        @[JSON::Field(key: "timers")]
        getter timers : Array(Types::Timer)

        # The current values of the detector's variables.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::Variable)

        def initialize(
          @state_name : String,
          @timers : Array(Types::Timer),
          @variables : Array(Types::Variable)
        )
        end
      end

      # The new state, variable values, and timer settings of the detector (instance).

      struct DetectorStateDefinition
        include JSON::Serializable

        # The name of the new state of the detector (instance).

        @[JSON::Field(key: "stateName")]
        getter state_name : String

        # The new values of the detector's timers. Any timer whose value isn't specified is cleared, and its
        # timeout event won't occur.

        @[JSON::Field(key: "timers")]
        getter timers : Array(Types::TimerDefinition)

        # The new values of the detector's variables. Any variable whose value isn't specified is cleared.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::VariableDefinition)

        def initialize(
          @state_name : String,
          @timers : Array(Types::TimerDefinition),
          @variables : Array(Types::VariableDefinition)
        )
        end
      end

      # Information about the detector state.

      struct DetectorStateSummary
        include JSON::Serializable

        # The name of the state.

        @[JSON::Field(key: "stateName")]
        getter state_name : String?

        def initialize(
          @state_name : String? = nil
        )
        end
      end

      # Information about the detector (instance).

      struct DetectorSummary
        include JSON::Serializable

        # The time the detector (instance) was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The name of the detector model that created this detector (instance).

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String?

        # The version of the detector model that created this detector (instance).

        @[JSON::Field(key: "detectorModelVersion")]
        getter detector_model_version : String?

        # The value of the key (identifying the device or system) that caused the creation of this detector
        # (instance).

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The time the detector (instance) was last updated.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The current state of the detector (instance).

        @[JSON::Field(key: "state")]
        getter state : Types::DetectorStateSummary?

        def initialize(
          @creation_time : Time? = nil,
          @detector_model_name : String? = nil,
          @detector_model_version : String? = nil,
          @key_value : String? = nil,
          @last_update_time : Time? = nil,
          @state : Types::DetectorStateSummary? = nil
        )
        end
      end

      # Contains the configuration information of a disable action.

      struct DisableActionConfiguration
        include JSON::Serializable

        # The note that you can leave when you disable the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @note : String? = nil
        )
        end
      end

      # Information used to disable the alarm.

      struct DisableAlarmActionRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The note that you can leave when you disable the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @alarm_model_name : String,
          @request_id : String,
          @key_value : String? = nil,
          @note : String? = nil
        )
        end
      end

      # Contains the configuration information of an enable action.

      struct EnableActionConfiguration
        include JSON::Serializable

        # The note that you can leave when you enable the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @note : String? = nil
        )
        end
      end

      # Information needed to enable the alarm.

      struct EnableAlarmActionRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The note that you can leave when you enable the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @alarm_model_name : String,
          @request_id : String,
          @key_value : String? = nil,
          @note : String? = nil
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


      struct ListAlarmsRequest
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


      struct ListAlarmsResponse
        include JSON::Serializable

        # A list that summarizes each alarm.

        @[JSON::Field(key: "alarmSummaries")]
        getter alarm_summaries : Array(Types::AlarmSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alarm_summaries : Array(Types::AlarmSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDetectorsRequest
        include JSON::Serializable

        # The name of the detector model whose detectors (instances) are listed.

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that you can use to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter that limits results to those detectors (instances) in the given state.

        @[JSON::Field(key: "stateName")]
        getter state_name : String?

        def initialize(
          @detector_model_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_name : String? = nil
        )
        end
      end


      struct ListDetectorsResponse
        include JSON::Serializable

        # A list of summary information about the detectors (instances).

        @[JSON::Field(key: "detectorSummaries")]
        getter detector_summaries : Array(Types::DetectorSummary)?

        # The token that you can use to return the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_summaries : Array(Types::DetectorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about a message.

      struct Message
        include JSON::Serializable

        # The name of the input into which the message payload is transformed.

        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # The ID to assign to the message. Within each batch sent, each "messageId" must be unique.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The payload of the message. This can be a JSON string or a Base-64-encoded string representing
        # binary data (in which case you must decode it).

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # The timestamp associated with the message.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::TimestampValue?

        def initialize(
          @input_name : String,
          @message_id : String,
          @payload : Bytes,
          @timestamp : Types::TimestampValue? = nil
        )
        end
      end

      # Contains the configuration information of a reset action.

      struct ResetActionConfiguration
        include JSON::Serializable

        # The note that you can leave when you reset the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @note : String? = nil
        )
        end
      end

      # Information needed to reset the alarm.

      struct ResetAlarmActionRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The note that you can leave when you reset the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @alarm_model_name : String,
          @request_id : String,
          @key_value : String? = nil,
          @note : String? = nil
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

      # Information needed to evaluate data.

      struct RuleEvaluation
        include JSON::Serializable

        # Information needed to compare two values with a comparison operator.

        @[JSON::Field(key: "simpleRuleEvaluation")]
        getter simple_rule_evaluation : Types::SimpleRuleEvaluation?

        def initialize(
          @simple_rule_evaluation : Types::SimpleRuleEvaluation? = nil
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

      # Information needed to compare two values with a comparison operator.

      struct SimpleRuleEvaluation
        include JSON::Serializable

        # The value of the input property, on the left side of the comparison operator.

        @[JSON::Field(key: "inputPropertyValue")]
        getter input_property_value : String?

        # The comparison operator.

        @[JSON::Field(key: "operator")]
        getter operator : String?

        # The threshold value, on the right side of the comparison operator.

        @[JSON::Field(key: "thresholdValue")]
        getter threshold_value : String?

        def initialize(
          @input_property_value : String? = nil,
          @operator : String? = nil,
          @threshold_value : String? = nil
        )
        end
      end

      # Contains the configuration information of a snooze action.

      struct SnoozeActionConfiguration
        include JSON::Serializable

        # The note that you can leave when you snooze the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        # The snooze time in seconds. The alarm automatically changes to the NORMAL state after this duration.

        @[JSON::Field(key: "snoozeDuration")]
        getter snooze_duration : Int32?

        def initialize(
          @note : String? = nil,
          @snooze_duration : Int32? = nil
        )
        end
      end

      # Information needed to snooze the alarm.

      struct SnoozeAlarmActionRequest
        include JSON::Serializable

        # The name of the alarm model.

        @[JSON::Field(key: "alarmModelName")]
        getter alarm_model_name : String

        # The request ID. Each ID must be unique within each batch.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The snooze time in seconds. The alarm automatically changes to the NORMAL state after this duration.

        @[JSON::Field(key: "snoozeDuration")]
        getter snooze_duration : Int32

        # The value of the key used as a filter to select only the alarms associated with the key .

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        # The note that you can leave when you snooze the alarm.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @alarm_model_name : String,
          @request_id : String,
          @snooze_duration : Int32,
          @key_value : String? = nil,
          @note : String? = nil
        )
        end
      end

      # Contains the configuration information of alarm state changes.

      struct StateChangeConfiguration
        include JSON::Serializable

        # The trigger type. If the value is SNOOZE_TIMEOUT , the snooze duration ends and the alarm
        # automatically changes to the NORMAL state.

        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String?

        def initialize(
          @trigger_type : String? = nil
        )
        end
      end

      # Contains information about alarm state changes.

      struct SystemEvent
        include JSON::Serializable

        # The event type. If the value is STATE_CHANGE , the event contains information about alarm state
        # changes.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # Contains the configuration information of alarm state changes.

        @[JSON::Field(key: "stateChangeConfiguration")]
        getter state_change_configuration : Types::StateChangeConfiguration?

        def initialize(
          @event_type : String? = nil,
          @state_change_configuration : Types::StateChangeConfiguration? = nil
        )
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

      # The current state of a timer.

      struct Timer
        include JSON::Serializable

        # The name of the timer.

        @[JSON::Field(key: "name")]
        getter name : String

        # The expiration time for the timer.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @name : String,
          @timestamp : Time
        )
        end
      end

      # The new setting of a timer.

      struct TimerDefinition
        include JSON::Serializable

        # The name of the timer.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new setting of the timer (the number of seconds before the timer elapses).

        @[JSON::Field(key: "seconds")]
        getter seconds : Int32

        def initialize(
          @name : String,
          @seconds : Int32
        )
        end
      end

      # Contains information about a timestamp.

      struct TimestampValue
        include JSON::Serializable

        # The value of the timestamp, in the Unix epoch format.

        @[JSON::Field(key: "timeInMillis")]
        getter time_in_millis : Int64?

        def initialize(
          @time_in_millis : Int64? = nil
        )
        end
      end

      # Information used to update the detector (instance).

      struct UpdateDetectorRequest
        include JSON::Serializable

        # The name of the detector model that created the detectors (instances).

        @[JSON::Field(key: "detectorModelName")]
        getter detector_model_name : String

        # The ID to assign to the detector update "message" . Each "messageId" must be unique within each
        # batch sent.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The new state, variable values, and timer settings of the detector (instance).

        @[JSON::Field(key: "state")]
        getter state : Types::DetectorStateDefinition

        # The value of the input key attribute (identifying the device or system) that caused the creation of
        # this detector (instance).

        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @detector_model_name : String,
          @message_id : String,
          @state : Types::DetectorStateDefinition,
          @key_value : String? = nil
        )
        end
      end

      # The current state of the variable.

      struct Variable
        include JSON::Serializable

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current value of the variable.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The new value of the variable.

      struct VariableDefinition
        include JSON::Serializable

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new value of the variable.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end
    end
  end
end
