module AwsSdk
  module BedrockDataAutomation
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

      # Copies a Blueprint from one stage to another
      def copy_blueprint_stage(
        blueprint_arn : String,
        source_stage : String,
        target_stage : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CopyBlueprintStageRequest.new(blueprint_arn: blueprint_arn, source_stage: source_stage, target_stage: target_stage, client_token: client_token)
        copy_blueprint_stage(input)
      end
      def copy_blueprint_stage(input : Types::CopyBlueprintStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COPY_BLUEPRINT_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Bedrock Data Automation Blueprint
      def create_blueprint(
        blueprint_name : String,
        schema : String,
        type : String,
        blueprint_stage : String? = nil,
        client_token : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateBlueprintRequest.new(blueprint_name: blueprint_name, schema: schema, type: type, blueprint_stage: blueprint_stage, client_token: client_token, encryption_configuration: encryption_configuration, tags: tags)
        create_blueprint(input)
      end
      def create_blueprint(input : Types::CreateBlueprintRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of an existing Amazon Bedrock Data Automation Blueprint
      def create_blueprint_version(
        blueprint_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateBlueprintVersionRequest.new(blueprint_arn: blueprint_arn, client_token: client_token)
        create_blueprint_version(input)
      end
      def create_blueprint_version(input : Types::CreateBlueprintVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BLUEPRINT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Bedrock Data Automation Project
      def create_data_automation_project(
        project_name : String,
        standard_output_configuration : Types::StandardOutputConfiguration,
        client_token : String? = nil,
        custom_output_configuration : Types::CustomOutputConfiguration? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        override_configuration : Types::OverrideConfiguration? = nil,
        project_description : String? = nil,
        project_stage : String? = nil,
        project_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDataAutomationProjectRequest.new(project_name: project_name, standard_output_configuration: standard_output_configuration, client_token: client_token, custom_output_configuration: custom_output_configuration, encryption_configuration: encryption_configuration, override_configuration: override_configuration, project_description: project_description, project_stage: project_stage, project_type: project_type, tags: tags)
        create_data_automation_project(input)
      end
      def create_data_automation_project(input : Types::CreateDataAutomationProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_AUTOMATION_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Amazon Bedrock Data Automation Blueprint
      def delete_blueprint(
        blueprint_arn : String,
        blueprint_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteBlueprintRequest.new(blueprint_arn: blueprint_arn, blueprint_version: blueprint_version)
        delete_blueprint(input)
      end
      def delete_blueprint(input : Types::DeleteBlueprintRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Amazon Bedrock Data Automation Project
      def delete_data_automation_project(
        project_arn : String
      ) : Protocol::Request
        input = Types::DeleteDataAutomationProjectRequest.new(project_arn: project_arn)
        delete_data_automation_project(input)
      end
      def delete_data_automation_project(input : Types::DeleteDataAutomationProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_AUTOMATION_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an existing Amazon Bedrock Data Automation Blueprint
      def get_blueprint(
        blueprint_arn : String,
        blueprint_stage : String? = nil,
        blueprint_version : String? = nil
      ) : Protocol::Request
        input = Types::GetBlueprintRequest.new(blueprint_arn: blueprint_arn, blueprint_stage: blueprint_stage, blueprint_version: blueprint_version)
        get_blueprint(input)
      end
      def get_blueprint(input : Types::GetBlueprintRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # API used to get blueprint optimization status.
      def get_blueprint_optimization_status(
        invocation_arn : String
      ) : Protocol::Request
        input = Types::GetBlueprintOptimizationStatusRequest.new(invocation_arn: invocation_arn)
        get_blueprint_optimization_status(input)
      end
      def get_blueprint_optimization_status(input : Types::GetBlueprintOptimizationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BLUEPRINT_OPTIMIZATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an existing Amazon Bedrock Data Automation Project
      def get_data_automation_project(
        project_arn : String,
        project_stage : String? = nil
      ) : Protocol::Request
        input = Types::GetDataAutomationProjectRequest.new(project_arn: project_arn, project_stage: project_stage)
        get_data_automation_project(input)
      end
      def get_data_automation_project(input : Types::GetDataAutomationProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_AUTOMATION_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invoke an async job to perform Blueprint Optimization
      def invoke_blueprint_optimization_async(
        blueprint : Types::BlueprintOptimizationObject,
        data_automation_profile_arn : String,
        output_configuration : Types::BlueprintOptimizationOutputConfiguration,
        samples : Array(Types::BlueprintOptimizationSample),
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::InvokeBlueprintOptimizationAsyncRequest.new(blueprint: blueprint, data_automation_profile_arn: data_automation_profile_arn, output_configuration: output_configuration, samples: samples, encryption_configuration: encryption_configuration, tags: tags)
        invoke_blueprint_optimization_async(input)
      end
      def invoke_blueprint_optimization_async(input : Types::InvokeBlueprintOptimizationAsyncRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_BLUEPRINT_OPTIMIZATION_ASYNC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all existing Amazon Bedrock Data Automation Blueprints
      def list_blueprints(
        blueprint_arn : String? = nil,
        blueprint_stage_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_filter : Types::DataAutomationProjectFilter? = nil,
        resource_owner : String? = nil
      ) : Protocol::Request
        input = Types::ListBlueprintsRequest.new(blueprint_arn: blueprint_arn, blueprint_stage_filter: blueprint_stage_filter, max_results: max_results, next_token: next_token, project_filter: project_filter, resource_owner: resource_owner)
        list_blueprints(input)
      end
      def list_blueprints(input : Types::ListBlueprintsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BLUEPRINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all existing Amazon Bedrock Data Automation Projects
      def list_data_automation_projects(
        blueprint_filter : Types::BlueprintFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_stage_filter : String? = nil,
        resource_owner : String? = nil
      ) : Protocol::Request
        input = Types::ListDataAutomationProjectsRequest.new(blueprint_filter: blueprint_filter, max_results: max_results, next_token: next_token, project_stage_filter: project_stage_filter, resource_owner: resource_owner)
        list_data_automation_projects(input)
      end
      def list_data_automation_projects(input : Types::ListDataAutomationProjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_AUTOMATION_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List tags for an Amazon Bedrock Data Automation resource
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

      # Tag an Amazon Bedrock Data Automation resource
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Untag an Amazon Bedrock Data Automation resource
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

      # Updates an existing Amazon Bedrock Data Automation Blueprint
      def update_blueprint(
        blueprint_arn : String,
        schema : String,
        blueprint_stage : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateBlueprintRequest.new(blueprint_arn: blueprint_arn, schema: schema, blueprint_stage: blueprint_stage, encryption_configuration: encryption_configuration)
        update_blueprint(input)
      end
      def update_blueprint(input : Types::UpdateBlueprintRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Amazon Bedrock Data Automation Project
      def update_data_automation_project(
        project_arn : String,
        standard_output_configuration : Types::StandardOutputConfiguration,
        custom_output_configuration : Types::CustomOutputConfiguration? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        override_configuration : Types::OverrideConfiguration? = nil,
        project_description : String? = nil,
        project_stage : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataAutomationProjectRequest.new(project_arn: project_arn, standard_output_configuration: standard_output_configuration, custom_output_configuration: custom_output_configuration, encryption_configuration: encryption_configuration, override_configuration: override_configuration, project_description: project_description, project_stage: project_stage)
        update_data_automation_project(input)
      end
      def update_data_automation_project(input : Types::UpdateDataAutomationProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_AUTOMATION_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
