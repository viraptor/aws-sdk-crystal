module AwsSdk
  module IoTAnalytics
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

      # Sends messages to a channel.

      def batch_put_message(
        channel_name : String,
        messages : Array(Types::Message)
      ) : Protocol::Request
        input = Types::BatchPutMessageRequest.new(channel_name: channel_name, messages: messages)
        batch_put_message(input)
      end

      def batch_put_message(input : Types::BatchPutMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the reprocessing of data through the pipeline.

      def cancel_pipeline_reprocessing(
        pipeline_name : String,
        reprocessing_id : String
      ) : Protocol::Request
        input = Types::CancelPipelineReprocessingRequest.new(pipeline_name: pipeline_name, reprocessing_id: reprocessing_id)
        cancel_pipeline_reprocessing(input)
      end

      def cancel_pipeline_reprocessing(input : Types::CancelPipelineReprocessingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_PIPELINE_REPROCESSING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to create a channel. A channel collects data from an MQTT topic and archives the raw,
      # unprocessed messages before publishing the data to a pipeline.

      def create_channel(
        channel_name : String,
        channel_storage : Types::ChannelStorage? = nil,
        retention_period : Types::RetentionPeriod? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(channel_name: channel_name, channel_storage: channel_storage, retention_period: retention_period, tags: tags)
        create_channel(input)
      end

      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to create a dataset. A dataset stores data retrieved from a data store by applying a
      # queryAction (a SQL query) or a containerAction (executing a containerized application). This
      # operation creates the skeleton of a dataset. The dataset can be populated manually by calling
      # CreateDatasetContent or automatically according to a trigger you specify.

      def create_dataset(
        actions : Array(Types::DatasetAction),
        dataset_name : String,
        content_delivery_rules : Array(Types::DatasetContentDeliveryRule)? = nil,
        late_data_rules : Array(Types::LateDataRule)? = nil,
        retention_period : Types::RetentionPeriod? = nil,
        tags : Array(Types::Tag)? = nil,
        triggers : Array(Types::DatasetTrigger)? = nil,
        versioning_configuration : Types::VersioningConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateDatasetRequest.new(actions: actions, dataset_name: dataset_name, content_delivery_rules: content_delivery_rules, late_data_rules: late_data_rules, retention_period: retention_period, tags: tags, triggers: triggers, versioning_configuration: versioning_configuration)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the content of a dataset by applying a queryAction (a SQL query) or a containerAction
      # (executing a containerized application).

      def create_dataset_content(
        dataset_name : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateDatasetContentRequest.new(dataset_name: dataset_name, version_id: version_id)
        create_dataset_content(input)
      end

      def create_dataset_content(input : Types::CreateDatasetContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASET_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data store, which is a repository for messages.

      def create_datastore(
        datastore_name : String,
        datastore_partitions : Types::DatastorePartitions? = nil,
        datastore_storage : Types::DatastoreStorage? = nil,
        file_format_configuration : Types::FileFormatConfiguration? = nil,
        retention_period : Types::RetentionPeriod? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDatastoreRequest.new(datastore_name: datastore_name, datastore_partitions: datastore_partitions, datastore_storage: datastore_storage, file_format_configuration: file_format_configuration, retention_period: retention_period, tags: tags)
        create_datastore(input)
      end

      def create_datastore(input : Types::CreateDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a pipeline. A pipeline consumes messages from a channel and allows you to process the
      # messages before storing them in a data store. You must specify both a channel and a datastore
      # activity and, optionally, as many as 23 additional activities in the pipelineActivities array.

      def create_pipeline(
        pipeline_activities : Array(Types::PipelineActivity),
        pipeline_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePipelineRequest.new(pipeline_activities: pipeline_activities, pipeline_name: pipeline_name, tags: tags)
        create_pipeline(input)
      end

      def create_pipeline(input : Types::CreatePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified channel.

      def delete_channel(
        channel_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(channel_name: channel_name)
        delete_channel(input)
      end

      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified dataset. You do not have to delete the content of the dataset before you
      # perform this operation.

      def delete_dataset(
        dataset_name : String
      ) : Protocol::Request
        input = Types::DeleteDatasetRequest.new(dataset_name: dataset_name)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the content of the specified dataset.

      def delete_dataset_content(
        dataset_name : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDatasetContentRequest.new(dataset_name: dataset_name, version_id: version_id)
        delete_dataset_content(input)
      end

      def delete_dataset_content(input : Types::DeleteDatasetContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified data store.

      def delete_datastore(
        datastore_name : String
      ) : Protocol::Request
        input = Types::DeleteDatastoreRequest.new(datastore_name: datastore_name)
        delete_datastore(input)
      end

      def delete_datastore(input : Types::DeleteDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified pipeline.

      def delete_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::DeletePipelineRequest.new(pipeline_name: pipeline_name)
        delete_pipeline(input)
      end

      def delete_pipeline(input : Types::DeletePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a channel.

      def describe_channel(
        channel_name : String,
        include_statistics : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeChannelRequest.new(channel_name: channel_name, include_statistics: include_statistics)
        describe_channel(input)
      end

      def describe_channel(input : Types::DescribeChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a dataset.

      def describe_dataset(
        dataset_name : String
      ) : Protocol::Request
        input = Types::DescribeDatasetRequest.new(dataset_name: dataset_name)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a data store.

      def describe_datastore(
        datastore_name : String,
        include_statistics : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeDatastoreRequest.new(datastore_name: datastore_name, include_statistics: include_statistics)
        describe_datastore(input)
      end

      def describe_datastore(input : Types::DescribeDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current settings of the IoT Analytics logging options.

      def describe_logging_options : Protocol::Request
        input = Types::DescribeLoggingOptionsRequest.new
        describe_logging_options(input)
      end

      def describe_logging_options(input : Types::DescribeLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a pipeline.

      def describe_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::DescribePipelineRequest.new(pipeline_name: pipeline_name)
        describe_pipeline(input)
      end

      def describe_pipeline(input : Types::DescribePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the contents of a dataset as presigned URIs.

      def get_dataset_content(
        dataset_name : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::GetDatasetContentRequest.new(dataset_name: dataset_name, version_id: version_id)
        get_dataset_content(input)
      end

      def get_dataset_content(input : Types::GetDatasetContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATASET_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of channels.

      def list_channels(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(max_results: max_results, next_token: next_token)
        list_channels(input)
      end

      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about dataset contents that have been created.

      def list_dataset_contents(
        dataset_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scheduled_before : Time? = nil,
        scheduled_on_or_after : Time? = nil
      ) : Protocol::Request
        input = Types::ListDatasetContentsRequest.new(dataset_name: dataset_name, max_results: max_results, next_token: next_token, scheduled_before: scheduled_before, scheduled_on_or_after: scheduled_on_or_after)
        list_dataset_contents(input)
      end

      def list_dataset_contents(input : Types::ListDatasetContentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASET_CONTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about datasets.

      def list_datasets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatasetsRequest.new(max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of data stores.

      def list_datastores(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatastoresRequest.new(max_results: max_results, next_token: next_token)
        list_datastores(input)
      end

      def list_datastores(input : Types::ListDatastoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASTORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of pipelines.

      def list_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPipelinesRequest.new(max_results: max_results, next_token: next_token)
        list_pipelines(input)
      end

      def list_pipelines(input : Types::ListPipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags (metadata) that you have assigned to the resource.

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

      # Sets or updates the IoT Analytics logging options. If you update the value of any loggingOptions
      # field, it takes up to one minute for the change to take effect. Also, if you change the policy
      # attached to the role you specified in the roleArn field (for example, to correct an invalid policy),
      # it takes up to five minutes for that change to take effect.

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

      # Simulates the results of running a pipeline activity on a message payload.

      def run_pipeline_activity(
        payloads : Array(Bytes),
        pipeline_activity : Types::PipelineActivity
      ) : Protocol::Request
        input = Types::RunPipelineActivityRequest.new(payloads: payloads, pipeline_activity: pipeline_activity)
        run_pipeline_activity(input)
      end

      def run_pipeline_activity(input : Types::RunPipelineActivityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RUN_PIPELINE_ACTIVITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a sample of messages from the specified channel ingested during the specified timeframe.
      # Up to 10 messages can be retrieved.

      def sample_channel_data(
        channel_name : String,
        end_time : Time? = nil,
        max_messages : Int32? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::SampleChannelDataRequest.new(channel_name: channel_name, end_time: end_time, max_messages: max_messages, start_time: start_time)
        sample_channel_data(input)
      end

      def sample_channel_data(input : Types::SampleChannelDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SAMPLE_CHANNEL_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the reprocessing of raw message data through the pipeline.

      def start_pipeline_reprocessing(
        pipeline_name : String,
        channel_messages : Types::ChannelMessages? = nil,
        end_time : Time? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::StartPipelineReprocessingRequest.new(pipeline_name: pipeline_name, channel_messages: channel_messages, end_time: end_time, start_time: start_time)
        start_pipeline_reprocessing(input)
      end

      def start_pipeline_reprocessing(input : Types::StartPipelineReprocessingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PIPELINE_REPROCESSING, input, endpoint)
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

      # Used to update the settings of a channel.

      def update_channel(
        channel_name : String,
        channel_storage : Types::ChannelStorage? = nil,
        retention_period : Types::RetentionPeriod? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(channel_name: channel_name, channel_storage: channel_storage, retention_period: retention_period)
        update_channel(input)
      end

      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings of a dataset.

      def update_dataset(
        actions : Array(Types::DatasetAction),
        dataset_name : String,
        content_delivery_rules : Array(Types::DatasetContentDeliveryRule)? = nil,
        late_data_rules : Array(Types::LateDataRule)? = nil,
        retention_period : Types::RetentionPeriod? = nil,
        triggers : Array(Types::DatasetTrigger)? = nil,
        versioning_configuration : Types::VersioningConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDatasetRequest.new(actions: actions, dataset_name: dataset_name, content_delivery_rules: content_delivery_rules, late_data_rules: late_data_rules, retention_period: retention_period, triggers: triggers, versioning_configuration: versioning_configuration)
        update_dataset(input)
      end

      def update_dataset(input : Types::UpdateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to update the settings of a data store.

      def update_datastore(
        datastore_name : String,
        datastore_storage : Types::DatastoreStorage? = nil,
        file_format_configuration : Types::FileFormatConfiguration? = nil,
        retention_period : Types::RetentionPeriod? = nil
      ) : Protocol::Request
        input = Types::UpdateDatastoreRequest.new(datastore_name: datastore_name, datastore_storage: datastore_storage, file_format_configuration: file_format_configuration, retention_period: retention_period)
        update_datastore(input)
      end

      def update_datastore(input : Types::UpdateDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings of a pipeline. You must specify both a channel and a datastore activity and,
      # optionally, as many as 23 additional activities in the pipelineActivities array.

      def update_pipeline(
        pipeline_activities : Array(Types::PipelineActivity),
        pipeline_name : String
      ) : Protocol::Request
        input = Types::UpdatePipelineRequest.new(pipeline_activities: pipeline_activities, pipeline_name: pipeline_name)
        update_pipeline(input)
      end

      def update_pipeline(input : Types::UpdatePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
