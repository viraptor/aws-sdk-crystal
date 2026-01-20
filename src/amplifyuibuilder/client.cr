module Aws
  module AmplifyUIBuilder
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a new component for an Amplify app.

      def create_component(
        app_id : String,
        component_to_create : Types::CreateComponentData,
        environment_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateComponentRequest.new(app_id: app_id, component_to_create: component_to_create, environment_name: environment_name, client_token: client_token)
        create_component(input)
      end

      def create_component(input : Types::CreateComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new form for an Amplify app.

      def create_form(
        app_id : String,
        environment_name : String,
        form_to_create : Types::CreateFormData,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateFormRequest.new(app_id: app_id, environment_name: environment_name, form_to_create: form_to_create, client_token: client_token)
        create_form(input)
      end

      def create_form(input : Types::CreateFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a theme to apply to the components in an Amplify app.

      def create_theme(
        app_id : String,
        environment_name : String,
        theme_to_create : Types::CreateThemeData,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateThemeRequest.new(app_id: app_id, environment_name: environment_name, theme_to_create: theme_to_create, client_token: client_token)
        create_theme(input)
      end

      def create_theme(input : Types::CreateThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a component from an Amplify app.

      def delete_component(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteComponentRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        delete_component(input)
      end

      def delete_component(input : Types::DeleteComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a form from an Amplify app.

      def delete_form(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteFormRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        delete_form(input)
      end

      def delete_form(input : Types::DeleteFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a theme from an Amplify app.

      def delete_theme(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteThemeRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        delete_theme(input)
      end

      def delete_theme(input : Types::DeleteThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This is for internal use. Amplify uses this action to exchange an access code for a token.

      def exchange_code_for_token(
        provider : String,
        request : Types::ExchangeCodeForTokenRequestBody
      ) : Protocol::Request
        input = Types::ExchangeCodeForTokenRequest.new(provider: provider, request: request)
        exchange_code_for_token(input)
      end

      def exchange_code_for_token(input : Types::ExchangeCodeForTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXCHANGE_CODE_FOR_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports component configurations to code that is ready to integrate into an Amplify app.

      def export_components(
        app_id : String,
        environment_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ExportComponentsRequest.new(app_id: app_id, environment_name: environment_name, next_token: next_token)
        export_components(input)
      end

      def export_components(input : Types::ExportComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports form configurations to code that is ready to integrate into an Amplify app.

      def export_forms(
        app_id : String,
        environment_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ExportFormsRequest.new(app_id: app_id, environment_name: environment_name, next_token: next_token)
        export_forms(input)
      end

      def export_forms(input : Types::ExportFormsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_FORMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports theme configurations to code that is ready to integrate into an Amplify app.

      def export_themes(
        app_id : String,
        environment_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ExportThemesRequest.new(app_id: app_id, environment_name: environment_name, next_token: next_token)
        export_themes(input)
      end

      def export_themes(input : Types::ExportThemesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_THEMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an existing code generation job.

      def get_codegen_job(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::GetCodegenJobRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        get_codegen_job(input)
      end

      def get_codegen_job(input : Types::GetCodegenJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODEGEN_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an existing component for an Amplify app.

      def get_component(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::GetComponentRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        get_component(input)
      end

      def get_component(input : Types::GetComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an existing form for an Amplify app.

      def get_form(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::GetFormRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        get_form(input)
      end

      def get_form(input : Types::GetFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns existing metadata for an Amplify app.

      def get_metadata(
        app_id : String,
        environment_name : String
      ) : Protocol::Request
        input = Types::GetMetadataRequest.new(app_id: app_id, environment_name: environment_name)
        get_metadata(input)
      end

      def get_metadata(input : Types::GetMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an existing theme for an Amplify app.

      def get_theme(
        app_id : String,
        environment_name : String,
        id : String
      ) : Protocol::Request
        input = Types::GetThemeRequest.new(app_id: app_id, environment_name: environment_name, id: id)
        get_theme(input)
      end

      def get_theme(input : Types::GetThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of code generation jobs for a specified Amplify app and backend environment.

      def list_codegen_jobs(
        app_id : String,
        environment_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCodegenJobsRequest.new(app_id: app_id, environment_name: environment_name, max_results: max_results, next_token: next_token)
        list_codegen_jobs(input)
      end

      def list_codegen_jobs(input : Types::ListCodegenJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODEGEN_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of components for a specified Amplify app and backend environment.

      def list_components(
        app_id : String,
        environment_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentsRequest.new(app_id: app_id, environment_name: environment_name, max_results: max_results, next_token: next_token)
        list_components(input)
      end

      def list_components(input : Types::ListComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of forms for a specified Amplify app and backend environment.

      def list_forms(
        app_id : String,
        environment_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFormsRequest.new(app_id: app_id, environment_name: environment_name, max_results: max_results, next_token: next_token)
        list_forms(input)
      end

      def list_forms(input : Types::ListFormsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FORMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a specified Amazon Resource Name (ARN).

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

      # Retrieves a list of themes for a specified Amplify app and backend environment.

      def list_themes(
        app_id : String,
        environment_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThemesRequest.new(app_id: app_id, environment_name: environment_name, max_results: max_results, next_token: next_token)
        list_themes(input)
      end

      def list_themes(input : Types::ListThemesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THEMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stores the metadata information about a feature on a form.

      def put_metadata_flag(
        app_id : String,
        body : Types::PutMetadataFlagBody,
        environment_name : String,
        feature_name : String
      ) : Protocol::Request
        input = Types::PutMetadataFlagRequest.new(app_id: app_id, body: body, environment_name: environment_name, feature_name: feature_name)
        put_metadata_flag(input)
      end

      def put_metadata_flag(input : Types::PutMetadataFlagRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_METADATA_FLAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This is for internal use. Amplify uses this action to refresh a previously issued access token that
      # might have expired.

      def refresh_token(
        provider : String,
        refresh_token_body : Types::RefreshTokenRequestBody
      ) : Protocol::Request
        input = Types::RefreshTokenRequest.new(provider: provider, refresh_token_body: refresh_token_body)
        refresh_token(input)
      end

      def refresh_token(input : Types::RefreshTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REFRESH_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a code generation job for a specified Amplify app and backend environment.

      def start_codegen_job(
        app_id : String,
        codegen_job_to_create : Types::StartCodegenJobData,
        environment_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartCodegenJobRequest.new(app_id: app_id, codegen_job_to_create: codegen_job_to_create, environment_name: environment_name, client_token: client_token)
        start_codegen_job(input)
      end

      def start_codegen_job(input : Types::StartCodegenJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CODEGEN_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags the resource with a tag key and value.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Untags a resource with a specified Amazon Resource Name (ARN).

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

      # Updates an existing component.

      def update_component(
        app_id : String,
        environment_name : String,
        id : String,
        updated_component : Types::UpdateComponentData,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateComponentRequest.new(app_id: app_id, environment_name: environment_name, id: id, updated_component: updated_component, client_token: client_token)
        update_component(input)
      end

      def update_component(input : Types::UpdateComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing form.

      def update_form(
        app_id : String,
        environment_name : String,
        id : String,
        updated_form : Types::UpdateFormData,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFormRequest.new(app_id: app_id, environment_name: environment_name, id: id, updated_form: updated_form, client_token: client_token)
        update_form(input)
      end

      def update_form(input : Types::UpdateFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing theme.

      def update_theme(
        app_id : String,
        environment_name : String,
        id : String,
        updated_theme : Types::UpdateThemeData,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThemeRequest.new(app_id: app_id, environment_name: environment_name, id: id, updated_theme: updated_theme, client_token: client_token)
        update_theme(input)
      end

      def update_theme(input : Types::UpdateThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
