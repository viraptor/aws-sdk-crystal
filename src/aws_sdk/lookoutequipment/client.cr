module AwsSdk
  module LookoutEquipment
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a container for a collection of data being ingested for analysis. The dataset contains the
      # metadata describing where the data is and what the data actually looks like. For example, it
      # contains the location of the data source, the data schema, and other information. A dataset also
      # contains any tags associated with the ingested data.

      def create_dataset(
        client_token : String,
        dataset_name : String,
        dataset_schema : Types::DatasetSchema? = nil,
        server_side_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetResponse

        input = Types::CreateDatasetRequest.new(client_token: client_token, dataset_name: dataset_name, dataset_schema: dataset_schema, server_side_kms_key_id: server_side_kms_key_id, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Types::CreateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetResponse, "CreateDataset")
      end

      # Creates a scheduled inference. Scheduling an inference is setting up a continuous real-time
      # inference plan to analyze new measurement data. When setting up the schedule, you provide an S3
      # bucket location for the input data, assign it a delimiter between separate entries in the data, set
      # an offset delay if desired, and set the frequency of inferencing. You must also provide an S3 bucket
      # location for the output data.

      def create_inference_scheduler(
        client_token : String,
        data_input_configuration : Types::InferenceInputConfiguration,
        data_output_configuration : Types::InferenceOutputConfiguration,
        data_upload_frequency : String,
        inference_scheduler_name : String,
        model_name : String,
        role_arn : String,
        data_delay_offset_in_minutes : Int64? = nil,
        server_side_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInferenceSchedulerResponse

        input = Types::CreateInferenceSchedulerRequest.new(client_token: client_token, data_input_configuration: data_input_configuration, data_output_configuration: data_output_configuration, data_upload_frequency: data_upload_frequency, inference_scheduler_name: inference_scheduler_name, model_name: model_name, role_arn: role_arn, data_delay_offset_in_minutes: data_delay_offset_in_minutes, server_side_kms_key_id: server_side_kms_key_id, tags: tags)
        create_inference_scheduler(input)
      end

      def create_inference_scheduler(input : Types::CreateInferenceSchedulerRequest) : Types::CreateInferenceSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInferenceSchedulerResponse, "CreateInferenceScheduler")
      end

      # Creates a label for an event.

      def create_label(
        client_token : String,
        end_time : Time,
        label_group_name : String,
        rating : String,
        start_time : Time,
        equipment : String? = nil,
        fault_code : String? = nil,
        notes : String? = nil
      ) : Types::CreateLabelResponse

        input = Types::CreateLabelRequest.new(client_token: client_token, end_time: end_time, label_group_name: label_group_name, rating: rating, start_time: start_time, equipment: equipment, fault_code: fault_code, notes: notes)
        create_label(input)
      end

      def create_label(input : Types::CreateLabelRequest) : Types::CreateLabelResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLabelResponse, "CreateLabel")
      end

      # Creates a group of labels.

      def create_label_group(
        client_token : String,
        label_group_name : String,
        fault_codes : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLabelGroupResponse

        input = Types::CreateLabelGroupRequest.new(client_token: client_token, label_group_name: label_group_name, fault_codes: fault_codes, tags: tags)
        create_label_group(input)
      end

      def create_label_group(input : Types::CreateLabelGroupRequest) : Types::CreateLabelGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LABEL_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLabelGroupResponse, "CreateLabelGroup")
      end

      # Creates a machine learning model for data inference. A machine-learning (ML) model is a mathematical
      # model that finds patterns in your data. In Amazon Lookout for Equipment, the model learns the
      # patterns of normal behavior and detects abnormal behavior that could be potential equipment failure
      # (or maintenance events). The models are made by analyzing normal data and abnormalities in machine
      # behavior that have already occurred. Your model is trained using a portion of the data from your
      # dataset and uses that data to learn patterns of normal behavior and abnormal patterns that lead to
      # equipment failure. Another portion of the data is used to evaluate the model's accuracy.

      def create_model(
        client_token : String,
        dataset_name : String,
        model_name : String,
        data_pre_processing_configuration : Types::DataPreProcessingConfiguration? = nil,
        dataset_schema : Types::DatasetSchema? = nil,
        evaluation_data_end_time : Time? = nil,
        evaluation_data_start_time : Time? = nil,
        labels_input_configuration : Types::LabelsInputConfiguration? = nil,
        model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
        off_condition : String? = nil,
        role_arn : String? = nil,
        server_side_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        training_data_end_time : Time? = nil,
        training_data_start_time : Time? = nil
      ) : Types::CreateModelResponse

        input = Types::CreateModelRequest.new(client_token: client_token, dataset_name: dataset_name, model_name: model_name, data_pre_processing_configuration: data_pre_processing_configuration, dataset_schema: dataset_schema, evaluation_data_end_time: evaluation_data_end_time, evaluation_data_start_time: evaluation_data_start_time, labels_input_configuration: labels_input_configuration, model_diagnostics_output_configuration: model_diagnostics_output_configuration, off_condition: off_condition, role_arn: role_arn, server_side_kms_key_id: server_side_kms_key_id, tags: tags, training_data_end_time: training_data_end_time, training_data_start_time: training_data_start_time)
        create_model(input)
      end

      def create_model(input : Types::CreateModelRequest) : Types::CreateModelResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelResponse, "CreateModel")
      end

      # Creates a retraining scheduler on the specified model.

      def create_retraining_scheduler(
        client_token : String,
        lookback_window : String,
        model_name : String,
        retraining_frequency : String,
        promote_mode : String? = nil,
        retraining_start_date : Time? = nil
      ) : Types::CreateRetrainingSchedulerResponse

        input = Types::CreateRetrainingSchedulerRequest.new(client_token: client_token, lookback_window: lookback_window, model_name: model_name, retraining_frequency: retraining_frequency, promote_mode: promote_mode, retraining_start_date: retraining_start_date)
        create_retraining_scheduler(input)
      end

      def create_retraining_scheduler(input : Types::CreateRetrainingSchedulerRequest) : Types::CreateRetrainingSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRetrainingSchedulerResponse, "CreateRetrainingScheduler")
      end

      # Deletes a dataset and associated artifacts. The operation will check to see if any inference
      # scheduler or data ingestion job is currently using the dataset, and if there isn't, the dataset, its
      # metadata, and any associated data stored in S3 will be deleted. This does not affect any models that
      # used this dataset for training and evaluation, but does prevent it from being used in the future.

      def delete_dataset(
        dataset_name : String
      ) : Nil

        input = Types::DeleteDatasetRequest.new(dataset_name: dataset_name)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an inference scheduler that has been set up. Prior inference results will not be deleted.

      def delete_inference_scheduler(
        inference_scheduler_name : String
      ) : Nil

        input = Types::DeleteInferenceSchedulerRequest.new(inference_scheduler_name: inference_scheduler_name)
        delete_inference_scheduler(input)
      end

      def delete_inference_scheduler(input : Types::DeleteInferenceSchedulerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a label.

      def delete_label(
        label_group_name : String,
        label_id : String
      ) : Nil

        input = Types::DeleteLabelRequest.new(label_group_name: label_group_name, label_id: label_id)
        delete_label(input)
      end

      def delete_label(input : Types::DeleteLabelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a group of labels.

      def delete_label_group(
        label_group_name : String
      ) : Nil

        input = Types::DeleteLabelGroupRequest.new(label_group_name: label_group_name)
        delete_label_group(input)
      end

      def delete_label_group(input : Types::DeleteLabelGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_LABEL_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a machine learning model currently available for Amazon Lookout for Equipment. This will
      # prevent it from being used with an inference scheduler, even one that is already set up.

      def delete_model(
        model_name : String
      ) : Nil

        input = Types::DeleteModelRequest.new(model_name: model_name)
        delete_model(input)
      end

      def delete_model(input : Types::DeleteModelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource policy attached to the resource.

      def delete_resource_policy(
        resource_arn : String
      ) : Nil

        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a retraining scheduler from a model. The retraining scheduler must be in the STOPPED status.

      def delete_retraining_scheduler(
        model_name : String
      ) : Nil

        input = Types::DeleteRetrainingSchedulerRequest.new(model_name: model_name)
        delete_retraining_scheduler(input)
      end

      def delete_retraining_scheduler(input : Types::DeleteRetrainingSchedulerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Provides information on a specific data ingestion job such as creation time, dataset ARN, and
      # status.

      def describe_data_ingestion_job(
        job_id : String
      ) : Types::DescribeDataIngestionJobResponse

        input = Types::DescribeDataIngestionJobRequest.new(job_id: job_id)
        describe_data_ingestion_job(input)
      end

      def describe_data_ingestion_job(input : Types::DescribeDataIngestionJobRequest) : Types::DescribeDataIngestionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_INGESTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataIngestionJobResponse, "DescribeDataIngestionJob")
      end

      # Provides a JSON description of the data in each time series dataset, including names, column names,
      # and data types.

      def describe_dataset(
        dataset_name : String
      ) : Types::DescribeDatasetResponse

        input = Types::DescribeDatasetRequest.new(dataset_name: dataset_name)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Types::DescribeDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetResponse, "DescribeDataset")
      end

      # Specifies information about the inference scheduler being used, including name, model, status, and
      # associated metadata

      def describe_inference_scheduler(
        inference_scheduler_name : String
      ) : Types::DescribeInferenceSchedulerResponse

        input = Types::DescribeInferenceSchedulerRequest.new(inference_scheduler_name: inference_scheduler_name)
        describe_inference_scheduler(input)
      end

      def describe_inference_scheduler(input : Types::DescribeInferenceSchedulerRequest) : Types::DescribeInferenceSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInferenceSchedulerResponse, "DescribeInferenceScheduler")
      end

      # Returns the name of the label.

      def describe_label(
        label_group_name : String,
        label_id : String
      ) : Types::DescribeLabelResponse

        input = Types::DescribeLabelRequest.new(label_group_name: label_group_name, label_id: label_id)
        describe_label(input)
      end

      def describe_label(input : Types::DescribeLabelRequest) : Types::DescribeLabelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLabelResponse, "DescribeLabel")
      end

      # Returns information about the label group.

      def describe_label_group(
        label_group_name : String
      ) : Types::DescribeLabelGroupResponse

        input = Types::DescribeLabelGroupRequest.new(label_group_name: label_group_name)
        describe_label_group(input)
      end

      def describe_label_group(input : Types::DescribeLabelGroupRequest) : Types::DescribeLabelGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LABEL_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLabelGroupResponse, "DescribeLabelGroup")
      end

      # Provides a JSON containing the overall information about a specific machine learning model,
      # including model name and ARN, dataset, training and evaluation information, status, and so on.

      def describe_model(
        model_name : String
      ) : Types::DescribeModelResponse

        input = Types::DescribeModelRequest.new(model_name: model_name)
        describe_model(input)
      end

      def describe_model(input : Types::DescribeModelRequest) : Types::DescribeModelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelResponse, "DescribeModel")
      end

      # Retrieves information about a specific machine learning model version.

      def describe_model_version(
        model_name : String,
        model_version : Int64
      ) : Types::DescribeModelVersionResponse

        input = Types::DescribeModelVersionRequest.new(model_name: model_name, model_version: model_version)
        describe_model_version(input)
      end

      def describe_model_version(input : Types::DescribeModelVersionRequest) : Types::DescribeModelVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelVersionResponse, "DescribeModelVersion")
      end

      # Provides the details of a resource policy attached to a resource.

      def describe_resource_policy(
        resource_arn : String
      ) : Types::DescribeResourcePolicyResponse

        input = Types::DescribeResourcePolicyRequest.new(resource_arn: resource_arn)
        describe_resource_policy(input)
      end

      def describe_resource_policy(input : Types::DescribeResourcePolicyRequest) : Types::DescribeResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourcePolicyResponse, "DescribeResourcePolicy")
      end

      # Provides a description of the retraining scheduler, including information such as the model name and
      # retraining parameters.

      def describe_retraining_scheduler(
        model_name : String
      ) : Types::DescribeRetrainingSchedulerResponse

        input = Types::DescribeRetrainingSchedulerRequest.new(model_name: model_name)
        describe_retraining_scheduler(input)
      end

      def describe_retraining_scheduler(input : Types::DescribeRetrainingSchedulerRequest) : Types::DescribeRetrainingSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRetrainingSchedulerResponse, "DescribeRetrainingScheduler")
      end

      # Imports a dataset.

      def import_dataset(
        client_token : String,
        source_dataset_arn : String,
        dataset_name : String? = nil,
        server_side_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportDatasetResponse

        input = Types::ImportDatasetRequest.new(client_token: client_token, source_dataset_arn: source_dataset_arn, dataset_name: dataset_name, server_side_kms_key_id: server_side_kms_key_id, tags: tags)
        import_dataset(input)
      end

      def import_dataset(input : Types::ImportDatasetRequest) : Types::ImportDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportDatasetResponse, "ImportDataset")
      end

      # Imports a model that has been trained successfully.

      def import_model_version(
        client_token : String,
        dataset_name : String,
        source_model_version_arn : String,
        inference_data_import_strategy : String? = nil,
        labels_input_configuration : Types::LabelsInputConfiguration? = nil,
        model_name : String? = nil,
        role_arn : String? = nil,
        server_side_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportModelVersionResponse

        input = Types::ImportModelVersionRequest.new(client_token: client_token, dataset_name: dataset_name, source_model_version_arn: source_model_version_arn, inference_data_import_strategy: inference_data_import_strategy, labels_input_configuration: labels_input_configuration, model_name: model_name, role_arn: role_arn, server_side_kms_key_id: server_side_kms_key_id, tags: tags)
        import_model_version(input)
      end

      def import_model_version(input : Types::ImportModelVersionRequest) : Types::ImportModelVersionResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportModelVersionResponse, "ImportModelVersion")
      end

      # Provides a list of all data ingestion jobs, including dataset name and ARN, S3 location of the input
      # data, status, and so on.

      def list_data_ingestion_jobs(
        dataset_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListDataIngestionJobsResponse

        input = Types::ListDataIngestionJobsRequest.new(dataset_name: dataset_name, max_results: max_results, next_token: next_token, status: status)
        list_data_ingestion_jobs(input)
      end

      def list_data_ingestion_jobs(input : Types::ListDataIngestionJobsRequest) : Types::ListDataIngestionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_INGESTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataIngestionJobsResponse, "ListDataIngestionJobs")
      end

      # Lists all datasets currently available in your account, filtering on the dataset name.

      def list_datasets(
        dataset_name_begins_with : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetsResponse

        input = Types::ListDatasetsRequest.new(dataset_name_begins_with: dataset_name_begins_with, max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Types::ListDatasetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetsResponse, "ListDatasets")
      end

      # Lists all inference events that have been found for the specified inference scheduler.

      def list_inference_events(
        inference_scheduler_name : String,
        interval_end_time : Time,
        interval_start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInferenceEventsResponse

        input = Types::ListInferenceEventsRequest.new(inference_scheduler_name: inference_scheduler_name, interval_end_time: interval_end_time, interval_start_time: interval_start_time, max_results: max_results, next_token: next_token)
        list_inference_events(input)
      end

      def list_inference_events(input : Types::ListInferenceEventsRequest) : Types::ListInferenceEventsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceEventsResponse, "ListInferenceEvents")
      end

      # Lists all inference executions that have been performed by the specified inference scheduler.

      def list_inference_executions(
        inference_scheduler_name : String,
        data_end_time_before : Time? = nil,
        data_start_time_after : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListInferenceExecutionsResponse

        input = Types::ListInferenceExecutionsRequest.new(inference_scheduler_name: inference_scheduler_name, data_end_time_before: data_end_time_before, data_start_time_after: data_start_time_after, max_results: max_results, next_token: next_token, status: status)
        list_inference_executions(input)
      end

      def list_inference_executions(input : Types::ListInferenceExecutionsRequest) : Types::ListInferenceExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceExecutionsResponse, "ListInferenceExecutions")
      end

      # Retrieves a list of all inference schedulers currently available for your account.

      def list_inference_schedulers(
        inference_scheduler_name_begins_with : String? = nil,
        max_results : Int32? = nil,
        model_name : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListInferenceSchedulersResponse

        input = Types::ListInferenceSchedulersRequest.new(inference_scheduler_name_begins_with: inference_scheduler_name_begins_with, max_results: max_results, model_name: model_name, next_token: next_token, status: status)
        list_inference_schedulers(input)
      end

      def list_inference_schedulers(input : Types::ListInferenceSchedulersRequest) : Types::ListInferenceSchedulersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_SCHEDULERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceSchedulersResponse, "ListInferenceSchedulers")
      end

      # Returns a list of the label groups.

      def list_label_groups(
        label_group_name_begins_with : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLabelGroupsResponse

        input = Types::ListLabelGroupsRequest.new(label_group_name_begins_with: label_group_name_begins_with, max_results: max_results, next_token: next_token)
        list_label_groups(input)
      end

      def list_label_groups(input : Types::ListLabelGroupsRequest) : Types::ListLabelGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LABEL_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLabelGroupsResponse, "ListLabelGroups")
      end

      # Provides a list of labels.

      def list_labels(
        label_group_name : String,
        equipment : String? = nil,
        fault_code : String? = nil,
        interval_end_time : Time? = nil,
        interval_start_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLabelsResponse

        input = Types::ListLabelsRequest.new(label_group_name: label_group_name, equipment: equipment, fault_code: fault_code, interval_end_time: interval_end_time, interval_start_time: interval_start_time, max_results: max_results, next_token: next_token)
        list_labels(input)
      end

      def list_labels(input : Types::ListLabelsRequest) : Types::ListLabelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLabelsResponse, "ListLabels")
      end

      # Generates a list of all model versions for a given model, including the model version, model version
      # ARN, and status. To list a subset of versions, use the MaxModelVersion and MinModelVersion fields.

      def list_model_versions(
        model_name : String,
        created_at_end_time : Time? = nil,
        created_at_start_time : Time? = nil,
        max_model_version : Int64? = nil,
        max_results : Int32? = nil,
        min_model_version : Int64? = nil,
        next_token : String? = nil,
        source_type : String? = nil,
        status : String? = nil
      ) : Types::ListModelVersionsResponse

        input = Types::ListModelVersionsRequest.new(model_name: model_name, created_at_end_time: created_at_end_time, created_at_start_time: created_at_start_time, max_model_version: max_model_version, max_results: max_results, min_model_version: min_model_version, next_token: next_token, source_type: source_type, status: status)
        list_model_versions(input)
      end

      def list_model_versions(input : Types::ListModelVersionsRequest) : Types::ListModelVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelVersionsResponse, "ListModelVersions")
      end

      # Generates a list of all models in the account, including model name and ARN, dataset, and status.

      def list_models(
        dataset_name_begins_with : String? = nil,
        max_results : Int32? = nil,
        model_name_begins_with : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListModelsResponse

        input = Types::ListModelsRequest.new(dataset_name_begins_with: dataset_name_begins_with, max_results: max_results, model_name_begins_with: model_name_begins_with, next_token: next_token, status: status)
        list_models(input)
      end

      def list_models(input : Types::ListModelsRequest) : Types::ListModelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelsResponse, "ListModels")
      end

      # Lists all retraining schedulers in your account, filtering by model name prefix and status.

      def list_retraining_schedulers(
        max_results : Int32? = nil,
        model_name_begins_with : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListRetrainingSchedulersResponse

        input = Types::ListRetrainingSchedulersRequest.new(max_results: max_results, model_name_begins_with: model_name_begins_with, next_token: next_token, status: status)
        list_retraining_schedulers(input)
      end

      def list_retraining_schedulers(input : Types::ListRetrainingSchedulersRequest) : Types::ListRetrainingSchedulersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RETRAINING_SCHEDULERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRetrainingSchedulersResponse, "ListRetrainingSchedulers")
      end

      # Lists statistics about the data collected for each of the sensors that have been successfully
      # ingested in the particular dataset. Can also be used to retreive Sensor Statistics for a previous
      # ingestion job.

      def list_sensor_statistics(
        dataset_name : String,
        ingestion_job_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSensorStatisticsResponse

        input = Types::ListSensorStatisticsRequest.new(dataset_name: dataset_name, ingestion_job_id: ingestion_job_id, max_results: max_results, next_token: next_token)
        list_sensor_statistics(input)
      end

      def list_sensor_statistics(input : Types::ListSensorStatisticsRequest) : Types::ListSensorStatisticsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SENSOR_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSensorStatisticsResponse, "ListSensorStatistics")
      end

      # Lists all the tags for a specified resource, including key and value.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Creates a resource control policy for a given resource.

      def put_resource_policy(
        client_token : String,
        resource_arn : String,
        resource_policy : String,
        policy_revision_id : String? = nil
      ) : Types::PutResourcePolicyResponse

        input = Types::PutResourcePolicyRequest.new(client_token: client_token, resource_arn: resource_arn, resource_policy: resource_policy, policy_revision_id: policy_revision_id)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Starts a data ingestion job. Amazon Lookout for Equipment returns the job status.

      def start_data_ingestion_job(
        client_token : String,
        dataset_name : String,
        ingestion_input_configuration : Types::IngestionInputConfiguration,
        role_arn : String
      ) : Types::StartDataIngestionJobResponse

        input = Types::StartDataIngestionJobRequest.new(client_token: client_token, dataset_name: dataset_name, ingestion_input_configuration: ingestion_input_configuration, role_arn: role_arn)
        start_data_ingestion_job(input)
      end

      def start_data_ingestion_job(input : Types::StartDataIngestionJobRequest) : Types::StartDataIngestionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_INGESTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataIngestionJobResponse, "StartDataIngestionJob")
      end

      # Starts an inference scheduler.

      def start_inference_scheduler(
        inference_scheduler_name : String
      ) : Types::StartInferenceSchedulerResponse

        input = Types::StartInferenceSchedulerRequest.new(inference_scheduler_name: inference_scheduler_name)
        start_inference_scheduler(input)
      end

      def start_inference_scheduler(input : Types::StartInferenceSchedulerRequest) : Types::StartInferenceSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::START_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartInferenceSchedulerResponse, "StartInferenceScheduler")
      end

      # Starts a retraining scheduler.

      def start_retraining_scheduler(
        model_name : String
      ) : Types::StartRetrainingSchedulerResponse

        input = Types::StartRetrainingSchedulerRequest.new(model_name: model_name)
        start_retraining_scheduler(input)
      end

      def start_retraining_scheduler(input : Types::StartRetrainingSchedulerRequest) : Types::StartRetrainingSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::START_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRetrainingSchedulerResponse, "StartRetrainingScheduler")
      end

      # Stops an inference scheduler.

      def stop_inference_scheduler(
        inference_scheduler_name : String
      ) : Types::StopInferenceSchedulerResponse

        input = Types::StopInferenceSchedulerRequest.new(inference_scheduler_name: inference_scheduler_name)
        stop_inference_scheduler(input)
      end

      def stop_inference_scheduler(input : Types::StopInferenceSchedulerRequest) : Types::StopInferenceSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopInferenceSchedulerResponse, "StopInferenceScheduler")
      end

      # Stops a retraining scheduler.

      def stop_retraining_scheduler(
        model_name : String
      ) : Types::StopRetrainingSchedulerResponse

        input = Types::StopRetrainingSchedulerRequest.new(model_name: model_name)
        stop_retraining_scheduler(input)
      end

      def stop_retraining_scheduler(input : Types::StopRetrainingSchedulerRequest) : Types::StopRetrainingSchedulerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRetrainingSchedulerResponse, "StopRetrainingScheduler")
      end

      # Associates a given tag to a resource in your account. A tag is a key-value pair which can be added
      # to an Amazon Lookout for Equipment resource as metadata. Tags can be used for organizing your
      # resources as well as helping you to search and filter by tag. Multiple tags can be added to a
      # resource, either when you create it, or later. Up to 50 tags can be associated with each resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes a specific tag from a given resource. The tag is specified by its key.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Sets the active model version for a given machine learning model.

      def update_active_model_version(
        model_name : String,
        model_version : Int64
      ) : Types::UpdateActiveModelVersionResponse

        input = Types::UpdateActiveModelVersionRequest.new(model_name: model_name, model_version: model_version)
        update_active_model_version(input)
      end

      def update_active_model_version(input : Types::UpdateActiveModelVersionRequest) : Types::UpdateActiveModelVersionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACTIVE_MODEL_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateActiveModelVersionResponse, "UpdateActiveModelVersion")
      end

      # Updates an inference scheduler.

      def update_inference_scheduler(
        inference_scheduler_name : String,
        data_delay_offset_in_minutes : Int64? = nil,
        data_input_configuration : Types::InferenceInputConfiguration? = nil,
        data_output_configuration : Types::InferenceOutputConfiguration? = nil,
        data_upload_frequency : String? = nil,
        role_arn : String? = nil
      ) : Nil

        input = Types::UpdateInferenceSchedulerRequest.new(inference_scheduler_name: inference_scheduler_name, data_delay_offset_in_minutes: data_delay_offset_in_minutes, data_input_configuration: data_input_configuration, data_output_configuration: data_output_configuration, data_upload_frequency: data_upload_frequency, role_arn: role_arn)
        update_inference_scheduler(input)
      end

      def update_inference_scheduler(input : Types::UpdateInferenceSchedulerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INFERENCE_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the label group.

      def update_label_group(
        label_group_name : String,
        fault_codes : Array(String)? = nil
      ) : Nil

        input = Types::UpdateLabelGroupRequest.new(label_group_name: label_group_name, fault_codes: fault_codes)
        update_label_group(input)
      end

      def update_label_group(input : Types::UpdateLabelGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LABEL_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a model in the account.

      def update_model(
        model_name : String,
        labels_input_configuration : Types::LabelsInputConfiguration? = nil,
        model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
        role_arn : String? = nil
      ) : Nil

        input = Types::UpdateModelRequest.new(model_name: model_name, labels_input_configuration: labels_input_configuration, model_diagnostics_output_configuration: model_diagnostics_output_configuration, role_arn: role_arn)
        update_model(input)
      end

      def update_model(input : Types::UpdateModelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a retraining scheduler.

      def update_retraining_scheduler(
        model_name : String,
        lookback_window : String? = nil,
        promote_mode : String? = nil,
        retraining_frequency : String? = nil,
        retraining_start_date : Time? = nil
      ) : Nil

        input = Types::UpdateRetrainingSchedulerRequest.new(model_name: model_name, lookback_window: lookback_window, promote_mode: promote_mode, retraining_frequency: retraining_frequency, retraining_start_date: retraining_start_date)
        update_retraining_scheduler(input)
      end

      def update_retraining_scheduler(input : Types::UpdateRetrainingSchedulerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RETRAINING_SCHEDULER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
