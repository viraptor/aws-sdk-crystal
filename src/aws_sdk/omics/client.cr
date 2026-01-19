module AwsSdk
  module Omics
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

      # Stops a multipart read set upload into a sequence store and returns a response with no body if the
      # operation is successful. To confirm that a multipart read set upload has been stopped, use the
      # ListMultipartReadSetUploads API operation to view all active multipart read set uploads.
      def abort_multipart_read_set_upload(
        sequence_store_id : String,
        upload_id : String
      ) : Protocol::Request
        input = Types::AbortMultipartReadSetUploadRequest.new(sequence_store_id: sequence_store_id, upload_id: upload_id)
        abort_multipart_read_set_upload(input)
      end
      def abort_multipart_read_set_upload(input : Types::AbortMultipartReadSetUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ABORT_MULTIPART_READ_SET_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Accept a resource share request.
      def accept_share(
        share_id : String
      ) : Protocol::Request
        input = Types::AcceptShareRequest.new(share_id: share_id)
        accept_share(input)
      end
      def accept_share(input : Types::AcceptShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or more read sets. If the operation is successful, it returns a response with no body.
      # If there is an error with deleting one of the read sets, the operation returns an error list. If the
      # operation successfully deletes only a subset of files, it will return an error list for the
      # remaining files that fail to be deleted. There is a limit of 100 read sets that can be deleted in
      # each BatchDeleteReadSet API call.
      def batch_delete_read_set(
        ids : Array(String),
        sequence_store_id : String
      ) : Protocol::Request
        input = Types::BatchDeleteReadSetRequest.new(ids: ids, sequence_store_id: sequence_store_id)
        batch_delete_read_set(input)
      end
      def batch_delete_read_set(input : Types::BatchDeleteReadSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_READ_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Cancels an annotation import job.
      def cancel_annotation_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::CancelAnnotationImportRequest.new(job_id: job_id)
        cancel_annotation_import_job(input)
      end
      def cancel_annotation_import_job(input : Types::CancelAnnotationImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ANNOTATION_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a run using its ID and returns a response with no body if the operation is successful. To
      # confirm that the run has been cancelled, use the ListRuns API operation to check that it is no
      # longer listed.
      def cancel_run(
        id : String
      ) : Protocol::Request
        input = Types::CancelRunRequest.new(id: id)
        cancel_run(input)
      end
      def cancel_run(input : Types::CancelRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Cancels a variant import job.
      def cancel_variant_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::CancelVariantImportRequest.new(job_id: job_id)
        cancel_variant_import_job(input)
      end
      def cancel_variant_import_job(input : Types::CancelVariantImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_VARIANT_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Completes a multipart read set upload into a sequence store after you have initiated the upload
      # process with CreateMultipartReadSetUpload and uploaded all read set parts using UploadReadSetPart .
      # You must specify the parts you uploaded using the parts parameter. If the operation is successful,
      # it returns the read set ID(s) of the uploaded read set(s). For more information, see Direct upload
      # to a sequence store in the Amazon Web Services HealthOmics User Guide .
      def complete_multipart_read_set_upload(
        parts : Array(Types::CompleteReadSetUploadPartListItem),
        sequence_store_id : String,
        upload_id : String
      ) : Protocol::Request
        input = Types::CompleteMultipartReadSetUploadRequest.new(parts: parts, sequence_store_id: sequence_store_id, upload_id: upload_id)
        complete_multipart_read_set_upload(input)
      end
      def complete_multipart_read_set_upload(input : Types::CompleteMultipartReadSetUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_MULTIPART_READ_SET_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Creates an annotation store.
      def create_annotation_store(
        store_format : String,
        description : String? = nil,
        name : String? = nil,
        reference : Types::ReferenceItem? = nil,
        sse_config : Types::SseConfig? = nil,
        store_options : Types::StoreOptions? = nil,
        tags : Hash(String, String)? = nil,
        version_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateAnnotationStoreRequest.new(store_format: store_format, description: description, name: name, reference: reference, sse_config: sse_config, store_options: store_options, tags: tags, version_name: version_name)
        create_annotation_store(input)
      end
      def create_annotation_store(input : Types::CreateAnnotationStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANNOTATION_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of an annotation store.
      def create_annotation_store_version(
        name : String,
        version_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        version_options : Types::VersionOptions? = nil
      ) : Protocol::Request
        input = Types::CreateAnnotationStoreVersionRequest.new(name: name, version_name: version_name, description: description, tags: tags, version_options: version_options)
        create_annotation_store_version(input)
      end
      def create_annotation_store_version(input : Types::CreateAnnotationStoreVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANNOTATION_STORE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a multipart read set upload for uploading partitioned source files into a sequence store.
      # You can directly import source files from an EC2 instance and other local compute, or from an S3
      # bucket. To separate these source files into parts, use the split operation. Each part cannot be
      # larger than 100 MB. If the operation is successful, it provides an uploadId which is required by the
      # UploadReadSetPart API operation to upload parts into a sequence store. To continue uploading a
      # multipart read set into your sequence store, you must use the UploadReadSetPart API operation to
      # upload each part individually following the steps below: Specify the uploadId obtained from the
      # previous call to CreateMultipartReadSetUpload . Upload parts for that uploadId . When you have
      # finished uploading parts, use the CompleteMultipartReadSetUpload API to complete the multipart read
      # set upload and to retrieve the final read set IDs in the response. To learn more about creating
      # parts and the split operation, see Direct upload to a sequence store in the Amazon Web Services
      # HealthOmics User Guide .
      def create_multipart_read_set_upload(
        name : String,
        sample_id : String,
        sequence_store_id : String,
        source_file_type : String,
        subject_id : String,
        client_token : String? = nil,
        description : String? = nil,
        generated_from : String? = nil,
        reference_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMultipartReadSetUploadRequest.new(name: name, sample_id: sample_id, sequence_store_id: sequence_store_id, source_file_type: source_file_type, subject_id: subject_id, client_token: client_token, description: description, generated_from: generated_from, reference_arn: reference_arn, tags: tags)
        create_multipart_read_set_upload(input)
      end
      def create_multipart_read_set_upload(input : Types::CreateMultipartReadSetUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MULTIPART_READ_SET_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a reference store and returns metadata in JSON format. Reference stores are used to store
      # reference genomes in FASTA format. A reference store is created when the first reference genome is
      # imported. To import additional reference genomes from an Amazon S3 bucket, use the
      # StartReferenceImportJob API operation. For more information, see Creating a HealthOmics reference
      # store in the Amazon Web Services HealthOmics User Guide .
      def create_reference_store(
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        sse_config : Types::SseConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReferenceStoreRequest.new(name: name, client_token: client_token, description: description, sse_config: sse_config, tags: tags)
        create_reference_store(input)
      end
      def create_reference_store(input : Types::CreateReferenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REFERENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a run cache to store and reference task outputs from completed private runs. Specify an
      # Amazon S3 location where Amazon Web Services HealthOmics saves the cached data. This data must be
      # immediately accessible and not in an archived state. You can save intermediate task files to a run
      # cache if they are declared as task outputs in the workflow definition file. For more information,
      # see Call caching and Creating a run cache in the Amazon Web Services HealthOmics User Guide .
      def create_run_cache(
        cache_s3_location : String,
        request_id : String,
        cache_behavior : String? = nil,
        cache_bucket_owner_id : String? = nil,
        description : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRunCacheRequest.new(cache_s3_location: cache_s3_location, request_id: request_id, cache_behavior: cache_behavior, cache_bucket_owner_id: cache_bucket_owner_id, description: description, name: name, tags: tags)
        create_run_cache(input)
      end
      def create_run_cache(input : Types::CreateRunCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RUN_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a run group to limit the compute resources for the runs that are added to the group. Returns
      # an ARN, ID, and tags for the run group.
      def create_run_group(
        request_id : String,
        max_cpus : Int32? = nil,
        max_duration : Int32? = nil,
        max_gpus : Int32? = nil,
        max_runs : Int32? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRunGroupRequest.new(request_id: request_id, max_cpus: max_cpus, max_duration: max_duration, max_gpus: max_gpus, max_runs: max_runs, name: name, tags: tags)
        create_run_group(input)
      end
      def create_run_group(input : Types::CreateRunGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RUN_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a sequence store and returns its metadata. Sequence stores are used to store sequence data
      # files called read sets that are saved in FASTQ, BAM, uBAM, or CRAM formats. For aligned formats (BAM
      # and CRAM), a sequence store can only use one reference genome. For unaligned formats (FASTQ and
      # uBAM), a reference genome is not required. You can create multiple sequence stores per region per
      # account. The following are optional parameters you can specify for your sequence store: Use
      # s3AccessConfig to configure your sequence store with S3 access logs (recommended). Use sseConfig to
      # define your own KMS key for encryption. Use eTagAlgorithmFamily to define which algorithm to use for
      # the HealthOmics eTag on objects. Use fallbackLocation to define a backup location for storing files
      # that have failed a direct upload. Use propagatedSetLevelTags to configure tags that propagate to all
      # objects in your store. For more information, see Creating a HealthOmics sequence store in the Amazon
      # Web Services HealthOmics User Guide .
      def create_sequence_store(
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        e_tag_algorithm_family : String? = nil,
        fallback_location : String? = nil,
        propagated_set_level_tags : Array(String)? = nil,
        s3_access_config : Types::S3AccessConfig? = nil,
        sse_config : Types::SseConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSequenceStoreRequest.new(name: name, client_token: client_token, description: description, e_tag_algorithm_family: e_tag_algorithm_family, fallback_location: fallback_location, propagated_set_level_tags: propagated_set_level_tags, s3_access_config: s3_access_config, sse_config: sse_config, tags: tags)
        create_sequence_store(input)
      end
      def create_sequence_store(input : Types::CreateSequenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEQUENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a cross-account shared resource. The resource owner makes an offer to share the resource
      # with the principal subscriber (an AWS user with a different account than the resource owner). The
      # following resources support cross-account sharing: HealthOmics variant stores HealthOmics annotation
      # stores Private workflows
      def create_share(
        principal_subscriber : String,
        resource_arn : String,
        share_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateShareRequest.new(principal_subscriber: principal_subscriber, resource_arn: resource_arn, share_name: share_name)
        create_share(input)
      end
      def create_share(input : Types::CreateShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Creates a variant store.
      def create_variant_store(
        reference : Types::ReferenceItem,
        description : String? = nil,
        name : String? = nil,
        sse_config : Types::SseConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVariantStoreRequest.new(reference: reference, description: description, name: name, sse_config: sse_config, tags: tags)
        create_variant_store(input)
      end
      def create_variant_store(input : Types::CreateVariantStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VARIANT_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a private workflow. Before you create a private workflow, you must create and configure
      # these required resources: Workflow definition file: A workflow definition file written in WDL,
      # Nextflow, or CWL. The workflow definition specifies the inputs and outputs for runs that use the
      # workflow. It also includes specifications for the runs and run tasks for your workflow, including
      # compute and memory requirements. The workflow definition file must be in .zip format. For more
      # information, see Workflow definition files in Amazon Web Services HealthOmics. You can use Amazon Q
      # CLI to build and validate your workflow definition files in WDL, Nextflow, and CWL. For more
      # information, see Example prompts for Amazon Q CLI and the Amazon Web Services HealthOmics Agentic
      # generative AI tutorial on GitHub. (Optional) Parameter template file: A parameter template file
      # written in JSON. Create the file to define the run parameters, or Amazon Web Services HealthOmics
      # generates the parameter template for you. For more information, see Parameter template files for
      # HealthOmics workflows . ECR container images: Create container images for the workflow in a private
      # ECR repository, or synchronize images from a supported upstream registry with your Amazon ECR
      # private repository. (Optional) Sentieon licenses: Request a Sentieon license to use the Sentieon
      # software in private workflows. For more information, see Creating or updating a private workflow in
      # Amazon Web Services HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def create_workflow(
        request_id : String,
        accelerators : String? = nil,
        container_registry_map : Types::ContainerRegistryMap? = nil,
        container_registry_map_uri : String? = nil,
        definition_repository : Types::DefinitionRepository? = nil,
        definition_uri : String? = nil,
        definition_zip : Bytes? = nil,
        description : String? = nil,
        engine : String? = nil,
        main : String? = nil,
        name : String? = nil,
        parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
        parameter_template_path : String? = nil,
        readme_markdown : String? = nil,
        readme_path : String? = nil,
        readme_uri : String? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        tags : Hash(String, String)? = nil,
        workflow_bucket_owner_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowRequest.new(request_id: request_id, accelerators: accelerators, container_registry_map: container_registry_map, container_registry_map_uri: container_registry_map_uri, definition_repository: definition_repository, definition_uri: definition_uri, definition_zip: definition_zip, description: description, engine: engine, main: main, name: name, parameter_template: parameter_template, parameter_template_path: parameter_template_path, readme_markdown: readme_markdown, readme_path: readme_path, readme_uri: readme_uri, storage_capacity: storage_capacity, storage_type: storage_type, tags: tags, workflow_bucket_owner_id: workflow_bucket_owner_id)
        create_workflow(input)
      end
      def create_workflow(input : Types::CreateWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new workflow version for the workflow that you specify with the workflowId parameter. When
      # you create a new version of a workflow, you need to specify the configuration for the new version.
      # It doesn't inherit any configuration values from the workflow. Provide a version name that is unique
      # for this workflow. You cannot change the name after HealthOmics creates the version. Don't include
      # any personally identifiable information (PII) in the version name. Version names appear in the
      # workflow version ARN. For more information, see Workflow versioning in Amazon Web Services
      # HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def create_workflow_version(
        request_id : String,
        version_name : String,
        workflow_id : String,
        accelerators : String? = nil,
        container_registry_map : Types::ContainerRegistryMap? = nil,
        container_registry_map_uri : String? = nil,
        definition_repository : Types::DefinitionRepository? = nil,
        definition_uri : String? = nil,
        definition_zip : Bytes? = nil,
        description : String? = nil,
        engine : String? = nil,
        main : String? = nil,
        parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
        parameter_template_path : String? = nil,
        readme_markdown : String? = nil,
        readme_path : String? = nil,
        readme_uri : String? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        tags : Hash(String, String)? = nil,
        workflow_bucket_owner_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowVersionRequest.new(request_id: request_id, version_name: version_name, workflow_id: workflow_id, accelerators: accelerators, container_registry_map: container_registry_map, container_registry_map_uri: container_registry_map_uri, definition_repository: definition_repository, definition_uri: definition_uri, definition_zip: definition_zip, description: description, engine: engine, main: main, parameter_template: parameter_template, parameter_template_path: parameter_template_path, readme_markdown: readme_markdown, readme_path: readme_path, readme_uri: readme_uri, storage_capacity: storage_capacity, storage_type: storage_type, tags: tags, workflow_bucket_owner_id: workflow_bucket_owner_id)
        create_workflow_version(input)
      end
      def create_workflow_version(input : Types::CreateWorkflowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Deletes an annotation store.
      def delete_annotation_store(
        name : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAnnotationStoreRequest.new(name: name, force: force)
        delete_annotation_store(input)
      end
      def delete_annotation_store(input : Types::DeleteAnnotationStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANNOTATION_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or multiple versions of an annotation store.
      def delete_annotation_store_versions(
        name : String,
        versions : Array(String),
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAnnotationStoreVersionsRequest.new(name: name, versions: versions, force: force)
        delete_annotation_store_versions(input)
      end
      def delete_annotation_store_versions(input : Types::DeleteAnnotationStoreVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANNOTATION_STORE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a reference genome and returns a response with no body if the operation is successful. The
      # read set associated with the reference genome must first be deleted before deleting the reference
      # genome. After the reference genome is deleted, you can delete the reference store using the
      # DeleteReferenceStore API operation. For more information, see Deleting HealthOmics reference and
      # sequence stores in the Amazon Web Services HealthOmics User Guide .
      def delete_reference(
        id : String,
        reference_store_id : String
      ) : Protocol::Request
        input = Types::DeleteReferenceRequest.new(id: id, reference_store_id: reference_store_id)
        delete_reference(input)
      end
      def delete_reference(input : Types::DeleteReferenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REFERENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a reference store and returns a response with no body if the operation is successful. You
      # can only delete a reference store when it does not contain any reference genomes. To empty a
      # reference store, use DeleteReference . For more information about your workflow status, see Deleting
      # HealthOmics reference and sequence stores in the Amazon Web Services HealthOmics User Guide .
      def delete_reference_store(
        id : String
      ) : Protocol::Request
        input = Types::DeleteReferenceStoreRequest.new(id: id)
        delete_reference_store(input)
      end
      def delete_reference_store(input : Types::DeleteReferenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REFERENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a run and returns a response with no body if the operation is successful. You can only
      # delete a run that has reached a COMPLETED , FAILED , or CANCELLED stage. A completed run has
      # delivered an output, or was cancelled and resulted in no output. When you delete a run, only the
      # metadata associated with the run is deleted. The run outputs remain in Amazon S3 and logs remain in
      # CloudWatch. To verify that the workflow is deleted: Use ListRuns to confirm the workflow no longer
      # appears in the list. Use GetRun to verify the workflow cannot be found.
      def delete_run(
        id : String
      ) : Protocol::Request
        input = Types::DeleteRunRequest.new(id: id)
        delete_run(input)
      end
      def delete_run(input : Types::DeleteRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a run cache and returns a response with no body if the operation is successful. This action
      # removes the cache metadata stored in the service account, but does not delete the data in Amazon S3.
      # You can access the cache data in Amazon S3, for inspection or to troubleshoot issues. You can remove
      # old cache data using standard S3 Delete operations. For more information, see Deleting a run cache
      # in the Amazon Web Services HealthOmics User Guide .
      def delete_run_cache(
        id : String
      ) : Protocol::Request
        input = Types::DeleteRunCacheRequest.new(id: id)
        delete_run_cache(input)
      end
      def delete_run_cache(input : Types::DeleteRunCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RUN_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a run group and returns a response with no body if the operation is successful. To verify
      # that the run group is deleted: Use ListRunGroups to confirm the workflow no longer appears in the
      # list. Use GetRunGroup to verify the workflow cannot be found.
      def delete_run_group(
        id : String
      ) : Protocol::Request
        input = Types::DeleteRunGroupRequest.new(id: id)
        delete_run_group(input)
      end
      def delete_run_group(input : Types::DeleteRunGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RUN_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an access policy for the specified store.
      def delete_s3_access_policy(
        s3_access_point_arn : String
      ) : Protocol::Request
        input = Types::DeleteS3AccessPolicyRequest.new(s3_access_point_arn: s3_access_point_arn)
        delete_s3_access_policy(input)
      end
      def delete_s3_access_policy(input : Types::DeleteS3AccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_S3_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a sequence store and returns a response with no body if the operation is successful. You can
      # only delete a sequence store when it does not contain any read sets. Use the BatchDeleteReadSet API
      # operation to ensure that all read sets in the sequence store are deleted. When a sequence store is
      # deleted, all tags associated with the store are also deleted. For more information, see Deleting
      # HealthOmics reference and sequence stores in the Amazon Web Services HealthOmics User Guide .
      def delete_sequence_store(
        id : String
      ) : Protocol::Request
        input = Types::DeleteSequenceStoreRequest.new(id: id)
        delete_sequence_store(input)
      end
      def delete_sequence_store(input : Types::DeleteSequenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SEQUENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource share. If you are the resource owner, the subscriber will no longer have access
      # to the shared resource. If you are the subscriber, this operation deletes your access to the share.
      def delete_share(
        share_id : String
      ) : Protocol::Request
        input = Types::DeleteShareRequest.new(share_id: share_id)
        delete_share(input)
      end
      def delete_share(input : Types::DeleteShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Deletes a variant store.
      def delete_variant_store(
        name : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteVariantStoreRequest.new(name: name, force: force)
        delete_variant_store(input)
      end
      def delete_variant_store(input : Types::DeleteVariantStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VARIANT_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workflow by specifying its ID. This operation returns a response with no body if the
      # deletion is successful. To verify that the workflow is deleted: Use ListWorkflows to confirm the
      # workflow no longer appears in the list. Use GetWorkflow to verify the workflow cannot be found.
      def delete_workflow(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowRequest.new(id: id)
        delete_workflow(input)
      end
      def delete_workflow(input : Types::DeleteWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workflow version. Deleting a workflow version doesn't affect any ongoing runs that are
      # using the workflow version. For more information, see Workflow versioning in Amazon Web Services
      # HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def delete_workflow_version(
        version_name : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowVersionRequest.new(version_name: version_name, workflow_id: workflow_id)
        delete_workflow_version(input)
      end
      def delete_workflow_version(input : Types::DeleteWorkflowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Gets information about an annotation import job.
      def get_annotation_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::GetAnnotationImportRequest.new(job_id: job_id)
        get_annotation_import_job(input)
      end
      def get_annotation_import_job(input : Types::GetAnnotationImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANNOTATION_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Gets information about an annotation store.
      def get_annotation_store(
        name : String
      ) : Protocol::Request
        input = Types::GetAnnotationStoreRequest.new(name: name)
        get_annotation_store(input)
      end
      def get_annotation_store(input : Types::GetAnnotationStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANNOTATION_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata for an annotation store version.
      def get_annotation_store_version(
        name : String,
        version_name : String
      ) : Protocol::Request
        input = Types::GetAnnotationStoreVersionRequest.new(name: name, version_name: version_name)
        get_annotation_store_version(input)
      end
      def get_annotation_store_version(input : Types::GetAnnotationStoreVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANNOTATION_STORE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information from parts of a read set and returns the read set in the same format
      # that it was uploaded. You must have read sets uploaded to your sequence store in order to run this
      # operation.
      def get_read_set(
        id : String,
        part_number : Int32,
        sequence_store_id : String,
        file : String? = nil
      ) : Protocol::Request
        input = Types::GetReadSetRequest.new(id: id, part_number: part_number, sequence_store_id: sequence_store_id, file: file)
        get_read_set(input)
      end
      def get_read_set(input : Types::GetReadSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READ_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about the status of a read set activation job in JSON format.
      def get_read_set_activation_job(
        id : String,
        sequence_store_id : String
      ) : Protocol::Request
        input = Types::GetReadSetActivationJobRequest.new(id: id, sequence_store_id: sequence_store_id)
        get_read_set_activation_job(input)
      end
      def get_read_set_activation_job(input : Types::GetReadSetActivationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READ_SET_ACTIVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves status information about a read set export job and returns the data in JSON format. Use
      # this operation to actively monitor the progress of an export job.
      def get_read_set_export_job(
        id : String,
        sequence_store_id : String
      ) : Protocol::Request
        input = Types::GetReadSetExportJobRequest.new(id: id, sequence_store_id: sequence_store_id)
        get_read_set_export_job(input)
      end
      def get_read_set_export_job(input : Types::GetReadSetExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READ_SET_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets detailed and status information about a read set import job and returns the data in JSON
      # format.
      def get_read_set_import_job(
        id : String,
        sequence_store_id : String
      ) : Protocol::Request
        input = Types::GetReadSetImportJobRequest.new(id: id, sequence_store_id: sequence_store_id)
        get_read_set_import_job(input)
      end
      def get_read_set_import_job(input : Types::GetReadSetImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READ_SET_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata for a read set from a sequence store in JSON format. This operation does not
      # return tags. To retrieve the list of tags for a read set, use the ListTagsForResource API operation.
      def get_read_set_metadata(
        id : String,
        sequence_store_id : String
      ) : Protocol::Request
        input = Types::GetReadSetMetadataRequest.new(id: id, sequence_store_id: sequence_store_id)
        get_read_set_metadata(input)
      end
      def get_read_set_metadata(input : Types::GetReadSetMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READ_SET_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Downloads parts of data from a reference genome and returns the reference file in the same format
      # that it was uploaded. For more information, see Creating a HealthOmics reference store in the Amazon
      # Web Services HealthOmics User Guide .
      def get_reference(
        id : String,
        part_number : Int32,
        reference_store_id : String,
        file : String? = nil,
        range : String? = nil
      ) : Protocol::Request
        input = Types::GetReferenceRequest.new(id: id, part_number: part_number, reference_store_id: reference_store_id, file: file, range: range)
        get_reference(input)
      end
      def get_reference(input : Types::GetReferenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REFERENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Monitors the status of a reference import job. This operation can be called after calling the
      # StartReferenceImportJob operation.
      def get_reference_import_job(
        id : String,
        reference_store_id : String
      ) : Protocol::Request
        input = Types::GetReferenceImportJobRequest.new(id: id, reference_store_id: reference_store_id)
        get_reference_import_job(input)
      end
      def get_reference_import_job(input : Types::GetReferenceImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REFERENCE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata for a reference genome. This operation returns the number of parts, part size,
      # and MD5 of an entire file. This operation does not return tags. To retrieve the list of tags for a
      # read set, use the ListTagsForResource API operation.
      def get_reference_metadata(
        id : String,
        reference_store_id : String
      ) : Protocol::Request
        input = Types::GetReferenceMetadataRequest.new(id: id, reference_store_id: reference_store_id)
        get_reference_metadata(input)
      end
      def get_reference_metadata(input : Types::GetReferenceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REFERENCE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a reference store.
      def get_reference_store(
        id : String
      ) : Protocol::Request
        input = Types::GetReferenceStoreRequest.new(id: id)
        get_reference_store(input)
      end
      def get_reference_store(input : Types::GetReferenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REFERENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets detailed information about a specific run using its ID. Amazon Web Services HealthOmics stores
      # a configurable number of runs, as determined by service limits, that are available to the console
      # and API. If GetRun does not return the requested run, you can find all run logs in the CloudWatch
      # logs. For more information about viewing the run logs, see CloudWatch logs in the Amazon Web
      # Services HealthOmics User Guide .
      def get_run(
        id : String,
        export : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetRunRequest.new(id: id, export: export)
        get_run(input)
      end
      def get_run(input : Types::GetRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about the specified run cache using its ID. For more information, see
      # Call caching for Amazon Web Services HealthOmics runs in the Amazon Web Services HealthOmics User
      # Guide .
      def get_run_cache(
        id : String
      ) : Protocol::Request
        input = Types::GetRunCacheRequest.new(id: id)
        get_run_cache(input)
      end
      def get_run_cache(input : Types::GetRunCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUN_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a run group and returns its metadata.
      def get_run_group(
        id : String
      ) : Protocol::Request
        input = Types::GetRunGroupRequest.new(id: id)
        get_run_group(input)
      end
      def get_run_group(input : Types::GetRunGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUN_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets detailed information about a run task using its ID.
      def get_run_task(
        id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::GetRunTaskRequest.new(id: id, task_id: task_id)
        get_run_task(input)
      end
      def get_run_task(input : Types::GetRunTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUN_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about an access policy on a given store.
      def get_s3_access_policy(
        s3_access_point_arn : String
      ) : Protocol::Request
        input = Types::GetS3AccessPolicyRequest.new(s3_access_point_arn: s3_access_point_arn)
        get_s3_access_policy(input)
      end
      def get_s3_access_policy(input : Types::GetS3AccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_S3_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata for a sequence store using its ID and returns it in JSON format.
      def get_sequence_store(
        id : String
      ) : Protocol::Request
        input = Types::GetSequenceStoreRequest.new(id: id)
        get_sequence_store(input)
      end
      def get_sequence_store(input : Types::GetSequenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEQUENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata for the specified resource share.
      def get_share(
        share_id : String
      ) : Protocol::Request
        input = Types::GetShareRequest.new(share_id: share_id)
        get_share(input)
      end
      def get_share(input : Types::GetShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Gets information about a variant import job.
      def get_variant_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::GetVariantImportRequest.new(job_id: job_id)
        get_variant_import_job(input)
      end
      def get_variant_import_job(input : Types::GetVariantImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VARIANT_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Gets information about a variant store.
      def get_variant_store(
        name : String
      ) : Protocol::Request
        input = Types::GetVariantStoreRequest.new(name: name)
        get_variant_store(input)
      end
      def get_variant_store(input : Types::GetVariantStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VARIANT_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets all information about a workflow using its ID. If a workflow is shared with you, you cannot
      # export the workflow. For more information about your workflow status, see Verify the workflow status
      # in the Amazon Web Services HealthOmics User Guide .
      def get_workflow(
        id : String,
        export : Array(String)? = nil,
        type : String? = nil,
        workflow_owner_id : String? = nil
      ) : Protocol::Request
        input = Types::GetWorkflowRequest.new(id: id, export: export, type: type, workflow_owner_id: workflow_owner_id)
        get_workflow(input)
      end
      def get_workflow(input : Types::GetWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a workflow version. For more information, see Workflow versioning in Amazon
      # Web Services HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def get_workflow_version(
        version_name : String,
        workflow_id : String,
        export : Array(String)? = nil,
        type : String? = nil,
        workflow_owner_id : String? = nil
      ) : Protocol::Request
        input = Types::GetWorkflowVersionRequest.new(version_name: version_name, workflow_id: workflow_id, export: export, type: type, workflow_owner_id: workflow_owner_id)
        get_workflow_version(input)
      end
      def get_workflow_version(input : Types::GetWorkflowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Retrieves a list of annotation import jobs.
      def list_annotation_import_jobs(
        filter : Types::ListAnnotationImportJobsFilter? = nil,
        ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnnotationImportJobsRequest.new(filter: filter, ids: ids, max_results: max_results, next_token: next_token)
        list_annotation_import_jobs(input)
      end
      def list_annotation_import_jobs(input : Types::ListAnnotationImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANNOTATION_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of an annotation store.
      def list_annotation_store_versions(
        name : String,
        filter : Types::ListAnnotationStoreVersionsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnnotationStoreVersionsRequest.new(name: name, filter: filter, max_results: max_results, next_token: next_token)
        list_annotation_store_versions(input)
      end
      def list_annotation_store_versions(input : Types::ListAnnotationStoreVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANNOTATION_STORE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Retrieves a list of annotation stores.
      def list_annotation_stores(
        filter : Types::ListAnnotationStoresFilter? = nil,
        ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnnotationStoresRequest.new(filter: filter, ids: ids, max_results: max_results, next_token: next_token)
        list_annotation_stores(input)
      end
      def list_annotation_stores(input : Types::ListAnnotationStoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANNOTATION_STORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists in-progress multipart read set uploads for a sequence store and returns it in a JSON formatted
      # output. Multipart read set uploads are initiated by the CreateMultipartReadSetUploads API operation.
      # This operation returns a response with no body when the upload is complete.
      def list_multipart_read_set_uploads(
        sequence_store_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMultipartReadSetUploadsRequest.new(sequence_store_id: sequence_store_id, max_results: max_results, next_token: next_token)
        list_multipart_read_set_uploads(input)
      end
      def list_multipart_read_set_uploads(input : Types::ListMultipartReadSetUploadsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTIPART_READ_SET_UPLOADS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of read set activation jobs and returns the metadata in a JSON formatted output. To
      # extract metadata from a read set activation job, use the GetReadSetActivationJob API operation.
      def list_read_set_activation_jobs(
        sequence_store_id : String,
        filter : Types::ActivateReadSetFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadSetActivationJobsRequest.new(sequence_store_id: sequence_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_read_set_activation_jobs(input)
      end
      def list_read_set_activation_jobs(input : Types::ListReadSetActivationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READ_SET_ACTIVATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of read set export jobs in a JSON formatted response. This API operation is used to
      # check the status of a read set export job initiated by the StartReadSetExportJob API operation.
      def list_read_set_export_jobs(
        sequence_store_id : String,
        filter : Types::ExportReadSetFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadSetExportJobsRequest.new(sequence_store_id: sequence_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_read_set_export_jobs(input)
      end
      def list_read_set_export_jobs(input : Types::ListReadSetExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READ_SET_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of read set import jobs and returns the data in JSON format.
      def list_read_set_import_jobs(
        sequence_store_id : String,
        filter : Types::ImportReadSetFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadSetImportJobsRequest.new(sequence_store_id: sequence_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_read_set_import_jobs(input)
      end
      def list_read_set_import_jobs(input : Types::ListReadSetImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READ_SET_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all parts in a multipart read set upload for a sequence store and returns the metadata in a
      # JSON formatted output.
      def list_read_set_upload_parts(
        part_source : String,
        sequence_store_id : String,
        upload_id : String,
        filter : Types::ReadSetUploadPartListFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadSetUploadPartsRequest.new(part_source: part_source, sequence_store_id: sequence_store_id, upload_id: upload_id, filter: filter, max_results: max_results, next_token: next_token)
        list_read_set_upload_parts(input)
      end
      def list_read_set_upload_parts(input : Types::ListReadSetUploadPartsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READ_SET_UPLOAD_PARTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of read sets from a sequence store ID and returns the metadata in JSON format.
      def list_read_sets(
        sequence_store_id : String,
        filter : Types::ReadSetFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadSetsRequest.new(sequence_store_id: sequence_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_read_sets(input)
      end
      def list_read_sets(input : Types::ListReadSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READ_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata of one or more reference import jobs for a reference store.
      def list_reference_import_jobs(
        reference_store_id : String,
        filter : Types::ImportReferenceFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReferenceImportJobsRequest.new(reference_store_id: reference_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_reference_import_jobs(input)
      end
      def list_reference_import_jobs(input : Types::ListReferenceImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REFERENCE_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of reference stores linked to your account and returns their metadata in JSON
      # format. For more information, see Creating a reference store in the Amazon Web Services HealthOmics
      # User Guide .
      def list_reference_stores(
        filter : Types::ReferenceStoreFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReferenceStoresRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_reference_stores(input)
      end
      def list_reference_stores(input : Types::ListReferenceStoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REFERENCE_STORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata of one or more reference genomes in a reference store. For more information,
      # see Creating a reference store in the Amazon Web Services HealthOmics User Guide .
      def list_references(
        reference_store_id : String,
        filter : Types::ReferenceFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReferencesRequest.new(reference_store_id: reference_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_references(input)
      end
      def list_references(input : Types::ListReferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of your run caches and the metadata for each cache.
      def list_run_caches(
        max_results : Int32? = nil,
        starting_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRunCachesRequest.new(max_results: max_results, starting_token: starting_token)
        list_run_caches(input)
      end
      def list_run_caches(input : Types::ListRunCachesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RUN_CACHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all run groups and returns the metadata for each run group.
      def list_run_groups(
        max_results : Int32? = nil,
        name : String? = nil,
        starting_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRunGroupsRequest.new(max_results: max_results, name: name, starting_token: starting_token)
        list_run_groups(input)
      end
      def list_run_groups(input : Types::ListRunGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RUN_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tasks and status information within their specified run. Use this operation to
      # monitor runs and to identify which specific tasks have failed.
      def list_run_tasks(
        id : String,
        max_results : Int32? = nil,
        starting_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListRunTasksRequest.new(id: id, max_results: max_results, starting_token: starting_token, status: status)
        list_run_tasks(input)
      end
      def list_run_tasks(input : Types::ListRunTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RUN_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of runs and returns each run's metadata and status. Amazon Web Services HealthOmics
      # stores a configurable number of runs, as determined by service limits, that are available to the
      # console and API. If the ListRuns response doesn't include specific runs that you expected, you can
      # find all run logs in the CloudWatch logs. For more information about viewing the run logs, see
      # CloudWatch logs in the Amazon Web Services HealthOmics User Guide .
      def list_runs(
        max_results : Int32? = nil,
        name : String? = nil,
        run_group_id : String? = nil,
        starting_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListRunsRequest.new(max_results: max_results, name: name, run_group_id: run_group_id, starting_token: starting_token, status: status)
        list_runs(input)
      end
      def list_runs(input : Types::ListRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of sequence stores and returns each sequence store's metadata. For more
      # information, see Creating a HealthOmics sequence store in the Amazon Web Services HealthOmics User
      # Guide .
      def list_sequence_stores(
        filter : Types::SequenceStoreFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSequenceStoresRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_sequence_stores(input)
      end
      def list_sequence_stores(input : Types::ListSequenceStoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEQUENCE_STORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource shares associated with an account. Use the filter parameter to retrieve a
      # specific subset of the shares.
      def list_shares(
        resource_owner : String,
        filter : Types::Filter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSharesRequest.new(resource_owner: resource_owner, filter: filter, max_results: max_results, next_token: next_token)
        list_shares(input)
      end
      def list_shares(input : Types::ListSharesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of tags for a resource.
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

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Retrieves a list of variant import jobs.
      def list_variant_import_jobs(
        filter : Types::ListVariantImportJobsFilter? = nil,
        ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVariantImportJobsRequest.new(filter: filter, ids: ids, max_results: max_results, next_token: next_token)
        list_variant_import_jobs(input)
      end
      def list_variant_import_jobs(input : Types::ListVariantImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VARIANT_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Retrieves a list of variant stores.
      def list_variant_stores(
        filter : Types::ListVariantStoresFilter? = nil,
        ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVariantStoresRequest.new(filter: filter, ids: ids, max_results: max_results, next_token: next_token)
        list_variant_stores(input)
      end
      def list_variant_stores(input : Types::ListVariantStoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VARIANT_STORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the workflow versions for the specified workflow. For more information, see Workflow
      # versioning in Amazon Web Services HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def list_workflow_versions(
        workflow_id : String,
        max_results : Int32? = nil,
        starting_token : String? = nil,
        type : String? = nil,
        workflow_owner_id : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowVersionsRequest.new(workflow_id: workflow_id, max_results: max_results, starting_token: starting_token, type: type, workflow_owner_id: workflow_owner_id)
        list_workflow_versions(input)
      end
      def list_workflow_versions(input : Types::ListWorkflowVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of existing workflows. You can filter for specific workflows by their name and
      # type. Using the type parameter, specify PRIVATE to retrieve a list of private workflows or specify
      # READY2RUN for a list of all Ready2Run workflows. If you do not specify the type of workflow, this
      # operation returns a list of existing workflows.
      def list_workflows(
        max_results : Int32? = nil,
        name : String? = nil,
        starting_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowsRequest.new(max_results: max_results, name: name, starting_token: starting_token, type: type)
        list_workflows(input)
      end
      def list_workflows(input : Types::ListWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an access policy to the specified store.
      def put_s3_access_policy(
        s3_access_point_arn : String,
        s3_access_policy : String
      ) : Protocol::Request
        input = Types::PutS3AccessPolicyRequest.new(s3_access_point_arn: s3_access_point_arn, s3_access_policy: s3_access_policy)
        put_s3_access_policy(input)
      end
      def put_s3_access_policy(input : Types::PutS3AccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_S3_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Starts an annotation import job.
      def start_annotation_import_job(
        destination_name : String,
        items : Array(Types::AnnotationImportItemSource),
        role_arn : String,
        annotation_fields : Hash(String, String)? = nil,
        format_options : Types::FormatOptions? = nil,
        run_left_normalization : Bool? = nil,
        version_name : String? = nil
      ) : Protocol::Request
        input = Types::StartAnnotationImportRequest.new(destination_name: destination_name, items: items, role_arn: role_arn, annotation_fields: annotation_fields, format_options: format_options, run_left_normalization: run_left_normalization, version_name: version_name)
        start_annotation_import_job(input)
      end
      def start_annotation_import_job(input : Types::StartAnnotationImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ANNOTATION_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Activates an archived read set and returns its metadata in a JSON formatted output. AWS HealthOmics
      # automatically archives unused read sets after 30 days. To monitor the status of your read set
      # activation job, use the GetReadSetActivationJob operation. To learn more, see Activating read sets
      # in the Amazon Web Services HealthOmics User Guide .
      def start_read_set_activation_job(
        sequence_store_id : String,
        sources : Array(Types::StartReadSetActivationJobSourceItem),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartReadSetActivationJobRequest.new(sequence_store_id: sequence_store_id, sources: sources, client_token: client_token)
        start_read_set_activation_job(input)
      end
      def start_read_set_activation_job(input : Types::StartReadSetActivationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_READ_SET_ACTIVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a read set export job. When the export job is finished, the read set is exported to an Amazon
      # S3 bucket which can be retrieved using the GetReadSetExportJob API operation. To monitor the status
      # of the export job, use the ListReadSetExportJobs API operation.
      def start_read_set_export_job(
        destination : String,
        role_arn : String,
        sequence_store_id : String,
        sources : Array(Types::ExportReadSet),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartReadSetExportJobRequest.new(destination: destination, role_arn: role_arn, sequence_store_id: sequence_store_id, sources: sources, client_token: client_token)
        start_read_set_export_job(input)
      end
      def start_read_set_export_job(input : Types::StartReadSetExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_READ_SET_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a read set from the sequence store. Read set import jobs support a maximum of 100 read sets
      # of different types. Monitor the progress of your read set import job by calling the
      # GetReadSetImportJob API operation.
      def start_read_set_import_job(
        role_arn : String,
        sequence_store_id : String,
        sources : Array(Types::StartReadSetImportJobSourceItem),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartReadSetImportJobRequest.new(role_arn: role_arn, sequence_store_id: sequence_store_id, sources: sources, client_token: client_token)
        start_read_set_import_job(input)
      end
      def start_read_set_import_job(input : Types::StartReadSetImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_READ_SET_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a reference genome from Amazon S3 into a specified reference store. You can have multiple
      # reference genomes in a reference store. You can only import reference genomes one at a time into
      # each reference store. Monitor the status of your reference import job by using the
      # GetReferenceImportJob API operation.
      def start_reference_import_job(
        reference_store_id : String,
        role_arn : String,
        sources : Array(Types::StartReferenceImportJobSourceItem),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartReferenceImportJobRequest.new(reference_store_id: reference_store_id, role_arn: role_arn, sources: sources, client_token: client_token)
        start_reference_import_job(input)
      end
      def start_reference_import_job(input : Types::StartReferenceImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_REFERENCE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a new run and returns details about the run, or duplicates an existing run. A run is a single
      # invocation of a workflow. If you provide request IDs, Amazon Web Services HealthOmics identifies
      # duplicate requests and starts the run only once. Monitor the progress of the run by calling the
      # GetRun API operation. To start a new run, the following inputs are required: A service role ARN (
      # roleArn ). The run's workflow ID ( workflowId , not the uuid or runId ). An Amazon S3 location (
      # outputUri ) where the run outputs will be saved. All required workflow parameters ( parameter ),
      # which can include optional parameters from the parameter template. The run cannot include any
      # parameters that are not defined in the parameter template. To see all possible parameters, use the
      # GetRun API operation. For runs with a STATIC (default) storage type, specify the required storage
      # capacity (in gibibytes). A storage capacity value is not required for runs that use DYNAMIC storage.
      # StartRun can also duplicate an existing run using the run's default values. You can modify these
      # default values and/or add other optional inputs. To duplicate a run, the following inputs are
      # required: A service role ARN ( roleArn ). The ID of the run to duplicate ( runId ). An Amazon S3
      # location where the run outputs will be saved ( outputUri ). To learn more about the optional
      # parameters for StartRun , see Starting a run in the Amazon Web Services HealthOmics User Guide . Use
      # the retentionMode input to control how long the metadata for each run is stored in CloudWatch. There
      # are two retention modes: Specify REMOVE to automatically remove the oldest runs when you reach the
      # maximum service retention limit for runs. It is recommended that you use the REMOVE mode to initiate
      # major run requests so that your runs do not fail when you reach the limit. The retentionMode is set
      # to the RETAIN mode by default, which allows you to manually remove runs after reaching the maximum
      # service retention limit. Under this setting, you cannot create additional runs until you remove the
      # excess runs. To learn more about the retention modes, see Run retention mode in the Amazon Web
      # Services HealthOmics User Guide . You can use Amazon Q CLI to analyze run logs and make performance
      # optimization recommendations. To get started, see the Amazon Web Services HealthOmics MCP server on
      # GitHub.
      def start_run(
        output_uri : String,
        request_id : String,
        role_arn : String,
        cache_behavior : String? = nil,
        cache_id : String? = nil,
        log_level : String? = nil,
        name : String? = nil,
        parameters : Types::RunParameters? = nil,
        priority : Int32? = nil,
        retention_mode : String? = nil,
        run_group_id : String? = nil,
        run_id : String? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        tags : Hash(String, String)? = nil,
        workflow_id : String? = nil,
        workflow_owner_id : String? = nil,
        workflow_type : String? = nil,
        workflow_version_name : String? = nil
      ) : Protocol::Request
        input = Types::StartRunRequest.new(output_uri: output_uri, request_id: request_id, role_arn: role_arn, cache_behavior: cache_behavior, cache_id: cache_id, log_level: log_level, name: name, parameters: parameters, priority: priority, retention_mode: retention_mode, run_group_id: run_group_id, run_id: run_id, storage_capacity: storage_capacity, storage_type: storage_type, tags: tags, workflow_id: workflow_id, workflow_owner_id: workflow_owner_id, workflow_type: workflow_type, workflow_version_name: workflow_version_name)
        start_run(input)
      end
      def start_run(input : Types::StartRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Starts a variant import job.
      def start_variant_import_job(
        destination_name : String,
        items : Array(Types::VariantImportItemSource),
        role_arn : String,
        annotation_fields : Hash(String, String)? = nil,
        run_left_normalization : Bool? = nil
      ) : Protocol::Request
        input = Types::StartVariantImportRequest.new(destination_name: destination_name, items: items, role_arn: role_arn, annotation_fields: annotation_fields, run_left_normalization: run_left_normalization)
        start_variant_import_job(input)
      end
      def start_variant_import_job(input : Types::StartVariantImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_VARIANT_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource.
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

      # Removes tags from a resource.
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

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Updates an annotation store.
      def update_annotation_store(
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAnnotationStoreRequest.new(name: name, description: description)
        update_annotation_store(input)
      end
      def update_annotation_store(input : Types::UpdateAnnotationStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANNOTATION_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description of an annotation store version.
      def update_annotation_store_version(
        name : String,
        version_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAnnotationStoreVersionRequest.new(name: name, version_name: version_name, description: description)
        update_annotation_store_version(input)
      end
      def update_annotation_store_version(input : Types::UpdateAnnotationStoreVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANNOTATION_STORE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a run cache using its ID and returns a response with no body if the operation is successful.
      # You can update the run cache description, name, or the default run cache behavior with
      # CACHE_ON_FAILURE or CACHE_ALWAYS . To confirm that your run cache settings have been properly
      # updated, use the GetRunCache API operation. For more information, see How call caching works in the
      # Amazon Web Services HealthOmics User Guide .
      def update_run_cache(
        id : String,
        cache_behavior : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRunCacheRequest.new(id: id, cache_behavior: cache_behavior, description: description, name: name)
        update_run_cache(input)
      end
      def update_run_cache(input : Types::UpdateRunCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RUN_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings of a run group and returns a response with no body if the operation is
      # successful. You can update the following settings with UpdateRunGroup : Maximum number of CPUs Run
      # time (measured in minutes) Number of GPUs Number of concurrent runs Group name To confirm that the
      # settings have been successfully updated, use the ListRunGroups or GetRunGroup API operations to
      # verify that the desired changes have been made.
      def update_run_group(
        id : String,
        max_cpus : Int32? = nil,
        max_duration : Int32? = nil,
        max_gpus : Int32? = nil,
        max_runs : Int32? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRunGroupRequest.new(id: id, max_cpus: max_cpus, max_duration: max_duration, max_gpus: max_gpus, max_runs: max_runs, name: name)
        update_run_group(input)
      end
      def update_run_group(input : Types::UpdateRunGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RUN_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update one or more parameters for the sequence store.
      def update_sequence_store(
        id : String,
        client_token : String? = nil,
        description : String? = nil,
        fallback_location : String? = nil,
        name : String? = nil,
        propagated_set_level_tags : Array(String)? = nil,
        s3_access_config : Types::S3AccessConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateSequenceStoreRequest.new(id: id, client_token: client_token, description: description, fallback_location: fallback_location, name: name, propagated_set_level_tags: propagated_set_level_tags, s3_access_config: s3_access_config)
        update_sequence_store(input)
      end
      def update_sequence_store(input : Types::UpdateSequenceStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SEQUENCE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services HealthOmics variant stores and annotation stores will no longer be open to new
      # customers starting November 7, 2025. If you would like to use variant stores or annotation stores,
      # sign up prior to that date. Existing customers can continue to use the service as normal. For more
      # information, see Amazon Web Services HealthOmics variant store and annotation store availability
      # change . Updates a variant store.
      def update_variant_store(
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVariantStoreRequest.new(name: name, description: description)
        update_variant_store(input)
      end
      def update_variant_store(input : Types::UpdateVariantStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VARIANT_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information about a workflow. You can update the following workflow information: Name
      # Description Default storage type Default storage capacity (with workflow ID) This operation returns
      # a response with no body if the operation is successful. You can check the workflow updates by
      # calling the GetWorkflow API operation. For more information, see Update a private workflow in the
      # Amazon Web Services HealthOmics User Guide .
      def update_workflow(
        id : String,
        description : String? = nil,
        name : String? = nil,
        readme_markdown : String? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkflowRequest.new(id: id, description: description, name: name, readme_markdown: readme_markdown, storage_capacity: storage_capacity, storage_type: storage_type)
        update_workflow(input)
      end
      def update_workflow(input : Types::UpdateWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information about the workflow version. For more information, see Workflow versioning in
      # Amazon Web Services HealthOmics in the Amazon Web Services HealthOmics User Guide .
      def update_workflow_version(
        version_name : String,
        workflow_id : String,
        description : String? = nil,
        readme_markdown : String? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkflowVersionRequest.new(version_name: version_name, workflow_id: workflow_id, description: description, readme_markdown: readme_markdown, storage_capacity: storage_capacity, storage_type: storage_type)
        update_workflow_version(input)
      end
      def update_workflow_version(input : Types::UpdateWorkflowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads a specific part of a read set into a sequence store. When you a upload a read set part with
      # a part number that already exists, the new part replaces the existing one. This operation returns a
      # JSON formatted response containing a string identifier that is used to confirm that parts are being
      # added to the intended upload. For more information, see Direct upload to a sequence store in the
      # Amazon Web Services HealthOmics User Guide .
      def upload_read_set_part(
        part_number : Int32,
        part_source : String,
        payload : Bytes,
        sequence_store_id : String,
        upload_id : String
      ) : Protocol::Request
        input = Types::UploadReadSetPartRequest.new(part_number: part_number, part_source: part_source, payload: payload, sequence_store_id: sequence_store_id, upload_id: upload_id)
        upload_read_set_part(input)
      end
      def upload_read_set_part(input : Types::UploadReadSetPartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPLOAD_READ_SET_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
