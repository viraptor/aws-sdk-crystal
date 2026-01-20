module AwsSdk
  module AppFabric
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

      # Gets user access details in a batch request. This action polls data from the tasks that are kicked
      # off by the StartUserAccessTasks action.

      def batch_get_user_access_tasks(
        app_bundle_identifier : String,
        task_id_list : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetUserAccessTasksRequest.new(app_bundle_identifier: app_bundle_identifier, task_id_list: task_id_list)
        batch_get_user_access_tasks(input)
      end

      def batch_get_user_access_tasks(input : Types::BatchGetUserAccessTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_USER_ACCESS_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Establishes a connection between Amazon Web Services AppFabric and an application, which allows
      # AppFabric to call the APIs of the application.

      def connect_app_authorization(
        app_authorization_identifier : String,
        app_bundle_identifier : String,
        auth_request : Types::AuthRequest? = nil
      ) : Protocol::Request
        input = Types::ConnectAppAuthorizationRequest.new(app_authorization_identifier: app_authorization_identifier, app_bundle_identifier: app_bundle_identifier, auth_request: auth_request)
        connect_app_authorization(input)
      end

      def connect_app_authorization(input : Types::ConnectAppAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONNECT_APP_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an app authorization within an app bundle, which allows AppFabric to connect to an
      # application.

      def create_app_authorization(
        app : String,
        app_bundle_identifier : String,
        auth_type : String,
        credential : Types::Credential,
        tenant : Types::Tenant,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAppAuthorizationRequest.new(app: app, app_bundle_identifier: app_bundle_identifier, auth_type: auth_type, credential: credential, tenant: tenant, client_token: client_token, tags: tags)
        create_app_authorization(input)
      end

      def create_app_authorization(input : Types::CreateAppAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an app bundle to collect data from an application using AppFabric.

      def create_app_bundle(
        client_token : String? = nil,
        customer_managed_key_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAppBundleRequest.new(client_token: client_token, customer_managed_key_identifier: customer_managed_key_identifier, tags: tags)
        create_app_bundle(input)
      end

      def create_app_bundle(input : Types::CreateAppBundleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_BUNDLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data ingestion for an application.

      def create_ingestion(
        app : String,
        app_bundle_identifier : String,
        ingestion_type : String,
        tenant_id : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateIngestionRequest.new(app: app, app_bundle_identifier: app_bundle_identifier, ingestion_type: ingestion_type, tenant_id: tenant_id, client_token: client_token, tags: tags)
        create_ingestion(input)
      end

      def create_ingestion(input : Types::CreateIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an ingestion destination, which specifies how an application's ingested data is processed by
      # Amazon Web Services AppFabric and where it's delivered.

      def create_ingestion_destination(
        app_bundle_identifier : String,
        destination_configuration : Types::DestinationConfiguration,
        ingestion_identifier : String,
        processing_configuration : Types::ProcessingConfiguration,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateIngestionDestinationRequest.new(app_bundle_identifier: app_bundle_identifier, destination_configuration: destination_configuration, ingestion_identifier: ingestion_identifier, processing_configuration: processing_configuration, client_token: client_token, tags: tags)
        create_ingestion_destination(input)
      end

      def create_ingestion_destination(input : Types::CreateIngestionDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INGESTION_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an app authorization. You must delete the associated ingestion before you can delete an app
      # authorization.

      def delete_app_authorization(
        app_authorization_identifier : String,
        app_bundle_identifier : String
      ) : Protocol::Request
        input = Types::DeleteAppAuthorizationRequest.new(app_authorization_identifier: app_authorization_identifier, app_bundle_identifier: app_bundle_identifier)
        delete_app_authorization(input)
      end

      def delete_app_authorization(input : Types::DeleteAppAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an app bundle. You must delete all associated app authorizations before you can delete an
      # app bundle.

      def delete_app_bundle(
        app_bundle_identifier : String
      ) : Protocol::Request
        input = Types::DeleteAppBundleRequest.new(app_bundle_identifier: app_bundle_identifier)
        delete_app_bundle(input)
      end

      def delete_app_bundle(input : Types::DeleteAppBundleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_BUNDLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ingestion. You must stop (disable) the ingestion and you must delete all associated
      # ingestion destinations before you can delete an app ingestion.

      def delete_ingestion(
        app_bundle_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::DeleteIngestionRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_identifier: ingestion_identifier)
        delete_ingestion(input)
      end

      def delete_ingestion(input : Types::DeleteIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ingestion destination. This deletes the association between an ingestion and it's
      # destination. It doesn't delete previously ingested data or the storage destination, such as the
      # Amazon S3 bucket where the data is delivered. If the ingestion destination is deleted while the
      # associated ingestion is enabled, the ingestion will fail and is eventually disabled.

      def delete_ingestion_destination(
        app_bundle_identifier : String,
        ingestion_destination_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::DeleteIngestionDestinationRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_destination_identifier: ingestion_destination_identifier, ingestion_identifier: ingestion_identifier)
        delete_ingestion_destination(input)
      end

      def delete_ingestion_destination(input : Types::DeleteIngestionDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INGESTION_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an app authorization.

      def get_app_authorization(
        app_authorization_identifier : String,
        app_bundle_identifier : String
      ) : Protocol::Request
        input = Types::GetAppAuthorizationRequest.new(app_authorization_identifier: app_authorization_identifier, app_bundle_identifier: app_bundle_identifier)
        get_app_authorization(input)
      end

      def get_app_authorization(input : Types::GetAppAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an app bundle.

      def get_app_bundle(
        app_bundle_identifier : String
      ) : Protocol::Request
        input = Types::GetAppBundleRequest.new(app_bundle_identifier: app_bundle_identifier)
        get_app_bundle(input)
      end

      def get_app_bundle(input : Types::GetAppBundleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP_BUNDLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an ingestion.

      def get_ingestion(
        app_bundle_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::GetIngestionRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_identifier: ingestion_identifier)
        get_ingestion(input)
      end

      def get_ingestion(input : Types::GetIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an ingestion destination.

      def get_ingestion_destination(
        app_bundle_identifier : String,
        ingestion_destination_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::GetIngestionDestinationRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_destination_identifier: ingestion_destination_identifier, ingestion_identifier: ingestion_identifier)
        get_ingestion_destination(input)
      end

      def get_ingestion_destination(input : Types::GetIngestionDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INGESTION_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all app authorizations configured for an app bundle.

      def list_app_authorizations(
        app_bundle_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppAuthorizationsRequest.new(app_bundle_identifier: app_bundle_identifier, max_results: max_results, next_token: next_token)
        list_app_authorizations(input)
      end

      def list_app_authorizations(input : Types::ListAppAuthorizationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_AUTHORIZATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of app bundles.

      def list_app_bundles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppBundlesRequest.new(max_results: max_results, next_token: next_token)
        list_app_bundles(input)
      end

      def list_app_bundles(input : Types::ListAppBundlesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_BUNDLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all ingestion destinations configured for an ingestion.

      def list_ingestion_destinations(
        app_bundle_identifier : String,
        ingestion_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIngestionDestinationsRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_identifier: ingestion_identifier, max_results: max_results, next_token: next_token)
        list_ingestion_destinations(input)
      end

      def list_ingestion_destinations(input : Types::ListIngestionDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INGESTION_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all ingestions configured for an app bundle.

      def list_ingestions(
        app_bundle_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIngestionsRequest.new(app_bundle_identifier: app_bundle_identifier, max_results: max_results, next_token: next_token)
        list_ingestions(input)
      end

      def list_ingestions(input : Types::ListIngestionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INGESTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a resource.

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

      # Starts (enables) an ingestion, which collects data from an application.

      def start_ingestion(
        app_bundle_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::StartIngestionRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_identifier: ingestion_identifier)
        start_ingestion(input)
      end

      def start_ingestion(input : Types::StartIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the tasks to search user access status for a specific email address. The tasks are stopped
      # when the user access status data is found. The tasks are terminated when the API calls to the
      # application time out.

      def start_user_access_tasks(
        app_bundle_identifier : String,
        email : String
      ) : Protocol::Request
        input = Types::StartUserAccessTasksRequest.new(app_bundle_identifier: app_bundle_identifier, email: email)
        start_user_access_tasks(input)
      end

      def start_user_access_tasks(input : Types::StartUserAccessTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_USER_ACCESS_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops (disables) an ingestion.

      def stop_ingestion(
        app_bundle_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::StopIngestionRequest.new(app_bundle_identifier: app_bundle_identifier, ingestion_identifier: ingestion_identifier)
        stop_ingestion(input)
      end

      def stop_ingestion(input : Types::StopIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified resource.

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

      # Removes a tag or tags from a resource.

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

      # Updates an app authorization within an app bundle, which allows AppFabric to connect to an
      # application. If the app authorization was in a connected state, updating the app authorization will
      # set it back to a PendingConnect state.

      def update_app_authorization(
        app_authorization_identifier : String,
        app_bundle_identifier : String,
        credential : Types::Credential? = nil,
        tenant : Types::Tenant? = nil
      ) : Protocol::Request
        input = Types::UpdateAppAuthorizationRequest.new(app_authorization_identifier: app_authorization_identifier, app_bundle_identifier: app_bundle_identifier, credential: credential, tenant: tenant)
        update_app_authorization(input)
      end

      def update_app_authorization(input : Types::UpdateAppAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an ingestion destination, which specifies how an application's ingested data is processed by
      # Amazon Web Services AppFabric and where it's delivered.

      def update_ingestion_destination(
        app_bundle_identifier : String,
        destination_configuration : Types::DestinationConfiguration,
        ingestion_destination_identifier : String,
        ingestion_identifier : String
      ) : Protocol::Request
        input = Types::UpdateIngestionDestinationRequest.new(app_bundle_identifier: app_bundle_identifier, destination_configuration: destination_configuration, ingestion_destination_identifier: ingestion_destination_identifier, ingestion_identifier: ingestion_identifier)
        update_ingestion_destination(input)
      end

      def update_ingestion_destination(input : Types::UpdateIngestionDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INGESTION_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
