module Aws
  module FraudDetector
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a batch of variables.

      def batch_create_variable(
        variable_entries : Array(Types::VariableEntry),
        tags : Array(Types::Tag)? = nil
      ) : Types::BatchCreateVariableResult

        input = Types::BatchCreateVariableRequest.new(variable_entries: variable_entries, tags: tags)
        batch_create_variable(input)
      end

      def batch_create_variable(input : Types::BatchCreateVariableRequest) : Types::BatchCreateVariableResult
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_VARIABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreateVariableResult, "BatchCreateVariable")
      end

      # Gets a batch of variables.

      def batch_get_variable(
        names : Array(String)
      ) : Types::BatchGetVariableResult

        input = Types::BatchGetVariableRequest.new(names: names)
        batch_get_variable(input)
      end

      def batch_get_variable(input : Types::BatchGetVariableRequest) : Types::BatchGetVariableResult
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_VARIABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetVariableResult, "BatchGetVariable")
      end

      # Cancels an in-progress batch import job.

      def cancel_batch_import_job(
        job_id : String
      ) : Types::CancelBatchImportJobResult

        input = Types::CancelBatchImportJobRequest.new(job_id: job_id)
        cancel_batch_import_job(input)
      end

      def cancel_batch_import_job(input : Types::CancelBatchImportJobRequest) : Types::CancelBatchImportJobResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_BATCH_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelBatchImportJobResult, "CancelBatchImportJob")
      end

      # Cancels the specified batch prediction job.

      def cancel_batch_prediction_job(
        job_id : String
      ) : Types::CancelBatchPredictionJobResult

        input = Types::CancelBatchPredictionJobRequest.new(job_id: job_id)
        cancel_batch_prediction_job(input)
      end

      def cancel_batch_prediction_job(input : Types::CancelBatchPredictionJobRequest) : Types::CancelBatchPredictionJobResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_BATCH_PREDICTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelBatchPredictionJobResult, "CancelBatchPredictionJob")
      end

      # Creates a batch import job.

      def create_batch_import_job(
        event_type_name : String,
        iam_role_arn : String,
        input_path : String,
        job_id : String,
        output_path : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateBatchImportJobResult

        input = Types::CreateBatchImportJobRequest.new(event_type_name: event_type_name, iam_role_arn: iam_role_arn, input_path: input_path, job_id: job_id, output_path: output_path, tags: tags)
        create_batch_import_job(input)
      end

      def create_batch_import_job(input : Types::CreateBatchImportJobRequest) : Types::CreateBatchImportJobResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchImportJobResult, "CreateBatchImportJob")
      end

      # Creates a batch prediction job.

      def create_batch_prediction_job(
        detector_name : String,
        event_type_name : String,
        iam_role_arn : String,
        input_path : String,
        job_id : String,
        output_path : String,
        detector_version : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateBatchPredictionJobResult

        input = Types::CreateBatchPredictionJobRequest.new(detector_name: detector_name, event_type_name: event_type_name, iam_role_arn: iam_role_arn, input_path: input_path, job_id: job_id, output_path: output_path, detector_version: detector_version, tags: tags)
        create_batch_prediction_job(input)
      end

      def create_batch_prediction_job(input : Types::CreateBatchPredictionJobRequest) : Types::CreateBatchPredictionJobResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_PREDICTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchPredictionJobResult, "CreateBatchPredictionJob")
      end

      # Creates a detector version. The detector version starts in a DRAFT status.

      def create_detector_version(
        detector_id : String,
        rules : Array(Types::Rule),
        description : String? = nil,
        external_model_endpoints : Array(String)? = nil,
        model_versions : Array(Types::ModelVersion)? = nil,
        rule_execution_mode : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDetectorVersionResult

        input = Types::CreateDetectorVersionRequest.new(detector_id: detector_id, rules: rules, description: description, external_model_endpoints: external_model_endpoints, model_versions: model_versions, rule_execution_mode: rule_execution_mode, tags: tags)
        create_detector_version(input)
      end

      def create_detector_version(input : Types::CreateDetectorVersionRequest) : Types::CreateDetectorVersionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DETECTOR_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDetectorVersionResult, "CreateDetectorVersion")
      end

      # Creates a list. List is a set of input data for a variable in your event dataset. You use the input
      # data in a rule that's associated with your detector. For more information, see Lists .

      def create_list(
        name : String,
        description : String? = nil,
        elements : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        variable_type : String? = nil
      ) : Types::CreateListResult

        input = Types::CreateListRequest.new(name: name, description: description, elements: elements, tags: tags, variable_type: variable_type)
        create_list(input)
      end

      def create_list(input : Types::CreateListRequest) : Types::CreateListResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateListResult, "CreateList")
      end

      # Creates a model using the specified model type.

      def create_model(
        event_type_name : String,
        model_id : String,
        model_type : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelResult

        input = Types::CreateModelRequest.new(event_type_name: event_type_name, model_id: model_id, model_type: model_type, description: description, tags: tags)
        create_model(input)
      end

      def create_model(input : Types::CreateModelRequest) : Types::CreateModelResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelResult, "CreateModel")
      end

      # Creates a version of the model using the specified model type and model id.

      def create_model_version(
        model_id : String,
        model_type : String,
        training_data_schema : Types::TrainingDataSchema,
        training_data_source : String,
        external_events_detail : Types::ExternalEventsDetail? = nil,
        ingested_events_detail : Types::IngestedEventsDetail? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelVersionResult

        input = Types::CreateModelVersionRequest.new(model_id: model_id, model_type: model_type, training_data_schema: training_data_schema, training_data_source: training_data_source, external_events_detail: external_events_detail, ingested_events_detail: ingested_events_detail, tags: tags)
        create_model_version(input)
      end

      def create_model_version(input : Types::CreateModelVersionRequest) : Types::CreateModelVersionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelVersionResult, "CreateModelVersion")
      end

      # Creates a rule for use with the specified detector.

      def create_rule(
        detector_id : String,
        expression : String,
        language : String,
        outcomes : Array(String),
        rule_id : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleResult

        input = Types::CreateRuleRequest.new(detector_id: detector_id, expression: expression, language: language, outcomes: outcomes, rule_id: rule_id, description: description, tags: tags)
        create_rule(input)
      end

      def create_rule(input : Types::CreateRuleRequest) : Types::CreateRuleResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleResult, "CreateRule")
      end

      # Creates a variable.

      def create_variable(
        data_source : String,
        data_type : String,
        default_value : String,
        name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil,
        variable_type : String? = nil
      ) : Types::CreateVariableResult

        input = Types::CreateVariableRequest.new(data_source: data_source, data_type: data_type, default_value: default_value, name: name, description: description, tags: tags, variable_type: variable_type)
        create_variable(input)
      end

      def create_variable(input : Types::CreateVariableRequest) : Types::CreateVariableResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_VARIABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVariableResult, "CreateVariable")
      end

      # Deletes the specified batch import job ID record. This action does not delete the data that was
      # batch imported.

      def delete_batch_import_job(
        job_id : String
      ) : Types::DeleteBatchImportJobResult

        input = Types::DeleteBatchImportJobRequest.new(job_id: job_id)
        delete_batch_import_job(input)
      end

      def delete_batch_import_job(input : Types::DeleteBatchImportJobRequest) : Types::DeleteBatchImportJobResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_BATCH_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBatchImportJobResult, "DeleteBatchImportJob")
      end

      # Deletes a batch prediction job.

      def delete_batch_prediction_job(
        job_id : String
      ) : Types::DeleteBatchPredictionJobResult

        input = Types::DeleteBatchPredictionJobRequest.new(job_id: job_id)
        delete_batch_prediction_job(input)
      end

      def delete_batch_prediction_job(input : Types::DeleteBatchPredictionJobRequest) : Types::DeleteBatchPredictionJobResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_BATCH_PREDICTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBatchPredictionJobResult, "DeleteBatchPredictionJob")
      end

      # Deletes the detector. Before deleting a detector, you must first delete all detector versions and
      # rule versions associated with the detector. When you delete a detector, Amazon Fraud Detector
      # permanently deletes the detector and the data is no longer stored in Amazon Fraud Detector.

      def delete_detector(
        detector_id : String
      ) : Types::DeleteDetectorResult

        input = Types::DeleteDetectorRequest.new(detector_id: detector_id)
        delete_detector(input)
      end

      def delete_detector(input : Types::DeleteDetectorRequest) : Types::DeleteDetectorResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DETECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDetectorResult, "DeleteDetector")
      end

      # Deletes the detector version. You cannot delete detector versions that are in ACTIVE status. When
      # you delete a detector version, Amazon Fraud Detector permanently deletes the detector and the data
      # is no longer stored in Amazon Fraud Detector.

      def delete_detector_version(
        detector_id : String,
        detector_version_id : String
      ) : Types::DeleteDetectorVersionResult

        input = Types::DeleteDetectorVersionRequest.new(detector_id: detector_id, detector_version_id: detector_version_id)
        delete_detector_version(input)
      end

      def delete_detector_version(input : Types::DeleteDetectorVersionRequest) : Types::DeleteDetectorVersionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DETECTOR_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDetectorVersionResult, "DeleteDetectorVersion")
      end

      # Deletes an entity type. You cannot delete an entity type that is included in an event type. When you
      # delete an entity type, Amazon Fraud Detector permanently deletes that entity type and the data is no
      # longer stored in Amazon Fraud Detector.

      def delete_entity_type(
        name : String
      ) : Types::DeleteEntityTypeResult

        input = Types::DeleteEntityTypeRequest.new(name: name)
        delete_entity_type(input)
      end

      def delete_entity_type(input : Types::DeleteEntityTypeRequest) : Types::DeleteEntityTypeResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENTITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEntityTypeResult, "DeleteEntityType")
      end

      # Deletes the specified event. When you delete an event, Amazon Fraud Detector permanently deletes
      # that event and the event data is no longer stored in Amazon Fraud Detector. If deleteAuditHistory is
      # True , event data is available through search for up to 30 seconds after the delete operation is
      # completed.

      def delete_event(
        event_id : String,
        event_type_name : String,
        delete_audit_history : Bool? = nil
      ) : Types::DeleteEventResult

        input = Types::DeleteEventRequest.new(event_id: event_id, event_type_name: event_type_name, delete_audit_history: delete_audit_history)
        delete_event(input)
      end

      def delete_event(input : Types::DeleteEventRequest) : Types::DeleteEventResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventResult, "DeleteEvent")
      end

      # Deletes an event type. You cannot delete an event type that is used in a detector or a model. When
      # you delete an event type, Amazon Fraud Detector permanently deletes that event type and the data is
      # no longer stored in Amazon Fraud Detector.

      def delete_event_type(
        name : String
      ) : Types::DeleteEventTypeResult

        input = Types::DeleteEventTypeRequest.new(name: name)
        delete_event_type(input)
      end

      def delete_event_type(input : Types::DeleteEventTypeRequest) : Types::DeleteEventTypeResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventTypeResult, "DeleteEventType")
      end

      # Deletes all events of a particular event type.

      def delete_events_by_event_type(
        event_type_name : String
      ) : Types::DeleteEventsByEventTypeResult

        input = Types::DeleteEventsByEventTypeRequest.new(event_type_name: event_type_name)
        delete_events_by_event_type(input)
      end

      def delete_events_by_event_type(input : Types::DeleteEventsByEventTypeRequest) : Types::DeleteEventsByEventTypeResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENTS_BY_EVENT_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventsByEventTypeResult, "DeleteEventsByEventType")
      end

      # Removes a SageMaker model from Amazon Fraud Detector. You can remove an Amazon SageMaker model if it
      # is not associated with a detector version. Removing a SageMaker model disconnects it from Amazon
      # Fraud Detector, but the model remains available in SageMaker.

      def delete_external_model(
        model_endpoint : String
      ) : Types::DeleteExternalModelResult

        input = Types::DeleteExternalModelRequest.new(model_endpoint: model_endpoint)
        delete_external_model(input)
      end

      def delete_external_model(input : Types::DeleteExternalModelRequest) : Types::DeleteExternalModelResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXTERNAL_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteExternalModelResult, "DeleteExternalModel")
      end

      # Deletes a label. You cannot delete labels that are included in an event type in Amazon Fraud
      # Detector. You cannot delete a label assigned to an event ID. You must first delete the relevant
      # event ID. When you delete a label, Amazon Fraud Detector permanently deletes that label and the data
      # is no longer stored in Amazon Fraud Detector.

      def delete_label(
        name : String
      ) : Types::DeleteLabelResult

        input = Types::DeleteLabelRequest.new(name: name)
        delete_label(input)
      end

      def delete_label(input : Types::DeleteLabelRequest) : Types::DeleteLabelResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLabelResult, "DeleteLabel")
      end

      # Deletes the list, provided it is not used in a rule. When you delete a list, Amazon Fraud Detector
      # permanently deletes that list and the elements in the list.

      def delete_list(
        name : String
      ) : Types::DeleteListResult

        input = Types::DeleteListRequest.new(name: name)
        delete_list(input)
      end

      def delete_list(input : Types::DeleteListRequest) : Types::DeleteListResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteListResult, "DeleteList")
      end

      # Deletes a model. You can delete models and model versions in Amazon Fraud Detector, provided that
      # they are not associated with a detector version. When you delete a model, Amazon Fraud Detector
      # permanently deletes that model and the data is no longer stored in Amazon Fraud Detector.

      def delete_model(
        model_id : String,
        model_type : String
      ) : Types::DeleteModelResult

        input = Types::DeleteModelRequest.new(model_id: model_id, model_type: model_type)
        delete_model(input)
      end

      def delete_model(input : Types::DeleteModelRequest) : Types::DeleteModelResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteModelResult, "DeleteModel")
      end

      # Deletes a model version. You can delete models and model versions in Amazon Fraud Detector, provided
      # that they are not associated with a detector version. When you delete a model version, Amazon Fraud
      # Detector permanently deletes that model version and the data is no longer stored in Amazon Fraud
      # Detector.

      def delete_model_version(
        model_id : String,
        model_type : String,
        model_version_number : String
      ) : Types::DeleteModelVersionResult

        input = Types::DeleteModelVersionRequest.new(model_id: model_id, model_type: model_type, model_version_number: model_version_number)
        delete_model_version(input)
      end

      def delete_model_version(input : Types::DeleteModelVersionRequest) : Types::DeleteModelVersionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteModelVersionResult, "DeleteModelVersion")
      end

      # Deletes an outcome. You cannot delete an outcome that is used in a rule version. When you delete an
      # outcome, Amazon Fraud Detector permanently deletes that outcome and the data is no longer stored in
      # Amazon Fraud Detector.

      def delete_outcome(
        name : String
      ) : Types::DeleteOutcomeResult

        input = Types::DeleteOutcomeRequest.new(name: name)
        delete_outcome(input)
      end

      def delete_outcome(input : Types::DeleteOutcomeRequest) : Types::DeleteOutcomeResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_OUTCOME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOutcomeResult, "DeleteOutcome")
      end

      # Deletes the rule. You cannot delete a rule if it is used by an ACTIVE or INACTIVE detector version.
      # When you delete a rule, Amazon Fraud Detector permanently deletes that rule and the data is no
      # longer stored in Amazon Fraud Detector.

      def delete_rule(
        rule : Types::Rule
      ) : Types::DeleteRuleResult

        input = Types::DeleteRuleRequest.new(rule: rule)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleRequest) : Types::DeleteRuleResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleResult, "DeleteRule")
      end

      # Deletes a variable. You can't delete variables that are included in an event type in Amazon Fraud
      # Detector. Amazon Fraud Detector automatically deletes model output variables and SageMaker model
      # output variables when you delete the model. You can't delete these variables manually. When you
      # delete a variable, Amazon Fraud Detector permanently deletes that variable and the data is no longer
      # stored in Amazon Fraud Detector.

      def delete_variable(
        name : String
      ) : Types::DeleteVariableResult

        input = Types::DeleteVariableRequest.new(name: name)
        delete_variable(input)
      end

      def delete_variable(input : Types::DeleteVariableRequest) : Types::DeleteVariableResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_VARIABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVariableResult, "DeleteVariable")
      end

      # Gets all versions for a specified detector.

      def describe_detector(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDetectorResult

        input = Types::DescribeDetectorRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        describe_detector(input)
      end

      def describe_detector(input : Types::DescribeDetectorRequest) : Types::DescribeDetectorResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DETECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDetectorResult, "DescribeDetector")
      end

      # Gets all of the model versions for the specified model type or for the specified model type and
      # model ID. You can also get details for a single, specified model version.

      def describe_model_versions(
        max_results : Int32? = nil,
        model_id : String? = nil,
        model_type : String? = nil,
        model_version_number : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeModelVersionsResult

        input = Types::DescribeModelVersionsRequest.new(max_results: max_results, model_id: model_id, model_type: model_type, model_version_number: model_version_number, next_token: next_token)
        describe_model_versions(input)
      end

      def describe_model_versions(input : Types::DescribeModelVersionsRequest) : Types::DescribeModelVersionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelVersionsResult, "DescribeModelVersions")
      end

      # Gets all batch import jobs or a specific job of the specified ID. This is a paginated API. If you
      # provide a null maxResults , this action retrieves a maximum of 50 records per page. If you provide a
      # maxResults , the value must be between 1 and 50. To get the next page results, provide the
      # pagination token from the GetBatchImportJobsResponse as part of your request. A null pagination
      # token fetches the records from the beginning.

      def get_batch_import_jobs(
        job_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetBatchImportJobsResult

        input = Types::GetBatchImportJobsRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_batch_import_jobs(input)
      end

      def get_batch_import_jobs(input : Types::GetBatchImportJobsRequest) : Types::GetBatchImportJobsResult
        request = Protocol::JsonRpc.build_request(Model::GET_BATCH_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBatchImportJobsResult, "GetBatchImportJobs")
      end

      # Gets all batch prediction jobs or a specific job if you specify a job ID. This is a paginated API.
      # If you provide a null maxResults, this action retrieves a maximum of 50 records per page. If you
      # provide a maxResults, the value must be between 1 and 50. To get the next page results, provide the
      # pagination token from the GetBatchPredictionJobsResponse as part of your request. A null pagination
      # token fetches the records from the beginning.

      def get_batch_prediction_jobs(
        job_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetBatchPredictionJobsResult

        input = Types::GetBatchPredictionJobsRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_batch_prediction_jobs(input)
      end

      def get_batch_prediction_jobs(input : Types::GetBatchPredictionJobsRequest) : Types::GetBatchPredictionJobsResult
        request = Protocol::JsonRpc.build_request(Model::GET_BATCH_PREDICTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBatchPredictionJobsResult, "GetBatchPredictionJobs")
      end

      # Retrieves the status of a DeleteEventsByEventType action.

      def get_delete_events_by_event_type_status(
        event_type_name : String
      ) : Types::GetDeleteEventsByEventTypeStatusResult

        input = Types::GetDeleteEventsByEventTypeStatusRequest.new(event_type_name: event_type_name)
        get_delete_events_by_event_type_status(input)
      end

      def get_delete_events_by_event_type_status(input : Types::GetDeleteEventsByEventTypeStatusRequest) : Types::GetDeleteEventsByEventTypeStatusResult
        request = Protocol::JsonRpc.build_request(Model::GET_DELETE_EVENTS_BY_EVENT_TYPE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeleteEventsByEventTypeStatusResult, "GetDeleteEventsByEventTypeStatus")
      end

      # Gets a particular detector version.

      def get_detector_version(
        detector_id : String,
        detector_version_id : String
      ) : Types::GetDetectorVersionResult

        input = Types::GetDetectorVersionRequest.new(detector_id: detector_id, detector_version_id: detector_version_id)
        get_detector_version(input)
      end

      def get_detector_version(input : Types::GetDetectorVersionRequest) : Types::GetDetectorVersionResult
        request = Protocol::JsonRpc.build_request(Model::GET_DETECTOR_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDetectorVersionResult, "GetDetectorVersion")
      end

      # Gets all detectors or a single detector if a detectorId is specified. This is a paginated API. If
      # you provide a null maxResults , this action retrieves a maximum of 10 records per page. If you
      # provide a maxResults , the value must be between 5 and 10. To get the next page results, provide the
      # pagination token from the GetDetectorsResponse as part of your request. A null pagination token
      # fetches the records from the beginning.

      def get_detectors(
        detector_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetDetectorsResult

        input = Types::GetDetectorsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        get_detectors(input)
      end

      def get_detectors(input : Types::GetDetectorsRequest) : Types::GetDetectorsResult
        request = Protocol::JsonRpc.build_request(Model::GET_DETECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDetectorsResult, "GetDetectors")
      end

      # Gets all entity types or a specific entity type if a name is specified. This is a paginated API. If
      # you provide a null maxResults , this action retrieves a maximum of 10 records per page. If you
      # provide a maxResults , the value must be between 5 and 10. To get the next page results, provide the
      # pagination token from the GetEntityTypesResponse as part of your request. A null pagination token
      # fetches the records from the beginning.

      def get_entity_types(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetEntityTypesResult

        input = Types::GetEntityTypesRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_entity_types(input)
      end

      def get_entity_types(input : Types::GetEntityTypesRequest) : Types::GetEntityTypesResult
        request = Protocol::JsonRpc.build_request(Model::GET_ENTITY_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEntityTypesResult, "GetEntityTypes")
      end

      # Retrieves details of events stored with Amazon Fraud Detector. This action does not retrieve
      # prediction results.

      def get_event(
        event_id : String,
        event_type_name : String
      ) : Types::GetEventResult

        input = Types::GetEventRequest.new(event_id: event_id, event_type_name: event_type_name)
        get_event(input)
      end

      def get_event(input : Types::GetEventRequest) : Types::GetEventResult
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventResult, "GetEvent")
      end

      # Evaluates an event against a detector version. If a version ID is not provided, the detector’s (
      # ACTIVE ) version is used.

      def get_event_prediction(
        detector_id : String,
        entities : Array(Types::Entity),
        event_id : String,
        event_timestamp : String,
        event_type_name : String,
        event_variables : Hash(String, String),
        detector_version_id : String? = nil,
        external_model_endpoint_data_blobs : Hash(String, Types::ModelEndpointDataBlob)? = nil
      ) : Types::GetEventPredictionResult

        input = Types::GetEventPredictionRequest.new(detector_id: detector_id, entities: entities, event_id: event_id, event_timestamp: event_timestamp, event_type_name: event_type_name, event_variables: event_variables, detector_version_id: detector_version_id, external_model_endpoint_data_blobs: external_model_endpoint_data_blobs)
        get_event_prediction(input)
      end

      def get_event_prediction(input : Types::GetEventPredictionRequest) : Types::GetEventPredictionResult
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_PREDICTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventPredictionResult, "GetEventPrediction")
      end

      # Gets details of the past fraud predictions for the specified event ID, event type, detector ID, and
      # detector version ID that was generated in the specified time period.

      def get_event_prediction_metadata(
        detector_id : String,
        detector_version_id : String,
        event_id : String,
        event_type_name : String,
        prediction_timestamp : String
      ) : Types::GetEventPredictionMetadataResult

        input = Types::GetEventPredictionMetadataRequest.new(detector_id: detector_id, detector_version_id: detector_version_id, event_id: event_id, event_type_name: event_type_name, prediction_timestamp: prediction_timestamp)
        get_event_prediction_metadata(input)
      end

      def get_event_prediction_metadata(input : Types::GetEventPredictionMetadataRequest) : Types::GetEventPredictionMetadataResult
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_PREDICTION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventPredictionMetadataResult, "GetEventPredictionMetadata")
      end

      # Gets all event types or a specific event type if name is provided. This is a paginated API. If you
      # provide a null maxResults , this action retrieves a maximum of 10 records per page. If you provide a
      # maxResults , the value must be between 5 and 10. To get the next page results, provide the
      # pagination token from the GetEventTypesResponse as part of your request. A null pagination token
      # fetches the records from the beginning.

      def get_event_types(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetEventTypesResult

        input = Types::GetEventTypesRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_event_types(input)
      end

      def get_event_types(input : Types::GetEventTypesRequest) : Types::GetEventTypesResult
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventTypesResult, "GetEventTypes")
      end

      # Gets the details for one or more Amazon SageMaker models that have been imported into the service.
      # This is a paginated API. If you provide a null maxResults , this actions retrieves a maximum of 10
      # records per page. If you provide a maxResults , the value must be between 5 and 10. To get the next
      # page results, provide the pagination token from the GetExternalModelsResult as part of your request.
      # A null pagination token fetches the records from the beginning.

      def get_external_models(
        max_results : Int32? = nil,
        model_endpoint : String? = nil,
        next_token : String? = nil
      ) : Types::GetExternalModelsResult

        input = Types::GetExternalModelsRequest.new(max_results: max_results, model_endpoint: model_endpoint, next_token: next_token)
        get_external_models(input)
      end

      def get_external_models(input : Types::GetExternalModelsRequest) : Types::GetExternalModelsResult
        request = Protocol::JsonRpc.build_request(Model::GET_EXTERNAL_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExternalModelsResult, "GetExternalModels")
      end

      # Gets the encryption key if a KMS key has been specified to be used to encrypt content in Amazon
      # Fraud Detector.


      def get_kms_encryption_key : Types::GetKMSEncryptionKeyResult
        request = Protocol::JsonRpc.build_request(Model::GET_KMS_ENCRYPTION_KEY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetKMSEncryptionKeyResult, "GetKMSEncryptionKey")
      end

      # Gets all labels or a specific label if name is provided. This is a paginated API. If you provide a
      # null maxResults , this action retrieves a maximum of 50 records per page. If you provide a
      # maxResults , the value must be between 10 and 50. To get the next page results, provide the
      # pagination token from the GetGetLabelsResponse as part of your request. A null pagination token
      # fetches the records from the beginning.

      def get_labels(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetLabelsResult

        input = Types::GetLabelsRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_labels(input)
      end

      def get_labels(input : Types::GetLabelsRequest) : Types::GetLabelsResult
        request = Protocol::JsonRpc.build_request(Model::GET_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLabelsResult, "GetLabels")
      end

      # Gets all the elements in the specified list.

      def get_list_elements(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetListElementsResult

        input = Types::GetListElementsRequest.new(name: name, max_results: max_results, next_token: next_token)
        get_list_elements(input)
      end

      def get_list_elements(input : Types::GetListElementsRequest) : Types::GetListElementsResult
        request = Protocol::JsonRpc.build_request(Model::GET_LIST_ELEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetListElementsResult, "GetListElements")
      end

      # Gets the metadata of either all the lists under the account or the specified list.

      def get_lists_metadata(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetListsMetadataResult

        input = Types::GetListsMetadataRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_lists_metadata(input)
      end

      def get_lists_metadata(input : Types::GetListsMetadataRequest) : Types::GetListsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::GET_LISTS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetListsMetadataResult, "GetListsMetadata")
      end

      # Gets the details of the specified model version.

      def get_model_version(
        model_id : String,
        model_type : String,
        model_version_number : String
      ) : Types::GetModelVersionResult

        input = Types::GetModelVersionRequest.new(model_id: model_id, model_type: model_type, model_version_number: model_version_number)
        get_model_version(input)
      end

      def get_model_version(input : Types::GetModelVersionRequest) : Types::GetModelVersionResult
        request = Protocol::JsonRpc.build_request(Model::GET_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetModelVersionResult, "GetModelVersion")
      end

      # Gets one or more models. Gets all models for the Amazon Web Services account if no model type and no
      # model id provided. Gets all models for the Amazon Web Services account and model type, if the model
      # type is specified but model id is not provided. Gets a specific model if (model type, model id)
      # tuple is specified. This is a paginated API. If you provide a null maxResults , this action
      # retrieves a maximum of 10 records per page. If you provide a maxResults , the value must be between
      # 1 and 10. To get the next page results, provide the pagination token from the response as part of
      # your request. A null pagination token fetches the records from the beginning.

      def get_models(
        max_results : Int32? = nil,
        model_id : String? = nil,
        model_type : String? = nil,
        next_token : String? = nil
      ) : Types::GetModelsResult

        input = Types::GetModelsRequest.new(max_results: max_results, model_id: model_id, model_type: model_type, next_token: next_token)
        get_models(input)
      end

      def get_models(input : Types::GetModelsRequest) : Types::GetModelsResult
        request = Protocol::JsonRpc.build_request(Model::GET_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetModelsResult, "GetModels")
      end

      # Gets one or more outcomes. This is a paginated API. If you provide a null maxResults , this actions
      # retrieves a maximum of 100 records per page. If you provide a maxResults , the value must be between
      # 50 and 100. To get the next page results, provide the pagination token from the GetOutcomesResult as
      # part of your request. A null pagination token fetches the records from the beginning.

      def get_outcomes(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetOutcomesResult

        input = Types::GetOutcomesRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_outcomes(input)
      end

      def get_outcomes(input : Types::GetOutcomesRequest) : Types::GetOutcomesResult
        request = Protocol::JsonRpc.build_request(Model::GET_OUTCOMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOutcomesResult, "GetOutcomes")
      end

      # Get all rules for a detector (paginated) if ruleId and ruleVersion are not specified. Gets all rules
      # for the detector and the ruleId if present (paginated). Gets a specific rule if both the ruleId and
      # the ruleVersion are specified. This is a paginated API. Providing null maxResults results in
      # retrieving maximum of 100 records per page. If you provide maxResults the value must be between 50
      # and 100. To get the next page result, a provide a pagination token from GetRulesResult as part of
      # your request. Null pagination token fetches the records from the beginning.

      def get_rules(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        rule_id : String? = nil,
        rule_version : String? = nil
      ) : Types::GetRulesResult

        input = Types::GetRulesRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token, rule_id: rule_id, rule_version: rule_version)
        get_rules(input)
      end

      def get_rules(input : Types::GetRulesRequest) : Types::GetRulesResult
        request = Protocol::JsonRpc.build_request(Model::GET_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRulesResult, "GetRules")
      end

      # Gets all of the variables or the specific variable. This is a paginated API. Providing null
      # maxSizePerPage results in retrieving maximum of 100 records per page. If you provide maxSizePerPage
      # the value must be between 50 and 100. To get the next page result, a provide a pagination token from
      # GetVariablesResult as part of your request. Null pagination token fetches the records from the
      # beginning.

      def get_variables(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::GetVariablesResult

        input = Types::GetVariablesRequest.new(max_results: max_results, name: name, next_token: next_token)
        get_variables(input)
      end

      def get_variables(input : Types::GetVariablesRequest) : Types::GetVariablesResult
        request = Protocol::JsonRpc.build_request(Model::GET_VARIABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVariablesResult, "GetVariables")
      end

      # Gets a list of past predictions. The list can be filtered by detector ID, detector version ID, event
      # ID, event type, or by specifying a time period. If filter is not specified, the most recent
      # prediction is returned. For example, the following filter lists all past predictions for xyz event
      # type - { "eventType":{ "value": "xyz" }” } This is a paginated API. If you provide a null maxResults
      # , this action will retrieve a maximum of 10 records per page. If you provide a maxResults , the
      # value must be between 50 and 100. To get the next page results, provide the nextToken from the
      # response as part of your request. A null nextToken fetches the records from the beginning.

      def list_event_predictions(
        detector_id : Types::FilterCondition? = nil,
        detector_version_id : Types::FilterCondition? = nil,
        event_id : Types::FilterCondition? = nil,
        event_type : Types::FilterCondition? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        prediction_time_range : Types::PredictionTimeRange? = nil
      ) : Types::ListEventPredictionsResult

        input = Types::ListEventPredictionsRequest.new(detector_id: detector_id, detector_version_id: detector_version_id, event_id: event_id, event_type: event_type, max_results: max_results, next_token: next_token, prediction_time_range: prediction_time_range)
        list_event_predictions(input)
      end

      def list_event_predictions(input : Types::ListEventPredictionsRequest) : Types::ListEventPredictionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENT_PREDICTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventPredictionsResult, "ListEventPredictions")
      end

      # Lists all tags associated with the resource. This is a paginated API. To get the next page results,
      # provide the pagination token from the response as part of your request. A null pagination token
      # fetches the records from the beginning.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Creates or updates a detector.

      def put_detector(
        detector_id : String,
        event_type_name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutDetectorResult

        input = Types::PutDetectorRequest.new(detector_id: detector_id, event_type_name: event_type_name, description: description, tags: tags)
        put_detector(input)
      end

      def put_detector(input : Types::PutDetectorRequest) : Types::PutDetectorResult
        request = Protocol::JsonRpc.build_request(Model::PUT_DETECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutDetectorResult, "PutDetector")
      end

      # Creates or updates an entity type. An entity represents who is performing the event. As part of a
      # fraud prediction, you pass the entity ID to indicate the specific entity who performed the event. An
      # entity type classifies the entity. Example classifications include customer, merchant, or account.

      def put_entity_type(
        name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutEntityTypeResult

        input = Types::PutEntityTypeRequest.new(name: name, description: description, tags: tags)
        put_entity_type(input)
      end

      def put_entity_type(input : Types::PutEntityTypeRequest) : Types::PutEntityTypeResult
        request = Protocol::JsonRpc.build_request(Model::PUT_ENTITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEntityTypeResult, "PutEntityType")
      end

      # Creates or updates an event type. An event is a business activity that is evaluated for fraud risk.
      # With Amazon Fraud Detector, you generate fraud predictions for events. An event type defines the
      # structure for an event sent to Amazon Fraud Detector. This includes the variables sent as part of
      # the event, the entity performing the event (such as a customer), and the labels that classify the
      # event. Example event types include online payment transactions, account registrations, and
      # authentications.

      def put_event_type(
        entity_types : Array(String),
        event_variables : Array(String),
        name : String,
        description : String? = nil,
        event_ingestion : String? = nil,
        event_orchestration : Types::EventOrchestration? = nil,
        labels : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutEventTypeResult

        input = Types::PutEventTypeRequest.new(entity_types: entity_types, event_variables: event_variables, name: name, description: description, event_ingestion: event_ingestion, event_orchestration: event_orchestration, labels: labels, tags: tags)
        put_event_type(input)
      end

      def put_event_type(input : Types::PutEventTypeRequest) : Types::PutEventTypeResult
        request = Protocol::JsonRpc.build_request(Model::PUT_EVENT_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEventTypeResult, "PutEventType")
      end

      # Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the
      # configuration of the model endpoint, including the IAM role and/or the mapped variables.

      def put_external_model(
        input_configuration : Types::ModelInputConfiguration,
        invoke_model_endpoint_role_arn : String,
        model_endpoint : String,
        model_endpoint_status : String,
        model_source : String,
        output_configuration : Types::ModelOutputConfiguration,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutExternalModelResult

        input = Types::PutExternalModelRequest.new(input_configuration: input_configuration, invoke_model_endpoint_role_arn: invoke_model_endpoint_role_arn, model_endpoint: model_endpoint, model_endpoint_status: model_endpoint_status, model_source: model_source, output_configuration: output_configuration, tags: tags)
        put_external_model(input)
      end

      def put_external_model(input : Types::PutExternalModelRequest) : Types::PutExternalModelResult
        request = Protocol::JsonRpc.build_request(Model::PUT_EXTERNAL_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutExternalModelResult, "PutExternalModel")
      end

      # Specifies the KMS key to be used to encrypt content in Amazon Fraud Detector.

      def put_kms_encryption_key(
        kms_encryption_key_arn : String
      ) : Types::PutKMSEncryptionKeyResult

        input = Types::PutKMSEncryptionKeyRequest.new(kms_encryption_key_arn: kms_encryption_key_arn)
        put_kms_encryption_key(input)
      end

      def put_kms_encryption_key(input : Types::PutKMSEncryptionKeyRequest) : Types::PutKMSEncryptionKeyResult
        request = Protocol::JsonRpc.build_request(Model::PUT_KMS_ENCRYPTION_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutKMSEncryptionKeyResult, "PutKMSEncryptionKey")
      end

      # Creates or updates label. A label classifies an event as fraudulent or legitimate. Labels are
      # associated with event types and used to train supervised machine learning models in Amazon Fraud
      # Detector.

      def put_label(
        name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutLabelResult

        input = Types::PutLabelRequest.new(name: name, description: description, tags: tags)
        put_label(input)
      end

      def put_label(input : Types::PutLabelRequest) : Types::PutLabelResult
        request = Protocol::JsonRpc.build_request(Model::PUT_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLabelResult, "PutLabel")
      end

      # Creates or updates an outcome.

      def put_outcome(
        name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutOutcomeResult

        input = Types::PutOutcomeRequest.new(name: name, description: description, tags: tags)
        put_outcome(input)
      end

      def put_outcome(input : Types::PutOutcomeRequest) : Types::PutOutcomeResult
        request = Protocol::JsonRpc.build_request(Model::PUT_OUTCOME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutOutcomeResult, "PutOutcome")
      end

      # Stores events in Amazon Fraud Detector without generating fraud predictions for those events. For
      # example, you can use SendEvent to upload a historical dataset, which you can then later use to train
      # a model.

      def send_event(
        entities : Array(Types::Entity),
        event_id : String,
        event_timestamp : String,
        event_type_name : String,
        event_variables : Hash(String, String),
        assigned_label : String? = nil,
        label_timestamp : String? = nil
      ) : Types::SendEventResult

        input = Types::SendEventRequest.new(entities: entities, event_id: event_id, event_timestamp: event_timestamp, event_type_name: event_type_name, event_variables: event_variables, assigned_label: assigned_label, label_timestamp: label_timestamp)
        send_event(input)
      end

      def send_event(input : Types::SendEventRequest) : Types::SendEventResult
        request = Protocol::JsonRpc.build_request(Model::SEND_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendEventResult, "SendEvent")
      end

      # Assigns tags to a resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResult

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResult
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResult, "TagResource")
      end

      # Removes tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResult

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResult
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResult, "UntagResource")
      end

      # Updates a detector version. The detector version attributes that you can update include models,
      # external model endpoints, rules, rule execution mode, and description. You can only update a DRAFT
      # detector version.

      def update_detector_version(
        detector_id : String,
        detector_version_id : String,
        external_model_endpoints : Array(String),
        rules : Array(Types::Rule),
        description : String? = nil,
        model_versions : Array(Types::ModelVersion)? = nil,
        rule_execution_mode : String? = nil
      ) : Types::UpdateDetectorVersionResult

        input = Types::UpdateDetectorVersionRequest.new(detector_id: detector_id, detector_version_id: detector_version_id, external_model_endpoints: external_model_endpoints, rules: rules, description: description, model_versions: model_versions, rule_execution_mode: rule_execution_mode)
        update_detector_version(input)
      end

      def update_detector_version(input : Types::UpdateDetectorVersionRequest) : Types::UpdateDetectorVersionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DETECTOR_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDetectorVersionResult, "UpdateDetectorVersion")
      end

      # Updates the detector version's description. You can update the metadata for any detector version (
      # DRAFT, ACTIVE, or INACTIVE ).

      def update_detector_version_metadata(
        description : String,
        detector_id : String,
        detector_version_id : String
      ) : Types::UpdateDetectorVersionMetadataResult

        input = Types::UpdateDetectorVersionMetadataRequest.new(description: description, detector_id: detector_id, detector_version_id: detector_version_id)
        update_detector_version_metadata(input)
      end

      def update_detector_version_metadata(input : Types::UpdateDetectorVersionMetadataRequest) : Types::UpdateDetectorVersionMetadataResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DETECTOR_VERSION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDetectorVersionMetadataResult, "UpdateDetectorVersionMetadata")
      end

      # Updates the detector version’s status. You can perform the following promotions or demotions using
      # UpdateDetectorVersionStatus : DRAFT to ACTIVE , ACTIVE to INACTIVE , and INACTIVE to ACTIVE .

      def update_detector_version_status(
        detector_id : String,
        detector_version_id : String,
        status : String
      ) : Types::UpdateDetectorVersionStatusResult

        input = Types::UpdateDetectorVersionStatusRequest.new(detector_id: detector_id, detector_version_id: detector_version_id, status: status)
        update_detector_version_status(input)
      end

      def update_detector_version_status(input : Types::UpdateDetectorVersionStatusRequest) : Types::UpdateDetectorVersionStatusResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DETECTOR_VERSION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDetectorVersionStatusResult, "UpdateDetectorVersionStatus")
      end

      # Updates the specified event with a new label.

      def update_event_label(
        assigned_label : String,
        event_id : String,
        event_type_name : String,
        label_timestamp : String
      ) : Types::UpdateEventLabelResult

        input = Types::UpdateEventLabelRequest.new(assigned_label: assigned_label, event_id: event_id, event_type_name: event_type_name, label_timestamp: label_timestamp)
        update_event_label(input)
      end

      def update_event_label(input : Types::UpdateEventLabelRequest) : Types::UpdateEventLabelResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EVENT_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEventLabelResult, "UpdateEventLabel")
      end

      # Updates a list.

      def update_list(
        name : String,
        description : String? = nil,
        elements : Array(String)? = nil,
        update_mode : String? = nil,
        variable_type : String? = nil
      ) : Types::UpdateListResult

        input = Types::UpdateListRequest.new(name: name, description: description, elements: elements, update_mode: update_mode, variable_type: variable_type)
        update_list(input)
      end

      def update_list(input : Types::UpdateListRequest) : Types::UpdateListResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateListResult, "UpdateList")
      end

      # Updates model description.

      def update_model(
        model_id : String,
        model_type : String,
        description : String? = nil
      ) : Types::UpdateModelResult

        input = Types::UpdateModelRequest.new(model_id: model_id, model_type: model_type, description: description)
        update_model(input)
      end

      def update_model(input : Types::UpdateModelRequest) : Types::UpdateModelResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelResult, "UpdateModel")
      end

      # Updates a model version. Updating a model version retrains an existing model version using updated
      # training data and produces a new minor version of the model. You can update the training data set
      # location and data access role attributes using this action. This action creates and trains a new
      # minor version of the model, for example version 1.01, 1.02, 1.03.

      def update_model_version(
        major_version_number : String,
        model_id : String,
        model_type : String,
        external_events_detail : Types::ExternalEventsDetail? = nil,
        ingested_events_detail : Types::IngestedEventsDetail? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UpdateModelVersionResult

        input = Types::UpdateModelVersionRequest.new(major_version_number: major_version_number, model_id: model_id, model_type: model_type, external_events_detail: external_events_detail, ingested_events_detail: ingested_events_detail, tags: tags)
        update_model_version(input)
      end

      def update_model_version(input : Types::UpdateModelVersionRequest) : Types::UpdateModelVersionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelVersionResult, "UpdateModelVersion")
      end

      # Updates the status of a model version. You can perform the following status updates: Change the
      # TRAINING_IN_PROGRESS status to TRAINING_CANCELLED . Change the TRAINING_COMPLETE status to ACTIVE .
      # Change ACTIVE to INACTIVE .

      def update_model_version_status(
        model_id : String,
        model_type : String,
        model_version_number : String,
        status : String
      ) : Types::UpdateModelVersionStatusResult

        input = Types::UpdateModelVersionStatusRequest.new(model_id: model_id, model_type: model_type, model_version_number: model_version_number, status: status)
        update_model_version_status(input)
      end

      def update_model_version_status(input : Types::UpdateModelVersionStatusRequest) : Types::UpdateModelVersionStatusResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL_VERSION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelVersionStatusResult, "UpdateModelVersionStatus")
      end

      # Updates a rule's metadata. The description attribute can be updated.

      def update_rule_metadata(
        description : String,
        rule : Types::Rule
      ) : Types::UpdateRuleMetadataResult

        input = Types::UpdateRuleMetadataRequest.new(description: description, rule: rule)
        update_rule_metadata(input)
      end

      def update_rule_metadata(input : Types::UpdateRuleMetadataRequest) : Types::UpdateRuleMetadataResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleMetadataResult, "UpdateRuleMetadata")
      end

      # Updates a rule version resulting in a new rule version. Updates a rule version resulting in a new
      # rule version (version 1, 2, 3 ...).

      def update_rule_version(
        expression : String,
        language : String,
        outcomes : Array(String),
        rule : Types::Rule,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UpdateRuleVersionResult

        input = Types::UpdateRuleVersionRequest.new(expression: expression, language: language, outcomes: outcomes, rule: rule, description: description, tags: tags)
        update_rule_version(input)
      end

      def update_rule_version(input : Types::UpdateRuleVersionRequest) : Types::UpdateRuleVersionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleVersionResult, "UpdateRuleVersion")
      end

      # Updates a variable.

      def update_variable(
        name : String,
        default_value : String? = nil,
        description : String? = nil,
        variable_type : String? = nil
      ) : Types::UpdateVariableResult

        input = Types::UpdateVariableRequest.new(name: name, default_value: default_value, description: description, variable_type: variable_type)
        update_variable(input)
      end

      def update_variable(input : Types::UpdateVariableRequest) : Types::UpdateVariableResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VARIABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVariableResult, "UpdateVariable")
      end
    end
  end
end
