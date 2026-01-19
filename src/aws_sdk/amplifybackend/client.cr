module AwsSdk
  module AmplifyBackend
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

      # This operation clones an existing backend.
      def clone_backend(
        app_id : String,
        backend_environment_name : String,
        target_environment_name : String
      ) : Protocol::Request
        input = Types::CloneBackendRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, target_environment_name: target_environment_name)
        clone_backend(input)
      end
      def clone_backend(input : Types::CloneBackendRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CLONE_BACKEND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a backend for an Amplify app. Backends are automatically created at the time
      # of app creation.
      def create_backend(
        app_id : String,
        app_name : String,
        backend_environment_name : String,
        resource_config : Types::ResourceConfig? = nil,
        resource_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackendRequest.new(app_id: app_id, app_name: app_name, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        create_backend(input)
      end
      def create_backend(input : Types::CreateBackendRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new backend API resource.
      def create_backend_api(
        app_id : String,
        backend_environment_name : String,
        resource_config : Types::BackendAPIResourceConfig,
        resource_name : String
      ) : Protocol::Request
        input = Types::CreateBackendAPIRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        create_backend_api(input)
      end
      def create_backend_api(input : Types::CreateBackendAPIRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new backend authentication resource.
      def create_backend_auth(
        app_id : String,
        backend_environment_name : String,
        resource_config : Types::CreateBackendAuthResourceConfig,
        resource_name : String
      ) : Protocol::Request
        input = Types::CreateBackendAuthRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        create_backend_auth(input)
      end
      def create_backend_auth(input : Types::CreateBackendAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a config object for a backend.
      def create_backend_config(
        app_id : String,
        backend_manager_app_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackendConfigRequest.new(app_id: app_id, backend_manager_app_id: backend_manager_app_id)
        create_backend_config(input)
      end
      def create_backend_config(input : Types::CreateBackendConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a backend storage resource.
      def create_backend_storage(
        app_id : String,
        backend_environment_name : String,
        resource_config : Types::CreateBackendStorageResourceConfig,
        resource_name : String
      ) : Protocol::Request
        input = Types::CreateBackendStorageRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        create_backend_storage(input)
      end
      def create_backend_storage(input : Types::CreateBackendStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a one-time challenge code to authenticate a user into your Amplify Admin UI.
      def create_token(
        app_id : String
      ) : Protocol::Request
        input = Types::CreateTokenRequest.new(app_id: app_id)
        create_token(input)
      end
      def create_token(input : Types::CreateTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an existing environment from your Amplify project.
      def delete_backend(
        app_id : String,
        backend_environment_name : String
      ) : Protocol::Request
        input = Types::DeleteBackendRequest.new(app_id: app_id, backend_environment_name: backend_environment_name)
        delete_backend(input)
      end
      def delete_backend(input : Types::DeleteBackendRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKEND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing backend API resource.
      def delete_backend_api(
        app_id : String,
        backend_environment_name : String,
        resource_name : String,
        resource_config : Types::BackendAPIResourceConfig? = nil
      ) : Protocol::Request
        input = Types::DeleteBackendAPIRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name, resource_config: resource_config)
        delete_backend_api(input)
      end
      def delete_backend_api(input : Types::DeleteBackendAPIRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKEND_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing backend authentication resource.
      def delete_backend_auth(
        app_id : String,
        backend_environment_name : String,
        resource_name : String
      ) : Protocol::Request
        input = Types::DeleteBackendAuthRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name)
        delete_backend_auth(input)
      end
      def delete_backend_auth(input : Types::DeleteBackendAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKEND_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified backend storage resource.
      def delete_backend_storage(
        app_id : String,
        backend_environment_name : String,
        resource_name : String,
        service_name : String
      ) : Protocol::Request
        input = Types::DeleteBackendStorageRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name, service_name: service_name)
        delete_backend_storage(input)
      end
      def delete_backend_storage(input : Types::DeleteBackendStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKEND_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the challenge token based on the given appId and sessionId.
      def delete_token(
        app_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::DeleteTokenRequest.new(app_id: app_id, session_id: session_id)
        delete_token(input)
      end
      def delete_token(input : Types::DeleteTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a model schema for an existing backend API resource.
      def generate_backend_api_models(
        app_id : String,
        backend_environment_name : String,
        resource_name : String
      ) : Protocol::Request
        input = Types::GenerateBackendAPIModelsRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name)
        generate_backend_api_models(input)
      end
      def generate_backend_api_models(input : Types::GenerateBackendAPIModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_BACKEND_API_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides project-level details for your Amplify UI project.
      def get_backend(
        app_id : String,
        backend_environment_name : String? = nil
      ) : Protocol::Request
        input = Types::GetBackendRequest.new(app_id: app_id, backend_environment_name: backend_environment_name)
        get_backend(input)
      end
      def get_backend(input : Types::GetBackendRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details for a backend API.
      def get_backend_api(
        app_id : String,
        backend_environment_name : String,
        resource_name : String,
        resource_config : Types::BackendAPIResourceConfig? = nil
      ) : Protocol::Request
        input = Types::GetBackendAPIRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name, resource_config: resource_config)
        get_backend_api(input)
      end
      def get_backend_api(input : Types::GetBackendAPIRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a model introspection schema for an existing backend API resource.
      def get_backend_api_models(
        app_id : String,
        backend_environment_name : String,
        resource_name : String
      ) : Protocol::Request
        input = Types::GetBackendAPIModelsRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name)
        get_backend_api_models(input)
      end
      def get_backend_api_models(input : Types::GetBackendAPIModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_API_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a backend auth details.
      def get_backend_auth(
        app_id : String,
        backend_environment_name : String,
        resource_name : String
      ) : Protocol::Request
        input = Types::GetBackendAuthRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name)
        get_backend_auth(input)
      end
      def get_backend_auth(input : Types::GetBackendAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific job.
      def get_backend_job(
        app_id : String,
        backend_environment_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetBackendJobRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, job_id: job_id)
        get_backend_job(input)
      end
      def get_backend_job(input : Types::GetBackendJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details for a backend storage resource.
      def get_backend_storage(
        app_id : String,
        backend_environment_name : String,
        resource_name : String
      ) : Protocol::Request
        input = Types::GetBackendStorageRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name)
        get_backend_storage(input)
      end
      def get_backend_storage(input : Types::GetBackendStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the challenge token based on the given appId and sessionId.
      def get_token(
        app_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetTokenRequest.new(app_id: app_id, session_id: session_id)
        get_token(input)
      end
      def get_token(input : Types::GetTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports an existing backend authentication resource.
      def import_backend_auth(
        app_id : String,
        backend_environment_name : String,
        native_client_id : String,
        user_pool_id : String,
        web_client_id : String,
        identity_pool_id : String? = nil
      ) : Protocol::Request
        input = Types::ImportBackendAuthRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, native_client_id: native_client_id, user_pool_id: user_pool_id, web_client_id: web_client_id, identity_pool_id: identity_pool_id)
        import_backend_auth(input)
      end
      def import_backend_auth(input : Types::ImportBackendAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_BACKEND_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports an existing backend storage resource.
      def import_backend_storage(
        app_id : String,
        backend_environment_name : String,
        service_name : String,
        bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::ImportBackendStorageRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, service_name: service_name, bucket_name: bucket_name)
        import_backend_storage(input)
      end
      def import_backend_storage(input : Types::ImportBackendStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_BACKEND_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the jobs for the backend of an Amplify app.
      def list_backend_jobs(
        app_id : String,
        backend_environment_name : String,
        job_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        operation : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListBackendJobsRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, job_id: job_id, max_results: max_results, next_token: next_token, operation: operation, status: status)
        list_backend_jobs(input)
      end
      def list_backend_jobs(input : Types::ListBackendJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKEND_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The list of S3 buckets in your account.
      def list_s3_buckets(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListS3BucketsRequest.new(next_token: next_token)
        list_s3_buckets(input)
      end
      def list_s3_buckets(input : Types::ListS3BucketsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_S3_BUCKETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes all backend environments from your Amplify project.
      def remove_all_backends(
        app_id : String,
        clean_amplify_app : Bool? = nil
      ) : Protocol::Request
        input = Types::RemoveAllBackendsRequest.new(app_id: app_id, clean_amplify_app: clean_amplify_app)
        remove_all_backends(input)
      end
      def remove_all_backends(input : Types::RemoveAllBackendsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ALL_BACKENDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the AWS resources required to access the Amplify Admin UI.
      def remove_backend_config(
        app_id : String
      ) : Protocol::Request
        input = Types::RemoveBackendConfigRequest.new(app_id: app_id)
        remove_backend_config(input)
      end
      def remove_backend_config(input : Types::RemoveBackendConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_BACKEND_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing backend API resource.
      def update_backend_api(
        app_id : String,
        backend_environment_name : String,
        resource_name : String,
        resource_config : Types::BackendAPIResourceConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateBackendAPIRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_name: resource_name, resource_config: resource_config)
        update_backend_api(input)
      end
      def update_backend_api(input : Types::UpdateBackendAPIRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKEND_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing backend authentication resource.
      def update_backend_auth(
        app_id : String,
        backend_environment_name : String,
        resource_config : Types::UpdateBackendAuthResourceConfig,
        resource_name : String
      ) : Protocol::Request
        input = Types::UpdateBackendAuthRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        update_backend_auth(input)
      end
      def update_backend_auth(input : Types::UpdateBackendAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKEND_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the AWS resources required to access the Amplify Admin UI.
      def update_backend_config(
        app_id : String,
        login_auth_config : Types::LoginAuthConfigReqObj? = nil
      ) : Protocol::Request
        input = Types::UpdateBackendConfigRequest.new(app_id: app_id, login_auth_config: login_auth_config)
        update_backend_config(input)
      end
      def update_backend_config(input : Types::UpdateBackendConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKEND_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specific job.
      def update_backend_job(
        app_id : String,
        backend_environment_name : String,
        job_id : String,
        operation : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateBackendJobRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, job_id: job_id, operation: operation, status: status)
        update_backend_job(input)
      end
      def update_backend_job(input : Types::UpdateBackendJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKEND_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing backend storage resource.
      def update_backend_storage(
        app_id : String,
        backend_environment_name : String,
        resource_config : Types::UpdateBackendStorageResourceConfig,
        resource_name : String
      ) : Protocol::Request
        input = Types::UpdateBackendStorageRequest.new(app_id: app_id, backend_environment_name: backend_environment_name, resource_config: resource_config, resource_name: resource_name)
        update_backend_storage(input)
      end
      def update_backend_storage(input : Types::UpdateBackendStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKEND_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
