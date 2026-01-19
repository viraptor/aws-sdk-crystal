module AwsSdk
  module OSIS
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

      # Creates an OpenSearch Ingestion pipeline. For more information, see Creating Amazon OpenSearch
      # Ingestion pipelines .
      def create_pipeline(
        max_units : Int32,
        min_units : Int32,
        pipeline_configuration_body : String,
        pipeline_name : String,
        buffer_options : Types::BufferOptions? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        log_publishing_options : Types::LogPublishingOptions? = nil,
        pipeline_role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_options : Types::VpcOptions? = nil
      ) : Protocol::Request
        input = Types::CreatePipelineRequest.new(max_units: max_units, min_units: min_units, pipeline_configuration_body: pipeline_configuration_body, pipeline_name: pipeline_name, buffer_options: buffer_options, encryption_at_rest_options: encryption_at_rest_options, log_publishing_options: log_publishing_options, pipeline_role_arn: pipeline_role_arn, tags: tags, vpc_options: vpc_options)
        create_pipeline(input)
      end
      def create_pipeline(input : Types::CreatePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a VPC endpoint for an OpenSearch Ingestion pipeline. Pipeline endpoints allow you to ingest
      # data from your VPC into pipelines that you have access to.
      def create_pipeline_endpoint(
        pipeline_arn : String,
        vpc_options : Types::PipelineEndpointVpcOptions
      ) : Protocol::Request
        input = Types::CreatePipelineEndpointRequest.new(pipeline_arn: pipeline_arn, vpc_options: vpc_options)
        create_pipeline_endpoint(input)
      end
      def create_pipeline_endpoint(input : Types::CreatePipelineEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PIPELINE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an OpenSearch Ingestion pipeline. For more information, see Deleting Amazon OpenSearch
      # Ingestion pipelines .
      def delete_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::DeletePipelineRequest.new(pipeline_name: pipeline_name)
        delete_pipeline(input)
      end
      def delete_pipeline(input : Types::DeletePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a VPC endpoint for an OpenSearch Ingestion pipeline.
      def delete_pipeline_endpoint(
        endpoint_id : String
      ) : Protocol::Request
        input = Types::DeletePipelineEndpointRequest.new(endpoint_id: endpoint_id)
        delete_pipeline_endpoint(input)
      end
      def delete_pipeline_endpoint(input : Types::DeletePipelineEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PIPELINE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource-based policy from an OpenSearch Ingestion resource.
      def delete_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an OpenSearch Ingestion pipeline.
      def get_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::GetPipelineRequest.new(pipeline_name: pipeline_name)
        get_pipeline(input)
      end
      def get_pipeline(input : Types::GetPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific blueprint for OpenSearch Ingestion. Blueprints are templates
      # for the configuration needed for a CreatePipeline request. For more information, see Using
      # blueprints to create a pipeline .
      def get_pipeline_blueprint(
        blueprint_name : String,
        format : String? = nil
      ) : Protocol::Request
        input = Types::GetPipelineBlueprintRequest.new(blueprint_name: blueprint_name, format: format)
        get_pipeline_blueprint(input)
      end
      def get_pipeline_blueprint(input : Types::GetPipelineBlueprintRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PIPELINE_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns progress information for the current change happening on an OpenSearch Ingestion pipeline.
      # Currently, this operation only returns information when a pipeline is being created. For more
      # information, see Tracking the status of pipeline creation .
      def get_pipeline_change_progress(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::GetPipelineChangeProgressRequest.new(pipeline_name: pipeline_name)
        get_pipeline_change_progress(input)
      end
      def get_pipeline_change_progress(input : Types::GetPipelineChangeProgressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PIPELINE_CHANGE_PROGRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource-based policy attached to an OpenSearch Ingestion resource.
      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end
      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all available blueprints for Data Prepper. For more information, see Using
      # blueprints to create a pipeline .
      def list_pipeline_blueprints : Protocol::Request
        input = Types::ListPipelineBlueprintsRequest.new
        list_pipeline_blueprints(input)
      end
      def list_pipeline_blueprints(input : Types::ListPipelineBlueprintsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPELINE_BLUEPRINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the pipeline endpoints connected to pipelines in your account.
      def list_pipeline_endpoint_connections(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPipelineEndpointConnectionsRequest.new(max_results: max_results, next_token: next_token)
        list_pipeline_endpoint_connections(input)
      end
      def list_pipeline_endpoint_connections(input : Types::ListPipelineEndpointConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPELINE_ENDPOINT_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all pipeline endpoints in your account.
      def list_pipeline_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPipelineEndpointsRequest.new(max_results: max_results, next_token: next_token)
        list_pipeline_endpoints(input)
      end
      def list_pipeline_endpoints(input : Types::ListPipelineEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPELINE_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all OpenSearch Ingestion pipelines in the current Amazon Web Services account and Region. For
      # more information, see Viewing Amazon OpenSearch Ingestion pipelines .
      def list_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPipelinesRequest.new(max_results: max_results, next_token: next_token)
        list_pipelines(input)
      end
      def list_pipelines(input : Types::ListPipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all resource tags associated with an OpenSearch Ingestion pipeline. For more information, see
      # Tagging Amazon OpenSearch Ingestion pipelines .
      def list_tags_for_resource(
        arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(arn: arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a resource-based policy to an OpenSearch Ingestion resource. Resource-based policies grant
      # permissions to principals to perform actions on the resource.
      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes pipeline endpoints from specified endpoint IDs.
      def revoke_pipeline_endpoint_connections(
        endpoint_ids : Array(String),
        pipeline_arn : String
      ) : Protocol::Request
        input = Types::RevokePipelineEndpointConnectionsRequest.new(endpoint_ids: endpoint_ids, pipeline_arn: pipeline_arn)
        revoke_pipeline_endpoint_connections(input)
      end
      def revoke_pipeline_endpoint_connections(input : Types::RevokePipelineEndpointConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_PIPELINE_ENDPOINT_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an OpenSearch Ingestion pipeline. For more information, see Starting an OpenSearch Ingestion
      # pipeline .
      def start_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::StartPipelineRequest.new(pipeline_name: pipeline_name)
        start_pipeline(input)
      end
      def start_pipeline(input : Types::StartPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an OpenSearch Ingestion pipeline. For more information, see Stopping an OpenSearch Ingestion
      # pipeline .
      def stop_pipeline(
        pipeline_name : String
      ) : Protocol::Request
        input = Types::StopPipelineRequest.new(pipeline_name: pipeline_name)
        stop_pipeline(input)
      end
      def stop_pipeline(input : Types::StopPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags an OpenSearch Ingestion pipeline. For more information, see Tagging Amazon OpenSearch Ingestion
      # pipelines .
      def tag_resource(
        arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from an OpenSearch Ingestion pipeline. For more information, see Tagging
      # Amazon OpenSearch Ingestion pipelines .
      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an OpenSearch Ingestion pipeline. For more information, see Updating Amazon OpenSearch
      # Ingestion pipelines .
      def update_pipeline(
        pipeline_name : String,
        buffer_options : Types::BufferOptions? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        log_publishing_options : Types::LogPublishingOptions? = nil,
        max_units : Int32? = nil,
        min_units : Int32? = nil,
        pipeline_configuration_body : String? = nil,
        pipeline_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePipelineRequest.new(pipeline_name: pipeline_name, buffer_options: buffer_options, encryption_at_rest_options: encryption_at_rest_options, log_publishing_options: log_publishing_options, max_units: max_units, min_units: min_units, pipeline_configuration_body: pipeline_configuration_body, pipeline_role_arn: pipeline_role_arn)
        update_pipeline(input)
      end
      def update_pipeline(input : Types::UpdatePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks whether an OpenSearch Ingestion pipeline configuration is valid prior to creation. For more
      # information, see Creating Amazon OpenSearch Ingestion pipelines .
      def validate_pipeline(
        pipeline_configuration_body : String
      ) : Protocol::Request
        input = Types::ValidatePipelineRequest.new(pipeline_configuration_body: pipeline_configuration_body)
        validate_pipeline(input)
      end
      def validate_pipeline(input : Types::ValidatePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
