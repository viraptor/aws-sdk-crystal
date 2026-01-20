module Aws
  module IotDeviceAdvisor
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

      # Creates a Device Advisor test suite. Requires permission to access the CreateSuiteDefinition action.

      def create_suite_definition(
        suite_definition_configuration : Types::SuiteDefinitionConfiguration,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSuiteDefinitionRequest.new(suite_definition_configuration: suite_definition_configuration, client_token: client_token, tags: tags)
        create_suite_definition(input)
      end

      def create_suite_definition(input : Types::CreateSuiteDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUITE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Device Advisor test suite. Requires permission to access the DeleteSuiteDefinition action.

      def delete_suite_definition(
        suite_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteSuiteDefinitionRequest.new(suite_definition_id: suite_definition_id)
        delete_suite_definition(input)
      end

      def delete_suite_definition(input : Types::DeleteSuiteDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUITE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an Device Advisor endpoint.

      def get_endpoint(
        authentication_method : String? = nil,
        certificate_arn : String? = nil,
        device_role_arn : String? = nil,
        thing_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetEndpointRequest.new(authentication_method: authentication_method, certificate_arn: certificate_arn, device_role_arn: device_role_arn, thing_arn: thing_arn)
        get_endpoint(input)
      end

      def get_endpoint(input : Types::GetEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Advisor test suite. Requires permission to access the
      # GetSuiteDefinition action.

      def get_suite_definition(
        suite_definition_id : String,
        suite_definition_version : String? = nil
      ) : Protocol::Request
        input = Types::GetSuiteDefinitionRequest.new(suite_definition_id: suite_definition_id, suite_definition_version: suite_definition_version)
        get_suite_definition(input)
      end

      def get_suite_definition(input : Types::GetSuiteDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUITE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Advisor test suite run. Requires permission to access the
      # GetSuiteRun action.

      def get_suite_run(
        suite_definition_id : String,
        suite_run_id : String
      ) : Protocol::Request
        input = Types::GetSuiteRunRequest.new(suite_definition_id: suite_definition_id, suite_run_id: suite_run_id)
        get_suite_run(input)
      end

      def get_suite_run(input : Types::GetSuiteRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUITE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a report download link for a successful Device Advisor qualifying test suite run. Requires
      # permission to access the GetSuiteRunReport action.

      def get_suite_run_report(
        suite_definition_id : String,
        suite_run_id : String
      ) : Protocol::Request
        input = Types::GetSuiteRunReportRequest.new(suite_definition_id: suite_definition_id, suite_run_id: suite_run_id)
        get_suite_run_report(input)
      end

      def get_suite_run_report(input : Types::GetSuiteRunReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUITE_RUN_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Device Advisor test suites you have created. Requires permission to access the
      # ListSuiteDefinitions action.

      def list_suite_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSuiteDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_suite_definitions(input)
      end

      def list_suite_definitions(input : Types::ListSuiteDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUITE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists runs of the specified Device Advisor test suite. You can list all runs of the test suite, or
      # the runs of a specific version of the test suite. Requires permission to access the ListSuiteRuns
      # action.

      def list_suite_runs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        suite_definition_id : String? = nil,
        suite_definition_version : String? = nil
      ) : Protocol::Request
        input = Types::ListSuiteRunsRequest.new(max_results: max_results, next_token: next_token, suite_definition_id: suite_definition_id, suite_definition_version: suite_definition_version)
        list_suite_runs(input)
      end

      def list_suite_runs(input : Types::ListSuiteRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUITE_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags attached to an IoT Device Advisor resource. Requires permission to access the
      # ListTagsForResource action.

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

      # Starts a Device Advisor test suite run. Requires permission to access the StartSuiteRun action.

      def start_suite_run(
        suite_definition_id : String,
        suite_run_configuration : Types::SuiteRunConfiguration,
        suite_definition_version : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartSuiteRunRequest.new(suite_definition_id: suite_definition_id, suite_run_configuration: suite_run_configuration, suite_definition_version: suite_definition_version, tags: tags)
        start_suite_run(input)
      end

      def start_suite_run(input : Types::StartSuiteRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SUITE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a Device Advisor test suite run that is currently running. Requires permission to access the
      # StopSuiteRun action.

      def stop_suite_run(
        suite_definition_id : String,
        suite_run_id : String
      ) : Protocol::Request
        input = Types::StopSuiteRunRequest.new(suite_definition_id: suite_definition_id, suite_run_id: suite_run_id)
        stop_suite_run(input)
      end

      def stop_suite_run(input : Types::StopSuiteRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SUITE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds to and modifies existing tags of an IoT Device Advisor resource. Requires permission to access
      # the TagResource action.

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

      # Removes tags from an IoT Device Advisor resource. Requires permission to access the UntagResource
      # action.

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

      # Updates a Device Advisor test suite. Requires permission to access the UpdateSuiteDefinition action.

      def update_suite_definition(
        suite_definition_configuration : Types::SuiteDefinitionConfiguration,
        suite_definition_id : String
      ) : Protocol::Request
        input = Types::UpdateSuiteDefinitionRequest.new(suite_definition_configuration: suite_definition_configuration, suite_definition_id: suite_definition_id)
        update_suite_definition(input)
      end

      def update_suite_definition(input : Types::UpdateSuiteDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUITE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
