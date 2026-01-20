module AwsSdk
  module CognitoSync
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

      # Initiates a bulk publish of all existing datasets for an Identity Pool to the configured stream.
      # Customers are limited to one successful bulk publish per 24 hours. Bulk publish is an asynchronous
      # request, customers can see the status of the request via the GetBulkPublishDetails operation. This
      # API can only be called with developer credentials. You cannot call this API with the temporary user
      # credentials provided by Cognito Identity.

      def bulk_publish(
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::BulkPublishRequest.new(identity_pool_id: identity_pool_id)
        bulk_publish(input)
      end

      def bulk_publish(input : Types::BulkPublishRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BULK_PUBLISH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specific dataset. The dataset will be deleted permanently, and the action can't be
      # undone. Datasets that this dataset was merged with will no longer report the merge. Any subsequent
      # operation on this dataset will result in a ResourceNotFoundException. This API can be called with
      # temporary user credentials provided by Cognito Identity or with developer credentials.

      def delete_dataset(
        dataset_name : String,
        identity_id : String,
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::DeleteDatasetRequest.new(dataset_name: dataset_name, identity_id: identity_id, identity_pool_id: identity_pool_id)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets meta data about a dataset by identity and dataset name. With Amazon Cognito Sync, each identity
      # has access only to its own data. Thus, the credentials used to make this API call need to have
      # access to the identity data. This API can be called with temporary user credentials provided by
      # Cognito Identity or with developer credentials. You should use Cognito Identity credentials to make
      # this API call.

      def describe_dataset(
        dataset_name : String,
        identity_id : String,
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::DescribeDatasetRequest.new(dataset_name: dataset_name, identity_id: identity_id, identity_pool_id: identity_pool_id)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets usage details (for example, data storage) about a particular identity pool. This API can only
      # be called with developer credentials. You cannot call this API with the temporary user credentials
      # provided by Cognito Identity.

      def describe_identity_pool_usage(
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::DescribeIdentityPoolUsageRequest.new(identity_pool_id: identity_pool_id)
        describe_identity_pool_usage(input)
      end

      def describe_identity_pool_usage(input : Types::DescribeIdentityPoolUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IDENTITY_POOL_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets usage information for an identity, including number of datasets and data usage. This API can be
      # called with temporary user credentials provided by Cognito Identity or with developer credentials.

      def describe_identity_usage(
        identity_id : String,
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::DescribeIdentityUsageRequest.new(identity_id: identity_id, identity_pool_id: identity_pool_id)
        describe_identity_usage(input)
      end

      def describe_identity_usage(input : Types::DescribeIdentityUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IDENTITY_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the status of the last BulkPublish operation for an identity pool. This API can only be called
      # with developer credentials. You cannot call this API with the temporary user credentials provided by
      # Cognito Identity.

      def get_bulk_publish_details(
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::GetBulkPublishDetailsRequest.new(identity_pool_id: identity_pool_id)
        get_bulk_publish_details(input)
      end

      def get_bulk_publish_details(input : Types::GetBulkPublishDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BULK_PUBLISH_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the events and the corresponding Lambda functions associated with an identity pool. This API
      # can only be called with developer credentials. You cannot call this API with the temporary user
      # credentials provided by Cognito Identity.

      def get_cognito_events(
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::GetCognitoEventsRequest.new(identity_pool_id: identity_pool_id)
        get_cognito_events(input)
      end

      def get_cognito_events(input : Types::GetCognitoEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COGNITO_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the configuration settings of an identity pool. This API can only be called with developer
      # credentials. You cannot call this API with the temporary user credentials provided by Cognito
      # Identity.

      def get_identity_pool_configuration(
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::GetIdentityPoolConfigurationRequest.new(identity_pool_id: identity_pool_id)
        get_identity_pool_configuration(input)
      end

      def get_identity_pool_configuration(input : Types::GetIdentityPoolConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IDENTITY_POOL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists datasets for an identity. With Amazon Cognito Sync, each identity has access only to its own
      # data. Thus, the credentials used to make this API call need to have access to the identity data.
      # ListDatasets can be called with temporary user credentials provided by Cognito Identity or with
      # developer credentials. You should use the Cognito Identity credentials to make this API call.

      def list_datasets(
        identity_id : String,
        identity_pool_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatasetsRequest.new(identity_id: identity_id, identity_pool_id: identity_pool_id, max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of identity pools registered with Cognito. ListIdentityPoolUsage can only be called with
      # developer credentials. You cannot make this API call with the temporary user credentials provided by
      # Cognito Identity.

      def list_identity_pool_usage(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityPoolUsageRequest.new(max_results: max_results, next_token: next_token)
        list_identity_pool_usage(input)
      end

      def list_identity_pool_usage(input : Types::ListIdentityPoolUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_POOL_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets paginated records, optionally changed after a particular sync count for a dataset and identity.
      # With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used
      # to make this API call need to have access to the identity data. ListRecords can be called with
      # temporary user credentials provided by Cognito Identity or with developer credentials. You should
      # use Cognito Identity credentials to make this API call.

      def list_records(
        dataset_name : String,
        identity_id : String,
        identity_pool_id : String,
        last_sync_count : Int64? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sync_session_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecordsRequest.new(dataset_name: dataset_name, identity_id: identity_id, identity_pool_id: identity_pool_id, last_sync_count: last_sync_count, max_results: max_results, next_token: next_token, sync_session_token: sync_session_token)
        list_records(input)
      end

      def list_records(input : Types::ListRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a device to receive push sync notifications. This API can only be called with temporary
      # credentials provided by Cognito Identity. You cannot call this API with developer credentials.

      def register_device(
        identity_id : String,
        identity_pool_id : String,
        platform : String,
        token : String
      ) : Protocol::Request
        input = Types::RegisterDeviceRequest.new(identity_id: identity_id, identity_pool_id: identity_pool_id, platform: platform, token: token)
        register_device(input)
      end

      def register_device(input : Types::RegisterDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the AWS Lambda function for a given event type for an identity pool. This request only updates
      # the key/value pair specified. Other key/values pairs are not updated. To remove a key value pair,
      # pass a empty value for the particular key. This API can only be called with developer credentials.
      # You cannot call this API with the temporary user credentials provided by Cognito Identity.

      def set_cognito_events(
        events : Hash(String, String),
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::SetCognitoEventsRequest.new(events: events, identity_pool_id: identity_pool_id)
        set_cognito_events(input)
      end

      def set_cognito_events(input : Types::SetCognitoEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_COGNITO_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the necessary configuration for push sync. This API can only be called with developer
      # credentials. You cannot call this API with the temporary user credentials provided by Cognito
      # Identity.

      def set_identity_pool_configuration(
        identity_pool_id : String,
        cognito_streams : Types::CognitoStreams? = nil,
        push_sync : Types::PushSync? = nil
      ) : Protocol::Request
        input = Types::SetIdentityPoolConfigurationRequest.new(identity_pool_id: identity_pool_id, cognito_streams: cognito_streams, push_sync: push_sync)
        set_identity_pool_configuration(input)
      end

      def set_identity_pool_configuration(input : Types::SetIdentityPoolConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_IDENTITY_POOL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Subscribes to receive notifications when a dataset is modified by another device. This API can only
      # be called with temporary credentials provided by Cognito Identity. You cannot call this API with
      # developer credentials.

      def subscribe_to_dataset(
        dataset_name : String,
        device_id : String,
        identity_id : String,
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::SubscribeToDatasetRequest.new(dataset_name: dataset_name, device_id: device_id, identity_id: identity_id, identity_pool_id: identity_pool_id)
        subscribe_to_dataset(input)
      end

      def subscribe_to_dataset(input : Types::SubscribeToDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBSCRIBE_TO_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unsubscribes from receiving notifications when a dataset is modified by another device. This API can
      # only be called with temporary credentials provided by Cognito Identity. You cannot call this API
      # with developer credentials.

      def unsubscribe_from_dataset(
        dataset_name : String,
        device_id : String,
        identity_id : String,
        identity_pool_id : String
      ) : Protocol::Request
        input = Types::UnsubscribeFromDatasetRequest.new(dataset_name: dataset_name, device_id: device_id, identity_id: identity_id, identity_pool_id: identity_pool_id)
        unsubscribe_from_dataset(input)
      end

      def unsubscribe_from_dataset(input : Types::UnsubscribeFromDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNSUBSCRIBE_FROM_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Posts updates to records and adds and deletes records for a dataset and user. The sync count in the
      # record patch is your last known sync count for that record. The server will reject an UpdateRecords
      # request with a ResourceConflictException if you try to patch a record with a new value but a stale
      # sync count. For example, if the sync count on the server is 5 for a key called highScore and you try
      # and submit a new highScore with sync count of 4, the request will be rejected. To obtain the current
      # sync count for a record, call ListRecords. On a successful update of the record, the response
      # returns the new sync count for that record. You should present that sync count the next time you try
      # to update that same record. When the record does not exist, specify the sync count as 0. This API
      # can be called with temporary user credentials provided by Cognito Identity or with developer
      # credentials.

      def update_records(
        dataset_name : String,
        identity_id : String,
        identity_pool_id : String,
        sync_session_token : String,
        client_context : String? = nil,
        device_id : String? = nil,
        record_patches : Array(Types::RecordPatch)? = nil
      ) : Protocol::Request
        input = Types::UpdateRecordsRequest.new(dataset_name: dataset_name, identity_id: identity_id, identity_pool_id: identity_pool_id, sync_session_token: sync_session_token, client_context: client_context, device_id: device_id, record_patches: record_patches)
        update_records(input)
      end

      def update_records(input : Types::UpdateRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
