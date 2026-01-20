module AwsSdk
  module KendraRanking
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a rescore execution plan. A rescore execution plan is an Amazon Kendra Intelligent Ranking
      # resource used for provisioning the Rescore API. You set the number of capacity units that you
      # require for Amazon Kendra Intelligent Ranking to rescore or re-rank a search service's results. For
      # an example of using the CreateRescoreExecutionPlan API, including using the Python and Java SDKs,
      # see Semantically ranking a search service's results .

      def create_rescore_execution_plan(
        name : String,
        capacity_units : Types::CapacityUnitsConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRescoreExecutionPlanResponse

        input = Types::CreateRescoreExecutionPlanRequest.new(name: name, capacity_units: capacity_units, client_token: client_token, description: description, tags: tags)
        create_rescore_execution_plan(input)
      end

      def create_rescore_execution_plan(input : Types::CreateRescoreExecutionPlanRequest) : Types::CreateRescoreExecutionPlanResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESCORE_EXECUTION_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRescoreExecutionPlanResponse, "CreateRescoreExecutionPlan")
      end

      # Deletes a rescore execution plan. A rescore execution plan is an Amazon Kendra Intelligent Ranking
      # resource used for provisioning the Rescore API.

      def delete_rescore_execution_plan(
        id : String
      ) : Nil

        input = Types::DeleteRescoreExecutionPlanRequest.new(id: id)
        delete_rescore_execution_plan(input)
      end

      def delete_rescore_execution_plan(input : Types::DeleteRescoreExecutionPlanRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESCORE_EXECUTION_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets information about a rescore execution plan. A rescore execution plan is an Amazon Kendra
      # Intelligent Ranking resource used for provisioning the Rescore API.

      def describe_rescore_execution_plan(
        id : String
      ) : Types::DescribeRescoreExecutionPlanResponse

        input = Types::DescribeRescoreExecutionPlanRequest.new(id: id)
        describe_rescore_execution_plan(input)
      end

      def describe_rescore_execution_plan(input : Types::DescribeRescoreExecutionPlanRequest) : Types::DescribeRescoreExecutionPlanResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESCORE_EXECUTION_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRescoreExecutionPlanResponse, "DescribeRescoreExecutionPlan")
      end

      # Lists your rescore execution plans. A rescore execution plan is an Amazon Kendra Intelligent Ranking
      # resource used for provisioning the Rescore API.

      def list_rescore_execution_plans(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRescoreExecutionPlansResponse

        input = Types::ListRescoreExecutionPlansRequest.new(max_results: max_results, next_token: next_token)
        list_rescore_execution_plans(input)
      end

      def list_rescore_execution_plans(input : Types::ListRescoreExecutionPlansRequest) : Types::ListRescoreExecutionPlansResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESCORE_EXECUTION_PLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRescoreExecutionPlansResponse, "ListRescoreExecutionPlans")
      end

      # Gets a list of tags associated with a specified resource. A rescore execution plan is an example of
      # a resource that can have tags associated with it.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Rescores or re-ranks search results from a search service such as OpenSearch (self managed). You use
      # the semantic search capabilities of Amazon Kendra Intelligent Ranking to improve the search
      # service's results.

      def rescore(
        documents : Array(Types::Document),
        rescore_execution_plan_id : String,
        search_query : String
      ) : Types::RescoreResult

        input = Types::RescoreRequest.new(documents: documents, rescore_execution_plan_id: rescore_execution_plan_id, search_query: search_query)
        rescore(input)
      end

      def rescore(input : Types::RescoreRequest) : Types::RescoreResult
        request = Protocol::JsonRpc.build_request(Model::RESCORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RescoreResult, "Rescore")
      end

      # Adds a specified tag to a specified rescore execution plan. A rescore execution plan is an Amazon
      # Kendra Intelligent Ranking resource used for provisioning the Rescore API. If the tag already
      # exists, the existing value is replaced with the new value.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes a tag from a rescore execution plan. A rescore execution plan is an Amazon Kendra
      # Intelligent Ranking resource used for provisioning the Rescore operation.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates a rescore execution plan. A rescore execution plan is an Amazon Kendra Intelligent Ranking
      # resource used for provisioning the Rescore API. You can update the number of capacity units you
      # require for Amazon Kendra Intelligent Ranking to rescore or re-rank a search service's results.

      def update_rescore_execution_plan(
        id : String,
        capacity_units : Types::CapacityUnitsConfiguration? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Nil

        input = Types::UpdateRescoreExecutionPlanRequest.new(id: id, capacity_units: capacity_units, description: description, name: name)
        update_rescore_execution_plan(input)
      end

      def update_rescore_execution_plan(input : Types::UpdateRescoreExecutionPlanRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESCORE_EXECUTION_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
