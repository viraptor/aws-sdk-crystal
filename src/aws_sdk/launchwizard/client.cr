module AwsSdk
  module LaunchWizard
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

      # Creates a deployment for the given workload. Deployments created by this operation are not available
      # in the Launch Wizard console to use the Clone deployment action on.

      def create_deployment(
        deployment_pattern_name : String,
        name : String,
        specifications : Hash(String, String),
        workload_name : String,
        dry_run : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentInput.new(deployment_pattern_name: deployment_pattern_name, name: name, specifications: specifications, workload_name: workload_name, dry_run: dry_run, tags: tags)
        create_deployment(input)
      end

      def create_deployment(input : Types::CreateDeploymentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a deployment.

      def delete_deployment(
        deployment_id : String
      ) : Protocol::Request
        input = Types::DeleteDeploymentInput.new(deployment_id: deployment_id)
        delete_deployment(input)
      end

      def delete_deployment(input : Types::DeleteDeploymentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the deployment.

      def get_deployment(
        deployment_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentInput.new(deployment_id: deployment_id)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a deployment pattern version.

      def get_deployment_pattern_version(
        deployment_pattern_name : String,
        deployment_pattern_version_name : String,
        workload_name : String
      ) : Protocol::Request
        input = Types::GetDeploymentPatternVersionInput.new(deployment_pattern_name: deployment_pattern_name, deployment_pattern_version_name: deployment_pattern_version_name, workload_name: workload_name)
        get_deployment_pattern_version(input)
      end

      def get_deployment_pattern_version(input : Types::GetDeploymentPatternVersionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT_PATTERN_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a workload.

      def get_workload(
        workload_name : String
      ) : Protocol::Request
        input = Types::GetWorkloadInput.new(workload_name: workload_name)
        get_workload(input)
      end

      def get_workload(input : Types::GetWorkloadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for a given workload and deployment pattern, including the available specifications.
      # You can use the ListWorkloads operation to discover the available workload names and the
      # ListWorkloadDeploymentPatterns operation to discover the available deployment pattern names of a
      # given workload.

      def get_workload_deployment_pattern(
        deployment_pattern_name : String,
        workload_name : String
      ) : Protocol::Request
        input = Types::GetWorkloadDeploymentPatternInput.new(deployment_pattern_name: deployment_pattern_name, workload_name: workload_name)
        get_workload_deployment_pattern(input)
      end

      def get_workload_deployment_pattern(input : Types::GetWorkloadDeploymentPatternInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD_DEPLOYMENT_PATTERN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the events of a deployment.

      def list_deployment_events(
        deployment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentEventsInput.new(deployment_id: deployment_id, max_results: max_results, next_token: next_token)
        list_deployment_events(input)
      end

      def list_deployment_events(input : Types::ListDeploymentEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the deployment pattern versions.

      def list_deployment_pattern_versions(
        deployment_pattern_name : String,
        workload_name : String,
        filters : Array(Types::DeploymentPatternVersionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentPatternVersionsInput.new(deployment_pattern_name: deployment_pattern_name, workload_name: workload_name, filters: filters, max_results: max_results, next_token: next_token)
        list_deployment_pattern_versions(input)
      end

      def list_deployment_pattern_versions(input : Types::ListDeploymentPatternVersionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENT_PATTERN_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the deployments that have been created.

      def list_deployments(
        filters : Array(Types::DeploymentFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentsInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_deployments(input)
      end

      def list_deployments(input : Types::ListDeploymentsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with a specified resource.

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

      # Lists the workload deployment patterns for a given workload name. You can use the ListWorkloads
      # operation to discover the available workload names.

      def list_workload_deployment_patterns(
        workload_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkloadDeploymentPatternsInput.new(workload_name: workload_name, max_results: max_results, next_token: next_token)
        list_workload_deployment_patterns(input)
      end

      def list_workload_deployment_patterns(input : Types::ListWorkloadDeploymentPatternsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKLOAD_DEPLOYMENT_PATTERNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available workload names. You can use the ListWorkloadDeploymentPatterns operation to
      # discover the available deployment patterns for a given workload.

      def list_workloads(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkloadsInput.new(max_results: max_results, next_token: next_token)
        list_workloads(input)
      end

      def list_workloads(input : Types::ListWorkloadsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKLOADS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the given resource.

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

      # Removes the specified tags from the given resource.

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

      # Updates a deployment.

      def update_deployment(
        deployment_id : String,
        specifications : Hash(String, String),
        deployment_pattern_version_name : String? = nil,
        dry_run : Bool? = nil,
        force : Bool? = nil,
        workload_version_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeploymentInput.new(deployment_id: deployment_id, specifications: specifications, deployment_pattern_version_name: deployment_pattern_version_name, dry_run: dry_run, force: force, workload_version_name: workload_version_name)
        update_deployment(input)
      end

      def update_deployment(input : Types::UpdateDeploymentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
