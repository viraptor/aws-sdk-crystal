module AwsSdk
  module Amplify
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

      # Creates a new Amplify app.
      def create_app(
        name : String,
        access_token : String? = nil,
        auto_branch_creation_config : Types::AutoBranchCreationConfig? = nil,
        auto_branch_creation_patterns : Array(String)? = nil,
        basic_auth_credentials : String? = nil,
        build_spec : String? = nil,
        cache_config : Types::CacheConfig? = nil,
        compute_role_arn : String? = nil,
        custom_headers : String? = nil,
        custom_rules : Array(Types::CustomRule)? = nil,
        description : String? = nil,
        enable_auto_branch_creation : Bool? = nil,
        enable_basic_auth : Bool? = nil,
        enable_branch_auto_build : Bool? = nil,
        enable_branch_auto_deletion : Bool? = nil,
        environment_variables : Hash(String, String)? = nil,
        iam_service_role_arn : String? = nil,
        job_config : Types::JobConfig? = nil,
        oauth_token : String? = nil,
        platform : String? = nil,
        repository : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAppRequest.new(name: name, access_token: access_token, auto_branch_creation_config: auto_branch_creation_config, auto_branch_creation_patterns: auto_branch_creation_patterns, basic_auth_credentials: basic_auth_credentials, build_spec: build_spec, cache_config: cache_config, compute_role_arn: compute_role_arn, custom_headers: custom_headers, custom_rules: custom_rules, description: description, enable_auto_branch_creation: enable_auto_branch_creation, enable_basic_auth: enable_basic_auth, enable_branch_auto_build: enable_branch_auto_build, enable_branch_auto_deletion: enable_branch_auto_deletion, environment_variables: environment_variables, iam_service_role_arn: iam_service_role_arn, job_config: job_config, oauth_token: oauth_token, platform: platform, repository: repository, tags: tags)
        create_app(input)
      end
      def create_app(input : Types::CreateAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new backend environment for an Amplify app. This API is available only to Amplify Gen 1
      # applications where the backend is created using Amplify Studio or the Amplify command line interface
      # (CLI). This API isn’t available to Amplify Gen 2 applications. When you deploy an application with
      # Amplify Gen 2, you provision the app's backend infrastructure using Typescript code.
      def create_backend_environment(
        app_id : String,
        environment_name : String,
        deployment_artifacts : String? = nil,
        stack_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackendEnvironmentRequest.new(app_id: app_id, environment_name: environment_name, deployment_artifacts: deployment_artifacts, stack_name: stack_name)
        create_backend_environment(input)
      end
      def create_backend_environment(input : Types::CreateBackendEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKEND_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new branch for an Amplify app.
      def create_branch(
        app_id : String,
        branch_name : String,
        backend : Types::Backend? = nil,
        backend_environment_arn : String? = nil,
        basic_auth_credentials : String? = nil,
        build_spec : String? = nil,
        compute_role_arn : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        enable_auto_build : Bool? = nil,
        enable_basic_auth : Bool? = nil,
        enable_notification : Bool? = nil,
        enable_performance_mode : Bool? = nil,
        enable_pull_request_preview : Bool? = nil,
        enable_skew_protection : Bool? = nil,
        environment_variables : Hash(String, String)? = nil,
        framework : String? = nil,
        pull_request_environment_name : String? = nil,
        stage : String? = nil,
        tags : Hash(String, String)? = nil,
        ttl : String? = nil
      ) : Protocol::Request
        input = Types::CreateBranchRequest.new(app_id: app_id, branch_name: branch_name, backend: backend, backend_environment_arn: backend_environment_arn, basic_auth_credentials: basic_auth_credentials, build_spec: build_spec, compute_role_arn: compute_role_arn, description: description, display_name: display_name, enable_auto_build: enable_auto_build, enable_basic_auth: enable_basic_auth, enable_notification: enable_notification, enable_performance_mode: enable_performance_mode, enable_pull_request_preview: enable_pull_request_preview, enable_skew_protection: enable_skew_protection, environment_variables: environment_variables, framework: framework, pull_request_environment_name: pull_request_environment_name, stage: stage, tags: tags, ttl: ttl)
        create_branch(input)
      end
      def create_branch(input : Types::CreateBranchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BRANCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a deployment for a manually deployed Amplify app. Manually deployed apps are not connected
      # to a Git repository. The maximum duration between the CreateDeployment call and the StartDeployment
      # call cannot exceed 8 hours. If the duration exceeds 8 hours, the StartDeployment call and the
      # associated Job will fail.
      def create_deployment(
        app_id : String,
        branch_name : String,
        file_map : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(app_id: app_id, branch_name: branch_name, file_map: file_map)
        create_deployment(input)
      end
      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new domain association for an Amplify app. This action associates a custom domain with the
      # Amplify app
      def create_domain_association(
        app_id : String,
        domain_name : String,
        sub_domain_settings : Array(Types::SubDomainSetting),
        auto_sub_domain_creation_patterns : Array(String)? = nil,
        auto_sub_domain_iam_role : String? = nil,
        certificate_settings : Types::CertificateSettings? = nil,
        enable_auto_sub_domain : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateDomainAssociationRequest.new(app_id: app_id, domain_name: domain_name, sub_domain_settings: sub_domain_settings, auto_sub_domain_creation_patterns: auto_sub_domain_creation_patterns, auto_sub_domain_iam_role: auto_sub_domain_iam_role, certificate_settings: certificate_settings, enable_auto_sub_domain: enable_auto_sub_domain)
        create_domain_association(input)
      end
      def create_domain_association(input : Types::CreateDomainAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new webhook on an Amplify app.
      def create_webhook(
        app_id : String,
        branch_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateWebhookRequest.new(app_id: app_id, branch_name: branch_name, description: description)
        create_webhook(input)
      end
      def create_webhook(input : Types::CreateWebhookRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WEBHOOK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Amplify app specified by an app ID.
      def delete_app(
        app_id : String
      ) : Protocol::Request
        input = Types::DeleteAppRequest.new(app_id: app_id)
        delete_app(input)
      end
      def delete_app(input : Types::DeleteAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a backend environment for an Amplify app. This API is available only to Amplify Gen 1
      # applications where the backend is created using Amplify Studio or the Amplify command line interface
      # (CLI). This API isn’t available to Amplify Gen 2 applications. When you deploy an application with
      # Amplify Gen 2, you provision the app's backend infrastructure using Typescript code.
      def delete_backend_environment(
        app_id : String,
        environment_name : String
      ) : Protocol::Request
        input = Types::DeleteBackendEnvironmentRequest.new(app_id: app_id, environment_name: environment_name)
        delete_backend_environment(input)
      end
      def delete_backend_environment(input : Types::DeleteBackendEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKEND_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a branch for an Amplify app.
      def delete_branch(
        app_id : String,
        branch_name : String
      ) : Protocol::Request
        input = Types::DeleteBranchRequest.new(app_id: app_id, branch_name: branch_name)
        delete_branch(input)
      end
      def delete_branch(input : Types::DeleteBranchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BRANCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a domain association for an Amplify app.
      def delete_domain_association(
        app_id : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainAssociationRequest.new(app_id: app_id, domain_name: domain_name)
        delete_domain_association(input)
      end
      def delete_domain_association(input : Types::DeleteDomainAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a job for a branch of an Amplify app.
      def delete_job(
        app_id : String,
        branch_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::DeleteJobRequest.new(app_id: app_id, branch_name: branch_name, job_id: job_id)
        delete_job(input)
      end
      def delete_job(input : Types::DeleteJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a webhook.
      def delete_webhook(
        webhook_id : String
      ) : Protocol::Request
        input = Types::DeleteWebhookRequest.new(webhook_id: webhook_id)
        delete_webhook(input)
      end
      def delete_webhook(input : Types::DeleteWebhookRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WEBHOOK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the website access logs for a specific time range using a presigned URL.
      def generate_access_logs(
        app_id : String,
        domain_name : String,
        end_time : Time? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GenerateAccessLogsRequest.new(app_id: app_id, domain_name: domain_name, end_time: end_time, start_time: start_time)
        generate_access_logs(input)
      end
      def generate_access_logs(input : Types::GenerateAccessLogsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_ACCESS_LOGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an existing Amplify app specified by an app ID.
      def get_app(
        app_id : String
      ) : Protocol::Request
        input = Types::GetAppRequest.new(app_id: app_id)
        get_app(input)
      end
      def get_app(input : Types::GetAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the artifact info that corresponds to an artifact id.
      def get_artifact_url(
        artifact_id : String
      ) : Protocol::Request
        input = Types::GetArtifactUrlRequest.new(artifact_id: artifact_id)
        get_artifact_url(input)
      end
      def get_artifact_url(input : Types::GetArtifactUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ARTIFACT_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a backend environment for an Amplify app. This API is available only to Amplify Gen 1
      # applications where the backend is created using Amplify Studio or the Amplify command line interface
      # (CLI). This API isn’t available to Amplify Gen 2 applications. When you deploy an application with
      # Amplify Gen 2, you provision the app's backend infrastructure using Typescript code.
      def get_backend_environment(
        app_id : String,
        environment_name : String
      ) : Protocol::Request
        input = Types::GetBackendEnvironmentRequest.new(app_id: app_id, environment_name: environment_name)
        get_backend_environment(input)
      end
      def get_backend_environment(input : Types::GetBackendEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKEND_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a branch for an Amplify app.
      def get_branch(
        app_id : String,
        branch_name : String
      ) : Protocol::Request
        input = Types::GetBranchRequest.new(app_id: app_id, branch_name: branch_name)
        get_branch(input)
      end
      def get_branch(input : Types::GetBranchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BRANCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the domain information for an Amplify app.
      def get_domain_association(
        app_id : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::GetDomainAssociationRequest.new(app_id: app_id, domain_name: domain_name)
        get_domain_association(input)
      end
      def get_domain_association(input : Types::GetDomainAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a job for a branch of an Amplify app.
      def get_job(
        app_id : String,
        branch_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetJobRequest.new(app_id: app_id, branch_name: branch_name, job_id: job_id)
        get_job(input)
      end
      def get_job(input : Types::GetJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the webhook information that corresponds to a specified webhook ID.
      def get_webhook(
        webhook_id : String
      ) : Protocol::Request
        input = Types::GetWebhookRequest.new(webhook_id: webhook_id)
        get_webhook(input)
      end
      def get_webhook(input : Types::GetWebhookRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WEBHOOK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the existing Amplify apps.
      def list_apps(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppsRequest.new(max_results: max_results, next_token: next_token)
        list_apps(input)
      end
      def list_apps(input : Types::ListAppsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of end-to-end testing artifacts for a specified app, branch, and job. To return the
      # build artifacts, use the GetJob API. For more information about Amplify testing support, see Setting
      # up end-to-end Cypress tests for your Amplify application in the Amplify Hosting User Guide .
      def list_artifacts(
        app_id : String,
        branch_name : String,
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListArtifactsRequest.new(app_id: app_id, branch_name: branch_name, job_id: job_id, max_results: max_results, next_token: next_token)
        list_artifacts(input)
      end
      def list_artifacts(input : Types::ListArtifactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ARTIFACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the backend environments for an Amplify app. This API is available only to Amplify Gen 1
      # applications where the backend is created using Amplify Studio or the Amplify command line interface
      # (CLI). This API isn’t available to Amplify Gen 2 applications. When you deploy an application with
      # Amplify Gen 2, you provision the app's backend infrastructure using Typescript code.
      def list_backend_environments(
        app_id : String,
        environment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackendEnvironmentsRequest.new(app_id: app_id, environment_name: environment_name, max_results: max_results, next_token: next_token)
        list_backend_environments(input)
      end
      def list_backend_environments(input : Types::ListBackendEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKEND_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the branches of an Amplify app.
      def list_branches(
        app_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBranchesRequest.new(app_id: app_id, max_results: max_results, next_token: next_token)
        list_branches(input)
      end
      def list_branches(input : Types::ListBranchesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BRANCHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the domain associations for an Amplify app.
      def list_domain_associations(
        app_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainAssociationsRequest.new(app_id: app_id, max_results: max_results, next_token: next_token)
        list_domain_associations(input)
      end
      def list_domain_associations(input : Types::ListDomainAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the jobs for a branch of an Amplify app.
      def list_jobs(
        app_id : String,
        branch_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(app_id: app_id, branch_name: branch_name, max_results: max_results, next_token: next_token)
        list_jobs(input)
      end
      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
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

      # Returns a list of webhooks for an Amplify app.
      def list_webhooks(
        app_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWebhooksRequest.new(app_id: app_id, max_results: max_results, next_token: next_token)
        list_webhooks(input)
      end
      def list_webhooks(input : Types::ListWebhooksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WEBHOOKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a deployment for a manually deployed app. Manually deployed apps are not connected to a Git
      # repository. The maximum duration between the CreateDeployment call and the StartDeployment call
      # cannot exceed 8 hours. If the duration exceeds 8 hours, the StartDeployment call and the associated
      # Job will fail.
      def start_deployment(
        app_id : String,
        branch_name : String,
        job_id : String? = nil,
        source_url : String? = nil,
        source_url_type : String? = nil
      ) : Protocol::Request
        input = Types::StartDeploymentRequest.new(app_id: app_id, branch_name: branch_name, job_id: job_id, source_url: source_url, source_url_type: source_url_type)
        start_deployment(input)
      end
      def start_deployment(input : Types::StartDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a new job for a branch of an Amplify app.
      def start_job(
        app_id : String,
        branch_name : String,
        job_type : String,
        commit_id : String? = nil,
        commit_message : String? = nil,
        commit_time : Time? = nil,
        job_id : String? = nil,
        job_reason : String? = nil
      ) : Protocol::Request
        input = Types::StartJobRequest.new(app_id: app_id, branch_name: branch_name, job_type: job_type, commit_id: commit_id, commit_message: commit_message, commit_time: commit_time, job_id: job_id, job_reason: job_reason)
        start_job(input)
      end
      def start_job(input : Types::StartJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a job that is in progress for a branch of an Amplify app.
      def stop_job(
        app_id : String,
        branch_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::StopJobRequest.new(app_id: app_id, branch_name: branch_name, job_id: job_id)
        stop_job(input)
      end
      def stop_job(input : Types::StopJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_JOB, input, endpoint)
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

      # Updates an existing Amplify app.
      def update_app(
        app_id : String,
        access_token : String? = nil,
        auto_branch_creation_config : Types::AutoBranchCreationConfig? = nil,
        auto_branch_creation_patterns : Array(String)? = nil,
        basic_auth_credentials : String? = nil,
        build_spec : String? = nil,
        cache_config : Types::CacheConfig? = nil,
        compute_role_arn : String? = nil,
        custom_headers : String? = nil,
        custom_rules : Array(Types::CustomRule)? = nil,
        description : String? = nil,
        enable_auto_branch_creation : Bool? = nil,
        enable_basic_auth : Bool? = nil,
        enable_branch_auto_build : Bool? = nil,
        enable_branch_auto_deletion : Bool? = nil,
        environment_variables : Hash(String, String)? = nil,
        iam_service_role_arn : String? = nil,
        job_config : Types::JobConfig? = nil,
        name : String? = nil,
        oauth_token : String? = nil,
        platform : String? = nil,
        repository : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAppRequest.new(app_id: app_id, access_token: access_token, auto_branch_creation_config: auto_branch_creation_config, auto_branch_creation_patterns: auto_branch_creation_patterns, basic_auth_credentials: basic_auth_credentials, build_spec: build_spec, cache_config: cache_config, compute_role_arn: compute_role_arn, custom_headers: custom_headers, custom_rules: custom_rules, description: description, enable_auto_branch_creation: enable_auto_branch_creation, enable_basic_auth: enable_basic_auth, enable_branch_auto_build: enable_branch_auto_build, enable_branch_auto_deletion: enable_branch_auto_deletion, environment_variables: environment_variables, iam_service_role_arn: iam_service_role_arn, job_config: job_config, name: name, oauth_token: oauth_token, platform: platform, repository: repository)
        update_app(input)
      end
      def update_app(input : Types::UpdateAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a branch for an Amplify app.
      def update_branch(
        app_id : String,
        branch_name : String,
        backend : Types::Backend? = nil,
        backend_environment_arn : String? = nil,
        basic_auth_credentials : String? = nil,
        build_spec : String? = nil,
        compute_role_arn : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        enable_auto_build : Bool? = nil,
        enable_basic_auth : Bool? = nil,
        enable_notification : Bool? = nil,
        enable_performance_mode : Bool? = nil,
        enable_pull_request_preview : Bool? = nil,
        enable_skew_protection : Bool? = nil,
        environment_variables : Hash(String, String)? = nil,
        framework : String? = nil,
        pull_request_environment_name : String? = nil,
        stage : String? = nil,
        ttl : String? = nil
      ) : Protocol::Request
        input = Types::UpdateBranchRequest.new(app_id: app_id, branch_name: branch_name, backend: backend, backend_environment_arn: backend_environment_arn, basic_auth_credentials: basic_auth_credentials, build_spec: build_spec, compute_role_arn: compute_role_arn, description: description, display_name: display_name, enable_auto_build: enable_auto_build, enable_basic_auth: enable_basic_auth, enable_notification: enable_notification, enable_performance_mode: enable_performance_mode, enable_pull_request_preview: enable_pull_request_preview, enable_skew_protection: enable_skew_protection, environment_variables: environment_variables, framework: framework, pull_request_environment_name: pull_request_environment_name, stage: stage, ttl: ttl)
        update_branch(input)
      end
      def update_branch(input : Types::UpdateBranchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRANCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new domain association for an Amplify app.
      def update_domain_association(
        app_id : String,
        domain_name : String,
        auto_sub_domain_creation_patterns : Array(String)? = nil,
        auto_sub_domain_iam_role : String? = nil,
        certificate_settings : Types::CertificateSettings? = nil,
        enable_auto_sub_domain : Bool? = nil,
        sub_domain_settings : Array(Types::SubDomainSetting)? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainAssociationRequest.new(app_id: app_id, domain_name: domain_name, auto_sub_domain_creation_patterns: auto_sub_domain_creation_patterns, auto_sub_domain_iam_role: auto_sub_domain_iam_role, certificate_settings: certificate_settings, enable_auto_sub_domain: enable_auto_sub_domain, sub_domain_settings: sub_domain_settings)
        update_domain_association(input)
      end
      def update_domain_association(input : Types::UpdateDomainAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a webhook.
      def update_webhook(
        webhook_id : String,
        branch_name : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWebhookRequest.new(webhook_id: webhook_id, branch_name: branch_name, description: description)
        update_webhook(input)
      end
      def update_webhook(input : Types::UpdateWebhookRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WEBHOOK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
