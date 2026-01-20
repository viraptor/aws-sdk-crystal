module AwsSdk
  module MigrationHubStrategy
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

      # Retrieves details about an application component.

      def get_application_component_details(
        application_component_id : String
      ) : Protocol::Request
        input = Types::GetApplicationComponentDetailsRequest.new(application_component_id: application_component_id)
        get_application_component_details(input)
      end

      def get_application_component_details(input : Types::GetApplicationComponentDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_COMPONENT_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all the recommended strategies and tools for an application component running on
      # a server.

      def get_application_component_strategies(
        application_component_id : String
      ) : Protocol::Request
        input = Types::GetApplicationComponentStrategiesRequest.new(application_component_id: application_component_id)
        get_application_component_strategies(input)
      end

      def get_application_component_strategies(input : Types::GetApplicationComponentStrategiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_COMPONENT_STRATEGIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of an on-going assessment.

      def get_assessment(
        id : String
      ) : Protocol::Request
        input = Types::GetAssessmentRequest.new(id: id)
        get_assessment(input)
      end

      def get_assessment(input : Types::GetAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details about a specific import task.

      def get_import_file_task(
        id : String
      ) : Protocol::Request
        input = Types::GetImportFileTaskRequest.new(id: id)
        get_import_file_task(input)
      end

      def get_import_file_task(input : Types::GetImportFileTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_FILE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the latest ID of a specific assessment task.

      def get_latest_assessment_id : Protocol::Request
        input = Types::GetLatestAssessmentIdRequest.new
        get_latest_assessment_id(input)
      end

      def get_latest_assessment_id(input : Types::GetLatestAssessmentIdRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LATEST_ASSESSMENT_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves your migration and modernization preferences.

      def get_portfolio_preferences : Protocol::Request
        input = Types::GetPortfolioPreferencesRequest.new
        get_portfolio_preferences(input)
      end

      def get_portfolio_preferences(input : Types::GetPortfolioPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTFOLIO_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves overall summary including the number of servers to rehost and the overall number of
      # anti-patterns.

      def get_portfolio_summary : Protocol::Request
        input = Types::GetPortfolioSummaryRequest.new
        get_portfolio_summary(input)
      end

      def get_portfolio_summary(input : Types::GetPortfolioSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTFOLIO_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about the specified recommendation report.

      def get_recommendation_report_details(
        id : String
      ) : Protocol::Request
        input = Types::GetRecommendationReportDetailsRequest.new(id: id)
        get_recommendation_report_details(input)
      end

      def get_recommendation_report_details(input : Types::GetRecommendationReportDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDATION_REPORT_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specified server.

      def get_server_details(
        server_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetServerDetailsRequest.new(server_id: server_id, max_results: max_results, next_token: next_token)
        get_server_details(input)
      end

      def get_server_details(input : Types::GetServerDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVER_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves recommended strategies and tools for the specified server.

      def get_server_strategies(
        server_id : String
      ) : Protocol::Request
        input = Types::GetServerStrategiesRequest.new(server_id: server_id)
        get_server_strategies(input)
      end

      def get_server_strategies(input : Types::GetServerStrategiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVER_STRATEGIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all the servers fetched from customer vCenter using Strategy Recommendation
      # Collector.

      def list_analyzable_servers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalyzableServersRequest.new(max_results: max_results, next_token: next_token, sort: sort)
        list_analyzable_servers(input)
      end

      def list_analyzable_servers(input : Types::ListAnalyzableServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYZABLE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all the application components (processes).

      def list_application_components(
        application_component_criteria : String? = nil,
        filter_value : String? = nil,
        group_id_filter : Array(Types::Group)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationComponentsRequest.new(application_component_criteria: application_component_criteria, filter_value: filter_value, group_id_filter: group_id_filter, max_results: max_results, next_token: next_token, sort: sort)
        list_application_components(input)
      end

      def list_application_components(input : Types::ListApplicationComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all the installed collectors.

      def list_collectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollectorsRequest.new(max_results: max_results, next_token: next_token)
        list_collectors(input)
      end

      def list_collectors(input : Types::ListCollectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all the imports performed.

      def list_import_file_task(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImportFileTaskRequest.new(max_results: max_results, next_token: next_token)
        list_import_file_task(input)
      end

      def list_import_file_task(input : Types::ListImportFileTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORT_FILE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the servers.

      def list_servers(
        filter_value : String? = nil,
        group_id_filter : Array(Types::Group)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        server_criteria : String? = nil,
        sort : String? = nil
      ) : Protocol::Request
        input = Types::ListServersRequest.new(filter_value: filter_value, group_id_filter: group_id_filter, max_results: max_results, next_token: next_token, server_criteria: server_criteria, sort: sort)
        list_servers(input)
      end

      def list_servers(input : Types::ListServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Saves the specified migration and modernization preferences.

      def put_portfolio_preferences(
        application_mode : String? = nil,
        application_preferences : Types::ApplicationPreferences? = nil,
        database_preferences : Types::DatabasePreferences? = nil,
        prioritize_business_goals : Types::PrioritizeBusinessGoals? = nil
      ) : Protocol::Request
        input = Types::PutPortfolioPreferencesRequest.new(application_mode: application_mode, application_preferences: application_preferences, database_preferences: database_preferences, prioritize_business_goals: prioritize_business_goals)
        put_portfolio_preferences(input)
      end

      def put_portfolio_preferences(input : Types::PutPortfolioPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PORTFOLIO_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the assessment of an on-premises environment.

      def start_assessment(
        assessment_data_source_type : String? = nil,
        assessment_targets : Array(Types::AssessmentTarget)? = nil,
        s3bucket_for_analysis_data : String? = nil,
        s3bucket_for_report_data : String? = nil
      ) : Protocol::Request
        input = Types::StartAssessmentRequest.new(assessment_data_source_type: assessment_data_source_type, assessment_targets: assessment_targets, s3bucket_for_analysis_data: s3bucket_for_analysis_data, s3bucket_for_report_data: s3bucket_for_report_data)
        start_assessment(input)
      end

      def start_assessment(input : Types::StartAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a file import.

      def start_import_file_task(
        s3_bucket : String,
        name : String,
        s3key : String,
        data_source_type : String? = nil,
        group_id : Array(Types::Group)? = nil,
        s3bucket_for_report_data : String? = nil
      ) : Protocol::Request
        input = Types::StartImportFileTaskRequest.new(s3_bucket: s3_bucket, name: name, s3key: s3key, data_source_type: data_source_type, group_id: group_id, s3bucket_for_report_data: s3bucket_for_report_data)
        start_import_file_task(input)
      end

      def start_import_file_task(input : Types::StartImportFileTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT_FILE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts generating a recommendation report.

      def start_recommendation_report_generation(
        group_id_filter : Array(Types::Group)? = nil,
        output_format : String? = nil
      ) : Protocol::Request
        input = Types::StartRecommendationReportGenerationRequest.new(group_id_filter: group_id_filter, output_format: output_format)
        start_recommendation_report_generation(input)
      end

      def start_recommendation_report_generation(input : Types::StartRecommendationReportGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RECOMMENDATION_REPORT_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the assessment of an on-premises environment.

      def stop_assessment(
        assessment_id : String
      ) : Protocol::Request
        input = Types::StopAssessmentRequest.new(assessment_id: assessment_id)
        stop_assessment(input)
      end

      def stop_assessment(input : Types::StopAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an application component.

      def update_application_component_config(
        application_component_id : String,
        app_type : String? = nil,
        configure_only : Bool? = nil,
        inclusion_status : String? = nil,
        secrets_manager_key : String? = nil,
        source_code_list : Array(Types::SourceCode)? = nil,
        strategy_option : Types::StrategyOption? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationComponentConfigRequest.new(application_component_id: application_component_id, app_type: app_type, configure_only: configure_only, inclusion_status: inclusion_status, secrets_manager_key: secrets_manager_key, source_code_list: source_code_list, strategy_option: strategy_option)
        update_application_component_config(input)
      end

      def update_application_component_config(input : Types::UpdateApplicationComponentConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION_COMPONENT_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of the specified server.

      def update_server_config(
        server_id : String,
        strategy_option : Types::StrategyOption? = nil
      ) : Protocol::Request
        input = Types::UpdateServerConfigRequest.new(server_id: server_id, strategy_option: strategy_option)
        update_server_config(input)
      end

      def update_server_config(input : Types::UpdateServerConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
