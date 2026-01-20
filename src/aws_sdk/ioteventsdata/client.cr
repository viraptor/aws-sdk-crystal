module AwsSdk
  module IoTEventsData
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Acknowledges one or more alarms. The alarms change to the ACKNOWLEDGED state after you acknowledge
      # them.

      def batch_acknowledge_alarm(
        acknowledge_action_requests : Array(Types::AcknowledgeAlarmActionRequest)
      ) : Protocol::Request
        input = Types::BatchAcknowledgeAlarmRequest.new(acknowledge_action_requests: acknowledge_action_requests)
        batch_acknowledge_alarm(input)
      end

      def batch_acknowledge_alarm(input : Types::BatchAcknowledgeAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ACKNOWLEDGE_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or more detectors that were created. When a detector is deleted, its state will be
      # cleared and the detector will be removed from the list of detectors. The deleted detector will no
      # longer appear if referenced in the ListDetectors API call.

      def batch_delete_detector(
        detectors : Array(Types::DeleteDetectorRequest)
      ) : Protocol::Request
        input = Types::BatchDeleteDetectorRequest.new(detectors: detectors)
        batch_delete_detector(input)
      end

      def batch_delete_detector(input : Types::BatchDeleteDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables one or more alarms. The alarms change to the DISABLED state after you disable them.

      def batch_disable_alarm(
        disable_action_requests : Array(Types::DisableAlarmActionRequest)
      ) : Protocol::Request
        input = Types::BatchDisableAlarmRequest.new(disable_action_requests: disable_action_requests)
        batch_disable_alarm(input)
      end

      def batch_disable_alarm(input : Types::BatchDisableAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISABLE_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables one or more alarms. The alarms change to the NORMAL state after you enable them.

      def batch_enable_alarm(
        enable_action_requests : Array(Types::EnableAlarmActionRequest)
      ) : Protocol::Request
        input = Types::BatchEnableAlarmRequest.new(enable_action_requests: enable_action_requests)
        batch_enable_alarm(input)
      end

      def batch_enable_alarm(input : Types::BatchEnableAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ENABLE_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a set of messages to the IoT Events system. Each message payload is transformed into the input
      # you specify ( "inputName" ) and ingested into any detectors that monitor that input. If multiple
      # messages are sent, the order in which the messages are processed isn't guaranteed. To guarantee
      # ordering, you must send messages one at a time and wait for a successful response.

      def batch_put_message(
        messages : Array(Types::Message)
      ) : Protocol::Request
        input = Types::BatchPutMessageRequest.new(messages: messages)
        batch_put_message(input)
      end

      def batch_put_message(input : Types::BatchPutMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets one or more alarms. The alarms return to the NORMAL state after you reset them.

      def batch_reset_alarm(
        reset_action_requests : Array(Types::ResetAlarmActionRequest)
      ) : Protocol::Request
        input = Types::BatchResetAlarmRequest.new(reset_action_requests: reset_action_requests)
        batch_reset_alarm(input)
      end

      def batch_reset_alarm(input : Types::BatchResetAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_RESET_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes one or more alarms to the snooze mode. The alarms change to the SNOOZE_DISABLED state after
      # you set them to the snooze mode.

      def batch_snooze_alarm(
        snooze_action_requests : Array(Types::SnoozeAlarmActionRequest)
      ) : Protocol::Request
        input = Types::BatchSnoozeAlarmRequest.new(snooze_action_requests: snooze_action_requests)
        batch_snooze_alarm(input)
      end

      def batch_snooze_alarm(input : Types::BatchSnoozeAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_SNOOZE_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the state, variable values, and timer settings of one or more detectors (instances) of a
      # specified detector model.

      def batch_update_detector(
        detectors : Array(Types::UpdateDetectorRequest)
      ) : Protocol::Request
        input = Types::BatchUpdateDetectorRequest.new(detectors: detectors)
        batch_update_detector(input)
      end

      def batch_update_detector(input : Types::BatchUpdateDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an alarm.

      def describe_alarm(
        alarm_model_name : String,
        key_value : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAlarmRequest.new(alarm_model_name: alarm_model_name, key_value: key_value)
        describe_alarm(input)
      end

      def describe_alarm(input : Types::DescribeAlarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ALARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified detector (instance).

      def describe_detector(
        detector_model_name : String,
        key_value : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDetectorRequest.new(detector_model_name: detector_model_name, key_value: key_value)
        describe_detector(input)
      end

      def describe_detector(input : Types::DescribeDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists one or more alarms. The operation returns only the metadata associated with each alarm.

      def list_alarms(
        alarm_model_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAlarmsRequest.new(alarm_model_name: alarm_model_name, max_results: max_results, next_token: next_token)
        list_alarms(input)
      end

      def list_alarms(input : Types::ListAlarmsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALARMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists detectors (the instances of a detector model).

      def list_detectors(
        detector_model_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_name : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectorsRequest.new(detector_model_name: detector_model_name, max_results: max_results, next_token: next_token, state_name: state_name)
        list_detectors(input)
      end

      def list_detectors(input : Types::ListDetectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
