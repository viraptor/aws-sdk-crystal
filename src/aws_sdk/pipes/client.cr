module AwsSdk
  module Pipes
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

      # Create a pipe. Amazon EventBridge Pipes connect event sources to targets and reduces the need for
      # specialized knowledge and integration code.

      def create_pipe(
        name : String,
        role_arn : String,
        source : String,
        target : String,
        description : String? = nil,
        desired_state : String? = nil,
        enrichment : String? = nil,
        enrichment_parameters : Types::PipeEnrichmentParameters? = nil,
        kms_key_identifier : String? = nil,
        log_configuration : Types::PipeLogConfigurationParameters? = nil,
        source_parameters : Types::PipeSourceParameters? = nil,
        tags : Hash(String, String)? = nil,
        target_parameters : Types::PipeTargetParameters? = nil
      ) : Protocol::Request
        input = Types::CreatePipeRequest.new(name: name, role_arn: role_arn, source: source, target: target, description: description, desired_state: desired_state, enrichment: enrichment, enrichment_parameters: enrichment_parameters, kms_key_identifier: kms_key_identifier, log_configuration: log_configuration, source_parameters: source_parameters, tags: tags, target_parameters: target_parameters)
        create_pipe(input)
      end

      def create_pipe(input : Types::CreatePipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing pipe. For more information about pipes, see Amazon EventBridge Pipes in the
      # Amazon EventBridge User Guide.

      def delete_pipe(
        name : String
      ) : Protocol::Request
        input = Types::DeletePipeRequest.new(name: name)
        delete_pipe(input)
      end

      def delete_pipe(input : Types::DeletePipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the information about an existing pipe. For more information about pipes, see Amazon EventBridge
      # Pipes in the Amazon EventBridge User Guide.

      def describe_pipe(
        name : String
      ) : Protocol::Request
        input = Types::DescribePipeRequest.new(name: name)
        describe_pipe(input)
      end

      def describe_pipe(input : Types::DescribePipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the pipes associated with this account. For more information about pipes, see Amazon EventBridge
      # Pipes in the Amazon EventBridge User Guide.

      def list_pipes(
        current_state : String? = nil,
        desired_state : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil,
        source_prefix : String? = nil,
        target_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListPipesRequest.new(current_state: current_state, desired_state: desired_state, limit: limit, name_prefix: name_prefix, next_token: next_token, source_prefix: source_prefix, target_prefix: target_prefix)
        list_pipes(input)
      end

      def list_pipes(input : Types::ListPipesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a pipe.

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

      # Start an existing pipe.

      def start_pipe(
        name : String
      ) : Protocol::Request
        input = Types::StartPipeRequest.new(name: name)
        start_pipe(input)
      end

      def start_pipe(input : Types::StartPipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop an existing pipe.

      def stop_pipe(
        name : String
      ) : Protocol::Request
        input = Types::StopPipeRequest.new(name: name)
        stop_pipe(input)
      end

      def stop_pipe(input : Types::StopPipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified pipe. Tags can help you organize and
      # categorize your resources. You can also use them to scope user permissions by granting a user
      # permission to access or change only resources with certain tag values. Tags don't have any semantic
      # meaning to Amazon Web Services and are interpreted strictly as strings of characters. You can use
      # the TagResource action with a pipe that already has tags. If you specify a new tag key, this tag is
      # appended to the list of tags associated with the pipe. If you specify a tag key that is already
      # associated with the pipe, the new tag value that you specify replaces the previous value for that
      # tag. You can associate as many as 50 tags with a pipe.

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

      # Removes one or more tags from the specified pipes.

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

      # Update an existing pipe. When you call UpdatePipe , EventBridge only the updates fields you have
      # specified in the request; the rest remain unchanged. The exception to this is if you modify any
      # Amazon Web Services-service specific fields in the SourceParameters , EnrichmentParameters , or
      # TargetParameters objects. For example, DynamoDBStreamParameters or EventBridgeEventBusParameters .
      # EventBridge updates the fields in these objects atomically as one and overrides existing values.
      # This is by design, and means that if you don't specify an optional field in one of these Parameters
      # objects, EventBridge sets that field to its system-default value during the update. For more
      # information about pipes, see Amazon EventBridge Pipes in the Amazon EventBridge User Guide.

      def update_pipe(
        name : String,
        role_arn : String,
        description : String? = nil,
        desired_state : String? = nil,
        enrichment : String? = nil,
        enrichment_parameters : Types::PipeEnrichmentParameters? = nil,
        kms_key_identifier : String? = nil,
        log_configuration : Types::PipeLogConfigurationParameters? = nil,
        source_parameters : Types::UpdatePipeSourceParameters? = nil,
        target : String? = nil,
        target_parameters : Types::PipeTargetParameters? = nil
      ) : Protocol::Request
        input = Types::UpdatePipeRequest.new(name: name, role_arn: role_arn, description: description, desired_state: desired_state, enrichment: enrichment, enrichment_parameters: enrichment_parameters, kms_key_identifier: kms_key_identifier, log_configuration: log_configuration, source_parameters: source_parameters, target: target, target_parameters: target_parameters)
        update_pipe(input)
      end

      def update_pipe(input : Types::UpdatePipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
