module AwsSdk
  module IoTEvents
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

      # Creates an alarm model to monitor an AWS IoT Events input attribute. You can use the alarm to get
      # notified when the value is outside a specified range. For more information, see Create an alarm
      # model in the AWS IoT Events Developer Guide .
      def create_alarm_model(
        alarm_model_name : String,
        alarm_rule : Types::AlarmRule,
        role_arn : String,
        alarm_capabilities : Types::AlarmCapabilities? = nil,
        alarm_event_actions : Types::AlarmEventActions? = nil,
        alarm_model_description : String? = nil,
        alarm_notification : Types::AlarmNotification? = nil,
        key : String? = nil,
        severity : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAlarmModelRequest.new(alarm_model_name: alarm_model_name, alarm_rule: alarm_rule, role_arn: role_arn, alarm_capabilities: alarm_capabilities, alarm_event_actions: alarm_event_actions, alarm_model_description: alarm_model_description, alarm_notification: alarm_notification, key: key, severity: severity, tags: tags)
        create_alarm_model(input)
      end
      def create_alarm_model(input : Types::CreateAlarmModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ALARM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a detector model.
      def create_detector_model(
        detector_model_definition : Types::DetectorModelDefinition,
        detector_model_name : String,
        role_arn : String,
        detector_model_description : String? = nil,
        evaluation_method : String? = nil,
        key : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDetectorModelRequest.new(detector_model_definition: detector_model_definition, detector_model_name: detector_model_name, role_arn: role_arn, detector_model_description: detector_model_description, evaluation_method: evaluation_method, key: key, tags: tags)
        create_detector_model(input)
      end
      def create_detector_model(input : Types::CreateDetectorModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DETECTOR_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an input.
      def create_input(
        input_definition : Types::InputDefinition,
        input_name : String,
        input_description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateInputRequest.new(input_definition: input_definition, input_name: input_name, input_description: input_description, tags: tags)
        create_input(input)
      end
      def create_input(input : Types::CreateInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an alarm model. Any alarm instances that were created based on this alarm model are also
      # deleted. This action can't be undone.
      def delete_alarm_model(
        alarm_model_name : String
      ) : Protocol::Request
        input = Types::DeleteAlarmModelRequest.new(alarm_model_name: alarm_model_name)
        delete_alarm_model(input)
      end
      def delete_alarm_model(input : Types::DeleteAlarmModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ALARM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a detector model. Any active instances of the detector model are also deleted.
      def delete_detector_model(
        detector_model_name : String
      ) : Protocol::Request
        input = Types::DeleteDetectorModelRequest.new(detector_model_name: detector_model_name)
        delete_detector_model(input)
      end
      def delete_detector_model(input : Types::DeleteDetectorModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DETECTOR_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an input.
      def delete_input(
        input_name : String
      ) : Protocol::Request
        input = Types::DeleteInputRequest.new(input_name: input_name)
        delete_input(input)
      end
      def delete_input(input : Types::DeleteInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an alarm model. If you don't specify a value for the alarmModelVersion
      # parameter, the latest version is returned.
      def describe_alarm_model(
        alarm_model_name : String,
        alarm_model_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAlarmModelRequest.new(alarm_model_name: alarm_model_name, alarm_model_version: alarm_model_version)
        describe_alarm_model(input)
      end
      def describe_alarm_model(input : Types::DescribeAlarmModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ALARM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a detector model. If the version parameter is not specified, information about the latest
      # version is returned.
      def describe_detector_model(
        detector_model_name : String,
        detector_model_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDetectorModelRequest.new(detector_model_name: detector_model_name, detector_model_version: detector_model_version)
        describe_detector_model(input)
      end
      def describe_detector_model(input : Types::DescribeDetectorModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DETECTOR_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves runtime information about a detector model analysis. After AWS IoT Events starts analyzing
      # your detector model, you have up to 24 hours to retrieve the analysis results.
      def describe_detector_model_analysis(
        analysis_id : String
      ) : Protocol::Request
        input = Types::DescribeDetectorModelAnalysisRequest.new(analysis_id: analysis_id)
        describe_detector_model_analysis(input)
      end
      def describe_detector_model_analysis(input : Types::DescribeDetectorModelAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DETECTOR_MODEL_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an input.
      def describe_input(
        input_name : String
      ) : Protocol::Request
        input = Types::DescribeInputRequest.new(input_name: input_name)
        describe_input(input)
      end
      def describe_input(input : Types::DescribeInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current settings of the AWS IoT Events logging options.
      def describe_logging_options : Protocol::Request
        input = Types::DescribeLoggingOptionsRequest.new
        describe_logging_options(input)
      end
      def describe_logging_options(input : Types::DescribeLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves one or more analysis results of the detector model. After AWS IoT Events starts analyzing
      # your detector model, you have up to 24 hours to retrieve the analysis results.
      def get_detector_model_analysis_results(
        analysis_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDetectorModelAnalysisResultsRequest.new(analysis_id: analysis_id, max_results: max_results, next_token: next_token)
        get_detector_model_analysis_results(input)
      end
      def get_detector_model_analysis_results(input : Types::GetDetectorModelAnalysisResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DETECTOR_MODEL_ANALYSIS_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the versions of an alarm model. The operation returns only the metadata associated with
      # each alarm model version.
      def list_alarm_model_versions(
        alarm_model_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAlarmModelVersionsRequest.new(alarm_model_name: alarm_model_name, max_results: max_results, next_token: next_token)
        list_alarm_model_versions(input)
      end
      def list_alarm_model_versions(input : Types::ListAlarmModelVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALARM_MODEL_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the alarm models that you created. The operation returns only the metadata associated with
      # each alarm model.
      def list_alarm_models(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAlarmModelsRequest.new(max_results: max_results, next_token: next_token)
        list_alarm_models(input)
      end
      def list_alarm_models(input : Types::ListAlarmModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALARM_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the versions of a detector model. Only the metadata associated with each detector model
      # version is returned.
      def list_detector_model_versions(
        detector_model_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectorModelVersionsRequest.new(detector_model_name: detector_model_name, max_results: max_results, next_token: next_token)
        list_detector_model_versions(input)
      end
      def list_detector_model_versions(input : Types::ListDetectorModelVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECTOR_MODEL_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the detector models you have created. Only the metadata associated with each detector model is
      # returned.
      def list_detector_models(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectorModelsRequest.new(max_results: max_results, next_token: next_token)
        list_detector_models(input)
      end
      def list_detector_models(input : Types::ListDetectorModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECTOR_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists one or more input routings.
      def list_input_routings(
        input_identifier : Types::InputIdentifier,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputRoutingsRequest.new(input_identifier: input_identifier, max_results: max_results, next_token: next_token)
        list_input_routings(input)
      end
      def list_input_routings(input : Types::ListInputRoutingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUT_ROUTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the inputs you have created.
      def list_inputs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputsRequest.new(max_results: max_results, next_token: next_token)
        list_inputs(input)
      end
      def list_inputs(input : Types::ListInputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags (metadata) you have assigned to the resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets or updates the AWS IoT Events logging options. If you update the value of any loggingOptions
      # field, it takes up to one minute for the change to take effect. If you change the policy attached to
      # the role you specified in the roleArn field (for example, to correct an invalid policy), it takes up
      # to five minutes for that change to take effect.
      def put_logging_options(
        logging_options : Types::LoggingOptions
      ) : Protocol::Request
        input = Types::PutLoggingOptionsRequest.new(logging_options: logging_options)
        put_logging_options(input)
      end
      def put_logging_options(input : Types::PutLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs an analysis of your detector model. For more information, see Troubleshooting a detector
      # model in the AWS IoT Events Developer Guide .
      def start_detector_model_analysis(
        detector_model_definition : Types::DetectorModelDefinition
      ) : Protocol::Request
        input = Types::StartDetectorModelAnalysisRequest.new(detector_model_definition: detector_model_definition)
        start_detector_model_analysis(input)
      end
      def start_detector_model_analysis(input : Types::StartDetectorModelAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DETECTOR_MODEL_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a
      # resource.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the given tags (metadata) from the resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an alarm model. Any alarms that were created based on the previous version are deleted and
      # then created again as new data arrives.
      def update_alarm_model(
        alarm_model_name : String,
        alarm_rule : Types::AlarmRule,
        role_arn : String,
        alarm_capabilities : Types::AlarmCapabilities? = nil,
        alarm_event_actions : Types::AlarmEventActions? = nil,
        alarm_model_description : String? = nil,
        alarm_notification : Types::AlarmNotification? = nil,
        severity : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateAlarmModelRequest.new(alarm_model_name: alarm_model_name, alarm_rule: alarm_rule, role_arn: role_arn, alarm_capabilities: alarm_capabilities, alarm_event_actions: alarm_event_actions, alarm_model_description: alarm_model_description, alarm_notification: alarm_notification, severity: severity)
        update_alarm_model(input)
      end
      def update_alarm_model(input : Types::UpdateAlarmModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ALARM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a detector model. Detectors (instances) spawned by the previous version are deleted and then
      # re-created as new inputs arrive.
      def update_detector_model(
        detector_model_definition : Types::DetectorModelDefinition,
        detector_model_name : String,
        role_arn : String,
        detector_model_description : String? = nil,
        evaluation_method : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDetectorModelRequest.new(detector_model_definition: detector_model_definition, detector_model_name: detector_model_name, role_arn: role_arn, detector_model_description: detector_model_description, evaluation_method: evaluation_method)
        update_detector_model(input)
      end
      def update_detector_model(input : Types::UpdateDetectorModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DETECTOR_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an input.
      def update_input(
        input_definition : Types::InputDefinition,
        input_name : String,
        input_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInputRequest.new(input_definition: input_definition, input_name: input_name, input_description: input_description)
        update_input(input)
      end
      def update_input(input : Types::UpdateInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
