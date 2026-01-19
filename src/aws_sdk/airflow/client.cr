module AwsSdk
  module MWAA
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

      # Creates a CLI token for the Airflow CLI. To learn more, see Creating an Apache Airflow CLI token .
      def create_cli_token(
        name : String
      ) : Protocol::Request
        input = Types::CreateCliTokenRequest.new(name: name)
        create_cli_token(input)
      end
      def create_cli_token(input : Types::CreateCliTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLI_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Managed Workflows for Apache Airflow (Amazon MWAA) environment.
      def create_environment(
        dag_s3_path : String,
        execution_role_arn : String,
        name : String,
        network_configuration : Types::NetworkConfiguration,
        source_bucket_arn : String,
        airflow_configuration_options : Hash(String, String)? = nil,
        airflow_version : String? = nil,
        endpoint_management : String? = nil,
        environment_class : String? = nil,
        kms_key : String? = nil,
        logging_configuration : Types::LoggingConfigurationInput? = nil,
        max_webservers : Int32? = nil,
        max_workers : Int32? = nil,
        min_webservers : Int32? = nil,
        min_workers : Int32? = nil,
        plugins_s3_object_version : String? = nil,
        plugins_s3_path : String? = nil,
        requirements_s3_object_version : String? = nil,
        requirements_s3_path : String? = nil,
        schedulers : Int32? = nil,
        startup_script_s3_object_version : String? = nil,
        startup_script_s3_path : String? = nil,
        tags : Hash(String, String)? = nil,
        webserver_access_mode : String? = nil,
        weekly_maintenance_window_start : String? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentInput.new(dag_s3_path: dag_s3_path, execution_role_arn: execution_role_arn, name: name, network_configuration: network_configuration, source_bucket_arn: source_bucket_arn, airflow_configuration_options: airflow_configuration_options, airflow_version: airflow_version, endpoint_management: endpoint_management, environment_class: environment_class, kms_key: kms_key, logging_configuration: logging_configuration, max_webservers: max_webservers, max_workers: max_workers, min_webservers: min_webservers, min_workers: min_workers, plugins_s3_object_version: plugins_s3_object_version, plugins_s3_path: plugins_s3_path, requirements_s3_object_version: requirements_s3_object_version, requirements_s3_path: requirements_s3_path, schedulers: schedulers, startup_script_s3_object_version: startup_script_s3_object_version, startup_script_s3_path: startup_script_s3_path, tags: tags, webserver_access_mode: webserver_access_mode, weekly_maintenance_window_start: weekly_maintenance_window_start)
        create_environment(input)
      end
      def create_environment(input : Types::CreateEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a web login token for the Airflow Web UI. To learn more, see Creating an Apache Airflow web
      # login token .
      def create_web_login_token(
        name : String
      ) : Protocol::Request
        input = Types::CreateWebLoginTokenRequest.new(name: name)
        create_web_login_token(input)
      end
      def create_web_login_token(input : Types::CreateWebLoginTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WEB_LOGIN_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Managed Workflows for Apache Airflow (Amazon MWAA) environment.
      def delete_environment(
        name : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentInput.new(name: name)
        delete_environment(input)
      end
      def delete_environment(input : Types::DeleteEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
      def get_environment(
        name : String
      ) : Protocol::Request
        input = Types::GetEnvironmentInput.new(name: name)
        get_environment(input)
      end
      def get_environment(input : Types::GetEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes the Apache Airflow REST API on the webserver with the specified inputs. To learn more, see
      # Using the Apache Airflow REST API
      def invoke_rest_api(
        method : String,
        name : String,
        path : String,
        body : Types::RestApiRequestBody? = nil,
        query_parameters : Types::Document? = nil
      ) : Protocol::Request
        input = Types::InvokeRestApiRequest.new(method: method, name: name, path: path, body: body, query_parameters: query_parameters)
        invoke_rest_api(input)
      end
      def invoke_rest_api(input : Types::InvokeRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Managed Workflows for Apache Airflow (MWAA) environments.
      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsInput.new(max_results: max_results, next_token: next_token)
        list_environments(input)
      end
      def list_environments(input : Types::ListEnvironmentsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the key-value tag pairs associated to the Amazon Managed Workflows for Apache Airflow (MWAA)
      # environment. For example, "Environment": "Staging" .
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Internal only . Publishes environment health metrics to Amazon CloudWatch.
      def publish_metrics(
        environment_name : String,
        metric_data : Array(Types::MetricDatum)
      ) : Protocol::Request
        input = Types::PublishMetricsInput.new(environment_name: environment_name, metric_data: metric_data)
        publish_metrics(input)
      end
      def publish_metrics(input : Types::PublishMetricsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates key-value tag pairs to your Amazon Managed Workflows for Apache Airflow (MWAA)
      # environment.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes key-value tag pairs associated to your Amazon Managed Workflows for Apache Airflow (MWAA)
      # environment. For example, "Environment": "Staging" .
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
      def update_environment(
        name : String,
        airflow_configuration_options : Hash(String, String)? = nil,
        airflow_version : String? = nil,
        dag_s3_path : String? = nil,
        environment_class : String? = nil,
        execution_role_arn : String? = nil,
        logging_configuration : Types::LoggingConfigurationInput? = nil,
        max_webservers : Int32? = nil,
        max_workers : Int32? = nil,
        min_webservers : Int32? = nil,
        min_workers : Int32? = nil,
        network_configuration : Types::UpdateNetworkConfigurationInput? = nil,
        plugins_s3_object_version : String? = nil,
        plugins_s3_path : String? = nil,
        requirements_s3_object_version : String? = nil,
        requirements_s3_path : String? = nil,
        schedulers : Int32? = nil,
        source_bucket_arn : String? = nil,
        startup_script_s3_object_version : String? = nil,
        startup_script_s3_path : String? = nil,
        webserver_access_mode : String? = nil,
        weekly_maintenance_window_start : String? = nil,
        worker_replacement_strategy : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentInput.new(name: name, airflow_configuration_options: airflow_configuration_options, airflow_version: airflow_version, dag_s3_path: dag_s3_path, environment_class: environment_class, execution_role_arn: execution_role_arn, logging_configuration: logging_configuration, max_webservers: max_webservers, max_workers: max_workers, min_webservers: min_webservers, min_workers: min_workers, network_configuration: network_configuration, plugins_s3_object_version: plugins_s3_object_version, plugins_s3_path: plugins_s3_path, requirements_s3_object_version: requirements_s3_object_version, requirements_s3_path: requirements_s3_path, schedulers: schedulers, source_bucket_arn: source_bucket_arn, startup_script_s3_object_version: startup_script_s3_object_version, startup_script_s3_path: startup_script_s3_path, webserver_access_mode: webserver_access_mode, weekly_maintenance_window_start: weekly_maintenance_window_start, worker_replacement_strategy: worker_replacement_strategy)
        update_environment(input)
      end
      def update_environment(input : Types::UpdateEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
