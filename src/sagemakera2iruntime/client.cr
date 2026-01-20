module Aws
  module SageMakerA2IRuntime
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

      # Deletes the specified human loop for a flow definition. If the human loop was deleted, this
      # operation will return a ResourceNotFoundException .

      def delete_human_loop(
        human_loop_name : String
      ) : Protocol::Request
        input = Types::DeleteHumanLoopRequest.new(human_loop_name: human_loop_name)
        delete_human_loop(input)
      end

      def delete_human_loop(input : Types::DeleteHumanLoopRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_HUMAN_LOOP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified human loop. If the human loop was deleted, this operation
      # will return a ResourceNotFoundException error.

      def describe_human_loop(
        human_loop_name : String
      ) : Protocol::Request
        input = Types::DescribeHumanLoopRequest.new(human_loop_name: human_loop_name)
        describe_human_loop(input)
      end

      def describe_human_loop(input : Types::DescribeHumanLoopRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_HUMAN_LOOP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about human loops, given the specified parameters. If a human loop was deleted,
      # it will not be included.

      def list_human_loops(
        flow_definition_arn : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListHumanLoopsRequest.new(flow_definition_arn: flow_definition_arn, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_human_loops(input)
      end

      def list_human_loops(input : Types::ListHumanLoopsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HUMAN_LOOPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a human loop, provided that at least one activation condition is met.

      def start_human_loop(
        flow_definition_arn : String,
        human_loop_input : Types::HumanLoopInput,
        human_loop_name : String,
        data_attributes : Types::HumanLoopDataAttributes? = nil
      ) : Protocol::Request
        input = Types::StartHumanLoopRequest.new(flow_definition_arn: flow_definition_arn, human_loop_input: human_loop_input, human_loop_name: human_loop_name, data_attributes: data_attributes)
        start_human_loop(input)
      end

      def start_human_loop(input : Types::StartHumanLoopRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_HUMAN_LOOP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the specified human loop.

      def stop_human_loop(
        human_loop_name : String
      ) : Protocol::Request
        input = Types::StopHumanLoopRequest.new(human_loop_name: human_loop_name)
        stop_human_loop(input)
      end

      def stop_human_loop(input : Types::StopHumanLoopRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_HUMAN_LOOP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
