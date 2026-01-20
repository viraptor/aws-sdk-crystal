module AwsSdk
  module DataBrew
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

      # Deletes one or more versions of a recipe at a time. The entire request will be rejected if: The
      # recipe does not exist. There is an invalid version identifier in the list of versions. The version
      # list is empty. The version list size exceeds 50. The version list contains duplicate entries. The
      # request will complete successfully, but with partial failures, if: A version does not exist. A
      # version is being used by a job. You specify LATEST_WORKING , but it's being used by a project. The
      # version fails to be deleted. The LATEST_WORKING version will only be deleted if the recipe has no
      # other versions. If you try to delete LATEST_WORKING while other versions exist (or if they can't be
      # deleted), then LATEST_WORKING will be listed as partial failure in the response.

      def batch_delete_recipe_version(
        name : String,
        recipe_versions : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteRecipeVersionRequest.new(name: name, recipe_versions: recipe_versions)
        batch_delete_recipe_version(input)
      end

      def batch_delete_recipe_version(input : Types::BatchDeleteRecipeVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_RECIPE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new DataBrew dataset.

      def create_dataset(
        input : Types::Input,
        name : String,
        format : String? = nil,
        format_options : Types::FormatOptions? = nil,
        path_options : Types::PathOptions? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDatasetRequest.new(input: input, name: name, format: format, format_options: format_options, path_options: path_options, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new job to analyze a dataset and create its data profile.

      def create_profile_job(
        dataset_name : String,
        name : String,
        output_location : Types::S3Location,
        role_arn : String,
        configuration : Types::ProfileConfiguration? = nil,
        encryption_key_arn : String? = nil,
        encryption_mode : String? = nil,
        job_sample : Types::JobSample? = nil,
        log_subscription : String? = nil,
        max_capacity : Int32? = nil,
        max_retries : Int32? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Int32? = nil,
        validation_configurations : Array(Types::ValidationConfiguration)? = nil
      ) : Protocol::Request
        input = Types::CreateProfileJobRequest.new(dataset_name: dataset_name, name: name, output_location: output_location, role_arn: role_arn, configuration: configuration, encryption_key_arn: encryption_key_arn, encryption_mode: encryption_mode, job_sample: job_sample, log_subscription: log_subscription, max_capacity: max_capacity, max_retries: max_retries, tags: tags, timeout: timeout, validation_configurations: validation_configurations)
        create_profile_job(input)
      end

      def create_profile_job(input : Types::CreateProfileJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new DataBrew project.

      def create_project(
        dataset_name : String,
        name : String,
        recipe_name : String,
        role_arn : String,
        sample : Types::Sample? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProjectRequest.new(dataset_name: dataset_name, name: name, recipe_name: recipe_name, role_arn: role_arn, sample: sample, tags: tags)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new DataBrew recipe.

      def create_recipe(
        name : String,
        steps : Array(Types::RecipeStep),
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRecipeRequest.new(name: name, steps: steps, description: description, tags: tags)
        create_recipe(input)
      end

      def create_recipe(input : Types::CreateRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new job to transform input data, using steps defined in an existing Glue DataBrew recipe

      def create_recipe_job(
        name : String,
        role_arn : String,
        data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
        database_outputs : Array(Types::DatabaseOutput)? = nil,
        dataset_name : String? = nil,
        encryption_key_arn : String? = nil,
        encryption_mode : String? = nil,
        log_subscription : String? = nil,
        max_capacity : Int32? = nil,
        max_retries : Int32? = nil,
        outputs : Array(Types::Output)? = nil,
        project_name : String? = nil,
        recipe_reference : Types::RecipeReference? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateRecipeJobRequest.new(name: name, role_arn: role_arn, data_catalog_outputs: data_catalog_outputs, database_outputs: database_outputs, dataset_name: dataset_name, encryption_key_arn: encryption_key_arn, encryption_mode: encryption_mode, log_subscription: log_subscription, max_capacity: max_capacity, max_retries: max_retries, outputs: outputs, project_name: project_name, recipe_reference: recipe_reference, tags: tags, timeout: timeout)
        create_recipe_job(input)
      end

      def create_recipe_job(input : Types::CreateRecipeJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECIPE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new ruleset that can be used in a profile job to validate the data quality of a dataset.

      def create_ruleset(
        name : String,
        rules : Array(Types::Rule),
        target_arn : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRulesetRequest.new(name: name, rules: rules, target_arn: target_arn, description: description, tags: tags)
        create_ruleset(input)
      end

      def create_ruleset(input : Types::CreateRulesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new schedule for one or more DataBrew jobs. Jobs can be run at a specific date and time,
      # or at regular intervals.

      def create_schedule(
        cron_expression : String,
        name : String,
        job_names : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateScheduleRequest.new(cron_expression: cron_expression, name: name, job_names: job_names, tags: tags)
        create_schedule(input)
      end

      def create_schedule(input : Types::CreateScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dataset from DataBrew.

      def delete_dataset(
        name : String
      ) : Protocol::Request
        input = Types::DeleteDatasetRequest.new(name: name)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified DataBrew job.

      def delete_job(
        name : String
      ) : Protocol::Request
        input = Types::DeleteJobRequest.new(name: name)
        delete_job(input)
      end

      def delete_job(input : Types::DeleteJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing DataBrew project.

      def delete_project(
        name : String
      ) : Protocol::Request
        input = Types::DeleteProjectRequest.new(name: name)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single version of a DataBrew recipe.

      def delete_recipe_version(
        name : String,
        recipe_version : String
      ) : Protocol::Request
        input = Types::DeleteRecipeVersionRequest.new(name: name, recipe_version: recipe_version)
        delete_recipe_version(input)
      end

      def delete_recipe_version(input : Types::DeleteRecipeVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECIPE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a ruleset.

      def delete_ruleset(
        name : String
      ) : Protocol::Request
        input = Types::DeleteRulesetRequest.new(name: name)
        delete_ruleset(input)
      end

      def delete_ruleset(input : Types::DeleteRulesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified DataBrew schedule.

      def delete_schedule(
        name : String
      ) : Protocol::Request
        input = Types::DeleteScheduleRequest.new(name: name)
        delete_schedule(input)
      end

      def delete_schedule(input : Types::DeleteScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the definition of a specific DataBrew dataset.

      def describe_dataset(
        name : String
      ) : Protocol::Request
        input = Types::DescribeDatasetRequest.new(name: name)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the definition of a specific DataBrew job.

      def describe_job(
        name : String
      ) : Protocol::Request
        input = Types::DescribeJobRequest.new(name: name)
        describe_job(input)
      end

      def describe_job(input : Types::DescribeJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents one run of a DataBrew job.

      def describe_job_run(
        name : String,
        run_id : String
      ) : Protocol::Request
        input = Types::DescribeJobRunRequest.new(name: name, run_id: run_id)
        describe_job_run(input)
      end

      def describe_job_run(input : Types::DescribeJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the definition of a specific DataBrew project.

      def describe_project(
        name : String
      ) : Protocol::Request
        input = Types::DescribeProjectRequest.new(name: name)
        describe_project(input)
      end

      def describe_project(input : Types::DescribeProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the definition of a specific DataBrew recipe corresponding to a particular version.

      def describe_recipe(
        name : String,
        recipe_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRecipeRequest.new(name: name, recipe_version: recipe_version)
        describe_recipe(input)
      end

      def describe_recipe(input : Types::DescribeRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about the ruleset.

      def describe_ruleset(
        name : String
      ) : Protocol::Request
        input = Types::DescribeRulesetRequest.new(name: name)
        describe_ruleset(input)
      end

      def describe_ruleset(input : Types::DescribeRulesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RULESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the definition of a specific DataBrew schedule.

      def describe_schedule(
        name : String
      ) : Protocol::Request
        input = Types::DescribeScheduleRequest.new(name: name)
        describe_schedule(input)
      end

      def describe_schedule(input : Types::DescribeScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the DataBrew datasets.

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

      # Lists all of the previous runs of a particular DataBrew job.

      def list_job_runs(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobRunsRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_job_runs(input)
      end

      def list_job_runs(input : Types::ListJobRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the DataBrew jobs that are defined.

      def list_jobs(
        dataset_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_name : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(dataset_name: dataset_name, max_results: max_results, next_token: next_token, project_name: project_name)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the DataBrew projects that are defined.

      def list_projects(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectsRequest.new(max_results: max_results, next_token: next_token)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a particular DataBrew recipe, except for LATEST_WORKING .

      def list_recipe_versions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecipeVersionsRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_recipe_versions(input)
      end

      def list_recipe_versions(input : Types::ListRecipeVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECIPE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the DataBrew recipes that are defined.

      def list_recipes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        recipe_version : String? = nil
      ) : Protocol::Request
        input = Types::ListRecipesRequest.new(max_results: max_results, next_token: next_token, recipe_version: recipe_version)
        list_recipes(input)
      end

      def list_recipes(input : Types::ListRecipesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECIPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all rulesets available in the current account or rulesets associated with a specific resource
      # (dataset).

      def list_rulesets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListRulesetsRequest.new(max_results: max_results, next_token: next_token, target_arn: target_arn)
        list_rulesets(input)
      end

      def list_rulesets(input : Types::ListRulesetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULESETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the DataBrew schedules that are defined.

      def list_schedules(
        job_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSchedulesRequest.new(job_name: job_name, max_results: max_results, next_token: next_token)
        list_schedules(input)
      end

      def list_schedules(input : Types::ListSchedulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the tags for a DataBrew resource.

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

      # Publishes a new version of a DataBrew recipe.

      def publish_recipe(
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::PublishRecipeRequest.new(name: name, description: description)
        publish_recipe(input)
      end

      def publish_recipe(input : Types::PublishRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs a recipe step within an interactive DataBrew session that's currently open.

      def send_project_session_action(
        name : String,
        client_session_id : String? = nil,
        preview : Bool? = nil,
        recipe_step : Types::RecipeStep? = nil,
        step_index : Int32? = nil,
        view_frame : Types::ViewFrame? = nil
      ) : Protocol::Request
        input = Types::SendProjectSessionActionRequest.new(name: name, client_session_id: client_session_id, preview: preview, recipe_step: recipe_step, step_index: step_index, view_frame: view_frame)
        send_project_session_action(input)
      end

      def send_project_session_action(input : Types::SendProjectSessionActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_PROJECT_SESSION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Runs a DataBrew job.

      def start_job_run(
        name : String
      ) : Protocol::Request
        input = Types::StartJobRunRequest.new(name: name)
        start_job_run(input)
      end

      def start_job_run(input : Types::StartJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an interactive session, enabling you to manipulate data in a DataBrew project.

      def start_project_session(
        name : String,
        assume_control : Bool? = nil
      ) : Protocol::Request
        input = Types::StartProjectSessionRequest.new(name: name, assume_control: assume_control)
        start_project_session(input)
      end

      def start_project_session(input : Types::StartProjectSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PROJECT_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a particular run of a job.

      def stop_job_run(
        name : String,
        run_id : String
      ) : Protocol::Request
        input = Types::StopJobRunRequest.new(name: name, run_id: run_id)
        stop_job_run(input)
      end

      def stop_job_run(input : Types::StopJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds metadata tags to a DataBrew resource, such as a dataset, project, recipe, job, or schedule.

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

      # Removes metadata tags from a DataBrew resource.

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

      # Modifies the definition of an existing DataBrew dataset.

      def update_dataset(
        input : Types::Input,
        name : String,
        format : String? = nil,
        format_options : Types::FormatOptions? = nil,
        path_options : Types::PathOptions? = nil
      ) : Protocol::Request
        input = Types::UpdateDatasetRequest.new(input: input, name: name, format: format, format_options: format_options, path_options: path_options)
        update_dataset(input)
      end

      def update_dataset(input : Types::UpdateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the definition of an existing profile job.

      def update_profile_job(
        name : String,
        output_location : Types::S3Location,
        role_arn : String,
        configuration : Types::ProfileConfiguration? = nil,
        encryption_key_arn : String? = nil,
        encryption_mode : String? = nil,
        job_sample : Types::JobSample? = nil,
        log_subscription : String? = nil,
        max_capacity : Int32? = nil,
        max_retries : Int32? = nil,
        timeout : Int32? = nil,
        validation_configurations : Array(Types::ValidationConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateProfileJobRequest.new(name: name, output_location: output_location, role_arn: role_arn, configuration: configuration, encryption_key_arn: encryption_key_arn, encryption_mode: encryption_mode, job_sample: job_sample, log_subscription: log_subscription, max_capacity: max_capacity, max_retries: max_retries, timeout: timeout, validation_configurations: validation_configurations)
        update_profile_job(input)
      end

      def update_profile_job(input : Types::UpdateProfileJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the definition of an existing DataBrew project.

      def update_project(
        name : String,
        role_arn : String,
        sample : Types::Sample? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectRequest.new(name: name, role_arn: role_arn, sample: sample)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the definition of the LATEST_WORKING version of a DataBrew recipe.

      def update_recipe(
        name : String,
        description : String? = nil,
        steps : Array(Types::RecipeStep)? = nil
      ) : Protocol::Request
        input = Types::UpdateRecipeRequest.new(name: name, description: description, steps: steps)
        update_recipe(input)
      end

      def update_recipe(input : Types::UpdateRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the definition of an existing DataBrew recipe job.

      def update_recipe_job(
        name : String,
        role_arn : String,
        data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
        database_outputs : Array(Types::DatabaseOutput)? = nil,
        encryption_key_arn : String? = nil,
        encryption_mode : String? = nil,
        log_subscription : String? = nil,
        max_capacity : Int32? = nil,
        max_retries : Int32? = nil,
        outputs : Array(Types::Output)? = nil,
        timeout : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateRecipeJobRequest.new(name: name, role_arn: role_arn, data_catalog_outputs: data_catalog_outputs, database_outputs: database_outputs, encryption_key_arn: encryption_key_arn, encryption_mode: encryption_mode, log_subscription: log_subscription, max_capacity: max_capacity, max_retries: max_retries, outputs: outputs, timeout: timeout)
        update_recipe_job(input)
      end

      def update_recipe_job(input : Types::UpdateRecipeJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECIPE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates specified ruleset.

      def update_ruleset(
        name : String,
        rules : Array(Types::Rule),
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRulesetRequest.new(name: name, rules: rules, description: description)
        update_ruleset(input)
      end

      def update_ruleset(input : Types::UpdateRulesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RULESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the definition of an existing DataBrew schedule.

      def update_schedule(
        cron_expression : String,
        name : String,
        job_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateScheduleRequest.new(cron_expression: cron_expression, name: name, job_names: job_names)
        update_schedule(input)
      end

      def update_schedule(input : Types::UpdateScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
