module Aws
  module EntityResolution
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

      # Adds a policy statement object. To retrieve a list of existing policy statements, use the GetPolicy
      # API.

      def add_policy_statement(
        action : Array(String),
        arn : String,
        effect : String,
        principal : Array(String),
        statement_id : String,
        condition : String? = nil
      ) : Protocol::Request
        input = Types::AddPolicyStatementInput.new(action: action, arn: arn, effect: effect, principal: principal, statement_id: statement_id, condition: condition)
        add_policy_statement(input)
      end

      def add_policy_statement(input : Types::AddPolicyStatementInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_POLICY_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes multiple unique IDs in a matching workflow.

      def batch_delete_unique_id(
        unique_ids : Array(String),
        workflow_name : String,
        input_source : String? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteUniqueIdInput.new(unique_ids: unique_ids, workflow_name: workflow_name, input_source: input_source)
        batch_delete_unique_id(input)
      end

      def batch_delete_unique_id(input : Types::BatchDeleteUniqueIdInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_UNIQUE_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IdMappingWorkflow object which stores the configuration of the data processing job to be
      # run. Each IdMappingWorkflow must have a unique workflow name. To modify an existing workflow, use
      # the UpdateIdMappingWorkflow API. Incremental processing is not supported for ID mapping workflows.

      def create_id_mapping_workflow(
        id_mapping_techniques : Types::IdMappingTechniques,
        input_source_config : Array(Types::IdMappingWorkflowInputSource),
        workflow_name : String,
        description : String? = nil,
        incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
        output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIdMappingWorkflowInput.new(id_mapping_techniques: id_mapping_techniques, input_source_config: input_source_config, workflow_name: workflow_name, description: description, incremental_run_config: incremental_run_config, output_source_config: output_source_config, role_arn: role_arn, tags: tags)
        create_id_mapping_workflow(input)
      end

      def create_id_mapping_workflow(input : Types::CreateIdMappingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ID_MAPPING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an ID namespace object which will help customers provide metadata explaining their dataset
      # and how to use it. Each ID namespace must have a unique name. To modify an existing ID namespace,
      # use the UpdateIdNamespace API.

      def create_id_namespace(
        id_namespace_name : String,
        type : String,
        description : String? = nil,
        id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
        input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIdNamespaceInput.new(id_namespace_name: id_namespace_name, type: type, description: description, id_mapping_workflow_properties: id_mapping_workflow_properties, input_source_config: input_source_config, role_arn: role_arn, tags: tags)
        create_id_namespace(input)
      end

      def create_id_namespace(input : Types::CreateIdNamespaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ID_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a matching workflow that defines the configuration for a data processing job. The workflow
      # name must be unique. To modify an existing workflow, use UpdateMatchingWorkflow . For workflows
      # where resolutionType is ML_MATCHING or PROVIDER , incremental processing is not supported.

      def create_matching_workflow(
        input_source_config : Array(Types::InputSource),
        output_source_config : Array(Types::OutputSource),
        resolution_techniques : Types::ResolutionTechniques,
        role_arn : String,
        workflow_name : String,
        description : String? = nil,
        incremental_run_config : Types::IncrementalRunConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMatchingWorkflowInput.new(input_source_config: input_source_config, output_source_config: output_source_config, resolution_techniques: resolution_techniques, role_arn: role_arn, workflow_name: workflow_name, description: description, incremental_run_config: incremental_run_config, tags: tags)
        create_matching_workflow(input)
      end

      def create_matching_workflow(input : Types::CreateMatchingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MATCHING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a schema mapping, which defines the schema of the input customer records table. The
      # SchemaMapping also provides Entity Resolution with some metadata about the table, such as the
      # attribute types of the columns and which columns to match on.

      def create_schema_mapping(
        mapped_input_fields : Array(Types::SchemaInputAttribute),
        schema_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSchemaMappingInput.new(mapped_input_fields: mapped_input_fields, schema_name: schema_name, description: description, tags: tags)
        create_schema_mapping(input)
      end

      def create_schema_mapping(input : Types::CreateSchemaMappingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEMA_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the IdMappingWorkflow with a given name. This operation will succeed even if a workflow with
      # the given name does not exist.

      def delete_id_mapping_workflow(
        workflow_name : String
      ) : Protocol::Request
        input = Types::DeleteIdMappingWorkflowInput.new(workflow_name: workflow_name)
        delete_id_mapping_workflow(input)
      end

      def delete_id_mapping_workflow(input : Types::DeleteIdMappingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ID_MAPPING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the IdNamespace with a given name.

      def delete_id_namespace(
        id_namespace_name : String
      ) : Protocol::Request
        input = Types::DeleteIdNamespaceInput.new(id_namespace_name: id_namespace_name)
        delete_id_namespace(input)
      end

      def delete_id_namespace(input : Types::DeleteIdNamespaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ID_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the MatchingWorkflow with a given name. This operation will succeed even if a workflow with
      # the given name does not exist.

      def delete_matching_workflow(
        workflow_name : String
      ) : Protocol::Request
        input = Types::DeleteMatchingWorkflowInput.new(workflow_name: workflow_name)
        delete_matching_workflow(input)
      end

      def delete_matching_workflow(input : Types::DeleteMatchingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MATCHING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the policy statement.

      def delete_policy_statement(
        arn : String,
        statement_id : String
      ) : Protocol::Request
        input = Types::DeletePolicyStatementInput.new(arn: arn, statement_id: statement_id)
        delete_policy_statement(input)
      end

      def delete_policy_statement(input : Types::DeletePolicyStatementInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the SchemaMapping with a given name. This operation will succeed even if a schema with the
      # given name does not exist. This operation will fail if there is a MatchingWorkflow object that
      # references the SchemaMapping in the workflow's InputSourceConfig .

      def delete_schema_mapping(
        schema_name : String
      ) : Protocol::Request
        input = Types::DeleteSchemaMappingInput.new(schema_name: schema_name)
        delete_schema_mapping(input)
      end

      def delete_schema_mapping(input : Types::DeleteSchemaMappingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEMA_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates or retrieves Match IDs for records using a rule-based matching workflow. When you call
      # this operation, it processes your records against the workflow's matching rules to identify
      # potential matches. For existing records, it retrieves their Match IDs and associated rules. For
      # records without matches, it generates new Match IDs. The operation saves results to Amazon S3. The
      # processing type ( processingType ) you choose affects both the accuracy and response time of the
      # operation. Additional charges apply for each API call, whether made through the Entity Resolution
      # console or directly via the API. The rule-based matching workflow must exist and be active before
      # calling this operation.

      def generate_match_id(
        records : Array(Types::Record),
        workflow_name : String,
        processing_type : String? = nil
      ) : Protocol::Request
        input = Types::GenerateMatchIdInput.new(records: records, workflow_name: workflow_name, processing_type: processing_type)
        generate_match_id(input)
      end

      def generate_match_id(input : Types::GenerateMatchIdInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_MATCH_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status, metrics, and errors (if there are any) that are associated with a job.

      def get_id_mapping_job(
        job_id : String,
        workflow_name : String
      ) : Protocol::Request
        input = Types::GetIdMappingJobInput.new(job_id: job_id, workflow_name: workflow_name)
        get_id_mapping_job(input)
      end

      def get_id_mapping_job(input : Types::GetIdMappingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ID_MAPPING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the IdMappingWorkflow with a given name, if it exists.

      def get_id_mapping_workflow(
        workflow_name : String
      ) : Protocol::Request
        input = Types::GetIdMappingWorkflowInput.new(workflow_name: workflow_name)
        get_id_mapping_workflow(input)
      end

      def get_id_mapping_workflow(input : Types::GetIdMappingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ID_MAPPING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the IdNamespace with a given name, if it exists.

      def get_id_namespace(
        id_namespace_name : String
      ) : Protocol::Request
        input = Types::GetIdNamespaceInput.new(id_namespace_name: id_namespace_name)
        get_id_namespace(input)
      end

      def get_id_namespace(input : Types::GetIdNamespaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ID_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the corresponding Match ID of a customer record if the record has been processed in a
      # rule-based matching workflow. You can call this API as a dry run of an incremental load on the
      # rule-based matching workflow.

      def get_match_id(
        record : Hash(String, String),
        workflow_name : String,
        apply_normalization : Bool? = nil
      ) : Protocol::Request
        input = Types::GetMatchIdInput.new(record: record, workflow_name: workflow_name, apply_normalization: apply_normalization)
        get_match_id(input)
      end

      def get_match_id(input : Types::GetMatchIdInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MATCH_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status, metrics, and errors (if there are any) that are associated with a job.

      def get_matching_job(
        job_id : String,
        workflow_name : String
      ) : Protocol::Request
        input = Types::GetMatchingJobInput.new(job_id: job_id, workflow_name: workflow_name)
        get_matching_job(input)
      end

      def get_matching_job(input : Types::GetMatchingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MATCHING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the MatchingWorkflow with a given name, if it exists.

      def get_matching_workflow(
        workflow_name : String
      ) : Protocol::Request
        input = Types::GetMatchingWorkflowInput.new(workflow_name: workflow_name)
        get_matching_workflow(input)
      end

      def get_matching_workflow(input : Types::GetMatchingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MATCHING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the resource-based policy.

      def get_policy(
        arn : String
      ) : Protocol::Request
        input = Types::GetPolicyInput.new(arn: arn)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the ProviderService of a given name.

      def get_provider_service(
        provider_name : String,
        provider_service_name : String
      ) : Protocol::Request
        input = Types::GetProviderServiceInput.new(provider_name: provider_name, provider_service_name: provider_service_name)
        get_provider_service(input)
      end

      def get_provider_service(input : Types::GetProviderServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROVIDER_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the SchemaMapping of a given name.

      def get_schema_mapping(
        schema_name : String
      ) : Protocol::Request
        input = Types::GetSchemaMappingInput.new(schema_name: schema_name)
        get_schema_mapping(input)
      end

      def get_schema_mapping(input : Types::GetSchemaMappingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all ID mapping jobs for a given workflow.

      def list_id_mapping_jobs(
        workflow_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdMappingJobsInput.new(workflow_name: workflow_name, max_results: max_results, next_token: next_token)
        list_id_mapping_jobs(input)
      end

      def list_id_mapping_jobs(input : Types::ListIdMappingJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ID_MAPPING_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the IdMappingWorkflows that have been created for an Amazon Web Services
      # account.

      def list_id_mapping_workflows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdMappingWorkflowsInput.new(max_results: max_results, next_token: next_token)
        list_id_mapping_workflows(input)
      end

      def list_id_mapping_workflows(input : Types::ListIdMappingWorkflowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ID_MAPPING_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all ID namespaces.

      def list_id_namespaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdNamespacesInput.new(max_results: max_results, next_token: next_token)
        list_id_namespaces(input)
      end

      def list_id_namespaces(input : Types::ListIdNamespacesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ID_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all jobs for a given workflow.

      def list_matching_jobs(
        workflow_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMatchingJobsInput.new(workflow_name: workflow_name, max_results: max_results, next_token: next_token)
        list_matching_jobs(input)
      end

      def list_matching_jobs(input : Types::ListMatchingJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MATCHING_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the MatchingWorkflows that have been created for an Amazon Web Services
      # account.

      def list_matching_workflows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMatchingWorkflowsInput.new(max_results: max_results, next_token: next_token)
        list_matching_workflows(input)
      end

      def list_matching_workflows(input : Types::ListMatchingWorkflowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MATCHING_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the ProviderServices that are available in this Amazon Web Services Region.

      def list_provider_services(
        max_results : Int32? = nil,
        next_token : String? = nil,
        provider_name : String? = nil
      ) : Protocol::Request
        input = Types::ListProviderServicesInput.new(max_results: max_results, next_token: next_token, provider_name: provider_name)
        list_provider_services(input)
      end

      def list_provider_services(input : Types::ListProviderServicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVIDER_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the SchemaMappings that have been created for an Amazon Web Services account.

      def list_schema_mappings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSchemaMappingsInput.new(max_results: max_results, next_token: next_token)
        list_schema_mappings(input)
      end

      def list_schema_mappings(input : Types::ListSchemaMappingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEMA_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with an Entity Resolution resource. In Entity Resolution, SchemaMapping
      # , and MatchingWorkflow can be tagged.

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

      # Updates the resource-based policy.

      def put_policy(
        arn : String,
        policy : String,
        token : String? = nil
      ) : Protocol::Request
        input = Types::PutPolicyInput.new(arn: arn, policy: policy, token: token)
        put_policy(input)
      end

      def put_policy(input : Types::PutPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the IdMappingJob of a workflow. The workflow must have previously been created using the
      # CreateIdMappingWorkflow endpoint.

      def start_id_mapping_job(
        workflow_name : String,
        job_type : String? = nil,
        output_source_config : Array(Types::IdMappingJobOutputSource)? = nil
      ) : Protocol::Request
        input = Types::StartIdMappingJobInput.new(workflow_name: workflow_name, job_type: job_type, output_source_config: output_source_config)
        start_id_mapping_job(input)
      end

      def start_id_mapping_job(input : Types::StartIdMappingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ID_MAPPING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the MatchingJob of a workflow. The workflow must have previously been created using the
      # CreateMatchingWorkflow endpoint.

      def start_matching_job(
        workflow_name : String
      ) : Protocol::Request
        input = Types::StartMatchingJobInput.new(workflow_name: workflow_name)
        start_matching_job(input)
      end

      def start_matching_job(input : Types::StartMatchingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MATCHING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified Entity Resolution resource. Tags can
      # help you organize and categorize your resources. You can also use them to scope user permissions by
      # granting a user permission to access or change only resources with certain tag values. In Entity
      # Resolution, SchemaMapping and MatchingWorkflow can be tagged. Tags don't have any semantic meaning
      # to Amazon Web Services and are interpreted strictly as strings of characters. You can use the
      # TagResource action with a resource that already has tags. If you specify a new tag key, this tag is
      # appended to the list of tags associated with the resource. If you specify a tag key that is already
      # associated with the resource, the new tag value that you specify replaces the previous value for
      # that tag.

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

      # Removes one or more tags from the specified Entity Resolution resource. In Entity Resolution,
      # SchemaMapping , and MatchingWorkflow can be tagged.

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

      # Updates an existing IdMappingWorkflow . This method is identical to CreateIdMappingWorkflow, except
      # it uses an HTTP PUT request instead of a POST request, and the IdMappingWorkflow must already exist
      # for the method to succeed. Incremental processing is not supported for ID mapping workflows.

      def update_id_mapping_workflow(
        id_mapping_techniques : Types::IdMappingTechniques,
        input_source_config : Array(Types::IdMappingWorkflowInputSource),
        workflow_name : String,
        description : String? = nil,
        incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
        output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdMappingWorkflowInput.new(id_mapping_techniques: id_mapping_techniques, input_source_config: input_source_config, workflow_name: workflow_name, description: description, incremental_run_config: incremental_run_config, output_source_config: output_source_config, role_arn: role_arn)
        update_id_mapping_workflow(input)
      end

      def update_id_mapping_workflow(input : Types::UpdateIdMappingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ID_MAPPING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing ID namespace.

      def update_id_namespace(
        id_namespace_name : String,
        description : String? = nil,
        id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
        input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdNamespaceInput.new(id_namespace_name: id_namespace_name, description: description, id_mapping_workflow_properties: id_mapping_workflow_properties, input_source_config: input_source_config, role_arn: role_arn)
        update_id_namespace(input)
      end

      def update_id_namespace(input : Types::UpdateIdNamespaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ID_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing matching workflow. The workflow must already exist for this operation to
      # succeed. For workflows where resolutionType is ML_MATCHING or PROVIDER , incremental processing is
      # not supported.

      def update_matching_workflow(
        input_source_config : Array(Types::InputSource),
        output_source_config : Array(Types::OutputSource),
        resolution_techniques : Types::ResolutionTechniques,
        role_arn : String,
        workflow_name : String,
        description : String? = nil,
        incremental_run_config : Types::IncrementalRunConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateMatchingWorkflowInput.new(input_source_config: input_source_config, output_source_config: output_source_config, resolution_techniques: resolution_techniques, role_arn: role_arn, workflow_name: workflow_name, description: description, incremental_run_config: incremental_run_config)
        update_matching_workflow(input)
      end

      def update_matching_workflow(input : Types::UpdateMatchingWorkflowInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MATCHING_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a schema mapping. A schema is immutable if it is being used by a workflow. Therefore, you
      # can't update a schema mapping if it's associated with a workflow.

      def update_schema_mapping(
        mapped_input_fields : Array(Types::SchemaInputAttribute),
        schema_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSchemaMappingInput.new(mapped_input_fields: mapped_input_fields, schema_name: schema_name, description: description)
        update_schema_mapping(input)
      end

      def update_schema_mapping(input : Types::UpdateSchemaMappingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEMA_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
