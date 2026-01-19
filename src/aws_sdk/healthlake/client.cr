module AwsSdk
  module HealthLake
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

      # Create a FHIR-enabled data store.
      def create_fhir_datastore(
        datastore_type_version : String,
        client_token : String? = nil,
        datastore_name : String? = nil,
        identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
        preload_data_config : Types::PreloadDataConfig? = nil,
        sse_configuration : Types::SseConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFHIRDatastoreResponse
        input = Types::CreateFHIRDatastoreRequest.new(datastore_type_version: datastore_type_version, client_token: client_token, datastore_name: datastore_name, identity_provider_configuration: identity_provider_configuration, preload_data_config: preload_data_config, sse_configuration: sse_configuration, tags: tags)
        create_fhir_datastore(input)
      end
      def create_fhir_datastore(input : Types::CreateFHIRDatastoreRequest) : Types::CreateFHIRDatastoreResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FHIR_DATASTORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFHIRDatastoreResponse, "CreateFHIRDatastore")
      end

      # Delete a FHIR-enabled data store.
      def delete_fhir_datastore(
        datastore_id : String
      ) : Types::DeleteFHIRDatastoreResponse
        input = Types::DeleteFHIRDatastoreRequest.new(datastore_id: datastore_id)
        delete_fhir_datastore(input)
      end
      def delete_fhir_datastore(input : Types::DeleteFHIRDatastoreRequest) : Types::DeleteFHIRDatastoreResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FHIR_DATASTORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFHIRDatastoreResponse, "DeleteFHIRDatastore")
      end

      # Get properties for a FHIR-enabled data store.
      def describe_fhir_datastore(
        datastore_id : String
      ) : Types::DescribeFHIRDatastoreResponse
        input = Types::DescribeFHIRDatastoreRequest.new(datastore_id: datastore_id)
        describe_fhir_datastore(input)
      end
      def describe_fhir_datastore(input : Types::DescribeFHIRDatastoreRequest) : Types::DescribeFHIRDatastoreResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FHIR_DATASTORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFHIRDatastoreResponse, "DescribeFHIRDatastore")
      end

      # Get FHIR export job properties.
      def describe_fhir_export_job(
        datastore_id : String,
        job_id : String
      ) : Types::DescribeFHIRExportJobResponse
        input = Types::DescribeFHIRExportJobRequest.new(datastore_id: datastore_id, job_id: job_id)
        describe_fhir_export_job(input)
      end
      def describe_fhir_export_job(input : Types::DescribeFHIRExportJobRequest) : Types::DescribeFHIRExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FHIR_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFHIRExportJobResponse, "DescribeFHIRExportJob")
      end

      # Get the import job properties to learn more about the job or job progress.
      def describe_fhir_import_job(
        datastore_id : String,
        job_id : String
      ) : Types::DescribeFHIRImportJobResponse
        input = Types::DescribeFHIRImportJobRequest.new(datastore_id: datastore_id, job_id: job_id)
        describe_fhir_import_job(input)
      end
      def describe_fhir_import_job(input : Types::DescribeFHIRImportJobRequest) : Types::DescribeFHIRImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FHIR_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFHIRImportJobResponse, "DescribeFHIRImportJob")
      end

      # List all FHIR-enabled data stores in a user’s account, regardless of data store status.
      def list_fhir_datastores(
        filter : Types::DatastoreFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFHIRDatastoresResponse
        input = Types::ListFHIRDatastoresRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_fhir_datastores(input)
      end
      def list_fhir_datastores(input : Types::ListFHIRDatastoresRequest) : Types::ListFHIRDatastoresResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FHIR_DATASTORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFHIRDatastoresResponse, "ListFHIRDatastores")
      end

      # Lists all FHIR export jobs associated with an account and their statuses.
      def list_fhir_export_jobs(
        datastore_id : String,
        job_name : String? = nil,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        submitted_after : Time? = nil,
        submitted_before : Time? = nil
      ) : Types::ListFHIRExportJobsResponse
        input = Types::ListFHIRExportJobsRequest.new(datastore_id: datastore_id, job_name: job_name, job_status: job_status, max_results: max_results, next_token: next_token, submitted_after: submitted_after, submitted_before: submitted_before)
        list_fhir_export_jobs(input)
      end
      def list_fhir_export_jobs(input : Types::ListFHIRExportJobsRequest) : Types::ListFHIRExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FHIR_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFHIRExportJobsResponse, "ListFHIRExportJobs")
      end

      # List all FHIR import jobs associated with an account and their statuses.
      def list_fhir_import_jobs(
        datastore_id : String,
        job_name : String? = nil,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        submitted_after : Time? = nil,
        submitted_before : Time? = nil
      ) : Types::ListFHIRImportJobsResponse
        input = Types::ListFHIRImportJobsRequest.new(datastore_id: datastore_id, job_name: job_name, job_status: job_status, max_results: max_results, next_token: next_token, submitted_after: submitted_after, submitted_before: submitted_before)
        list_fhir_import_jobs(input)
      end
      def list_fhir_import_jobs(input : Types::ListFHIRImportJobsRequest) : Types::ListFHIRImportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FHIR_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFHIRImportJobsResponse, "ListFHIRImportJobs")
      end

      # Returns a list of all existing tags associated with a data store.
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

      # Start a FHIR export job.
      def start_fhir_export_job(
        data_access_role_arn : String,
        datastore_id : String,
        output_data_config : Types::OutputDataConfig,
        client_token : String? = nil,
        job_name : String? = nil
      ) : Types::StartFHIRExportJobResponse
        input = Types::StartFHIRExportJobRequest.new(data_access_role_arn: data_access_role_arn, datastore_id: datastore_id, output_data_config: output_data_config, client_token: client_token, job_name: job_name)
        start_fhir_export_job(input)
      end
      def start_fhir_export_job(input : Types::StartFHIRExportJobRequest) : Types::StartFHIRExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_FHIR_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFHIRExportJobResponse, "StartFHIRExportJob")
      end

      # Start importing bulk FHIR data into an ACTIVE data store. The import job imports FHIR data found in
      # the InputDataConfig object and stores processing results in the JobOutputDataConfig object.
      def start_fhir_import_job(
        data_access_role_arn : String,
        datastore_id : String,
        input_data_config : Types::InputDataConfig,
        job_output_data_config : Types::OutputDataConfig,
        client_token : String? = nil,
        job_name : String? = nil,
        validation_level : String? = nil
      ) : Types::StartFHIRImportJobResponse
        input = Types::StartFHIRImportJobRequest.new(data_access_role_arn: data_access_role_arn, datastore_id: datastore_id, input_data_config: input_data_config, job_output_data_config: job_output_data_config, client_token: client_token, job_name: job_name, validation_level: validation_level)
        start_fhir_import_job(input)
      end
      def start_fhir_import_job(input : Types::StartFHIRImportJobRequest) : Types::StartFHIRImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_FHIR_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFHIRImportJobResponse, "StartFHIRImportJob")
      end

      # Add a user-specifed key and value tag to a data store.
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

      # Remove a user-specifed key and value tag from a data store.
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
    end
  end
end
