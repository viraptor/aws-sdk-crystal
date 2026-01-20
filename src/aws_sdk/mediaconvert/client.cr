module AwsSdk
  module MediaConvert
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

      # Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental
      # MediaConvert.

      def associate_certificate(
        arn : String
      ) : Protocol::Request
        input = Types::AssociateCertificateRequest.new(arn: arn)
        associate_certificate(input)
      end

      def associate_certificate(input : Types::AssociateCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently cancel a job. Once you have canceled a job, you can't start it again.

      def cancel_job(
        id : String
      ) : Protocol::Request
        input = Types::CancelJobRequest.new(id: id)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new transcoding job. For information about jobs and job settings, see the User Guide at
      # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      def create_job(
        role : String,
        settings : Types::JobSettings,
        acceleration_settings : Types::AccelerationSettings? = nil,
        billing_tags_source : String? = nil,
        client_request_token : String? = nil,
        hop_destinations : Array(Types::HopDestination)? = nil,
        job_engine_version : String? = nil,
        job_template : String? = nil,
        priority : Int32? = nil,
        queue : String? = nil,
        simulate_reserved_queue : String? = nil,
        status_update_interval : String? = nil,
        tags : Hash(String, String)? = nil,
        user_metadata : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateJobRequest.new(role: role, settings: settings, acceleration_settings: acceleration_settings, billing_tags_source: billing_tags_source, client_request_token: client_request_token, hop_destinations: hop_destinations, job_engine_version: job_engine_version, job_template: job_template, priority: priority, queue: queue, simulate_reserved_queue: simulate_reserved_queue, status_update_interval: status_update_interval, tags: tags, user_metadata: user_metadata)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new job template. For information about job templates see the User Guide at
      # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      def create_job_template(
        name : String,
        settings : Types::JobTemplateSettings,
        acceleration_settings : Types::AccelerationSettings? = nil,
        category : String? = nil,
        description : String? = nil,
        hop_destinations : Array(Types::HopDestination)? = nil,
        priority : Int32? = nil,
        queue : String? = nil,
        status_update_interval : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateJobTemplateRequest.new(name: name, settings: settings, acceleration_settings: acceleration_settings, category: category, description: description, hop_destinations: hop_destinations, priority: priority, queue: queue, status_update_interval: status_update_interval, tags: tags)
        create_job_template(input)
      end

      def create_job_template(input : Types::CreateJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new preset. For information about job templates see the User Guide at
      # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      def create_preset(
        name : String,
        settings : Types::PresetSettings,
        category : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePresetRequest.new(name: name, settings: settings, category: category, description: description, tags: tags)
        create_preset(input)
      end

      def create_preset(input : Types::CreatePresetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new transcoding queue. For information about queues, see Working With Queues in the User
      # Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html

      def create_queue(
        name : String,
        concurrent_jobs : Int32? = nil,
        description : String? = nil,
        pricing_plan : String? = nil,
        reservation_plan_settings : Types::ReservationPlanSettings? = nil,
        status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQueueRequest.new(name: name, concurrent_jobs: concurrent_jobs, description: description, pricing_plan: pricing_plan, reservation_plan_settings: reservation_plan_settings, status: status, tags: tags)
        create_queue(input)
      end

      def create_queue(input : Types::CreateQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new resource share request for MediaConvert resources with AWS Support.

      def create_resource_share(
        job_id : String,
        support_case_id : String
      ) : Protocol::Request
        input = Types::CreateResourceShareRequest.new(job_id: job_id, support_case_id: support_case_id)
        create_resource_share(input)
      end

      def create_resource_share(input : Types::CreateResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently delete a job template you have created.

      def delete_job_template(
        name : String
      ) : Protocol::Request
        input = Types::DeleteJobTemplateRequest.new(name: name)
        delete_job_template(input)
      end

      def delete_job_template(input : Types::DeleteJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently delete a policy that you created.

      def delete_policy : Protocol::Request
        input = Types::DeletePolicyRequest.new
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently delete a preset you have created.

      def delete_preset(
        name : String
      ) : Protocol::Request
        input = Types::DeletePresetRequest.new(name: name)
        delete_preset(input)
      end

      def delete_preset(input : Types::DeletePresetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently delete a queue you have created.

      def delete_queue(
        name : String
      ) : Protocol::Request
        input = Types::DeleteQueueRequest.new(name: name)
        delete_queue(input)
      end

      def delete_queue(input : Types::DeleteQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send a request with an empty body to the regional API endpoint to get your account API endpoint.
      # Note that DescribeEndpoints is no longer required. We recommend that you send your requests directly
      # to the regional endpoint instead.

      def describe_endpoints(
        max_results : Int32? = nil,
        mode : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeEndpointsRequest.new(max_results: max_results, mode: mode, next_token: next_token)
        describe_endpoints(input)
      end

      def describe_endpoints(input : Types::DescribeEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM)
      # certificate and an AWS Elemental MediaConvert resource.

      def disassociate_certificate(
        arn : String
      ) : Protocol::Request
        input = Types::DisassociateCertificateRequest.new(arn: arn)
        disassociate_certificate(input)
      end

      def disassociate_certificate(input : Types::DisassociateCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the JSON for a specific transcoding job.

      def get_job(
        id : String
      ) : Protocol::Request
        input = Types::GetJobRequest.new(id: id)
        get_job(input)
      end

      def get_job(input : Types::GetJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the JSON for a specific job template.

      def get_job_template(
        name : String
      ) : Protocol::Request
        input = Types::GetJobTemplateRequest.new(name: name)
        get_job_template(input)
      end

      def get_job_template(input : Types::GetJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array of up to twenty of your most recent jobs matched by a jobs query.

      def get_jobs_query_results(
        id : String
      ) : Protocol::Request
        input = Types::GetJobsQueryResultsRequest.new(id: id)
        get_jobs_query_results(input)
      end

      def get_jobs_query_results(input : Types::GetJobsQueryResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOBS_QUERY_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the JSON for your policy.

      def get_policy : Protocol::Request
        input = Types::GetPolicyRequest.new
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the JSON for a specific preset.

      def get_preset(
        name : String
      ) : Protocol::Request
        input = Types::GetPresetRequest.new(name: name)
        get_preset(input)
      end

      def get_preset(input : Types::GetPresetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the JSON for a specific queue.

      def get_queue(
        name : String
      ) : Protocol::Request
        input = Types::GetQueueRequest.new(name: name)
        get_queue(input)
      end

      def get_queue(input : Types::GetQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array of up to twenty of your job templates. This will return the templates
      # themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string
      # returned with the array

      def list_job_templates(
        category : String? = nil,
        list_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil
      ) : Protocol::Request
        input = Types::ListJobTemplatesRequest.new(category: category, list_by: list_by, max_results: max_results, next_token: next_token, order: order)
        list_job_templates(input)
      end

      def list_job_templates(input : Types::ListJobTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes
      # in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of
      # the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the
      # array.

      def list_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil,
        queue : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(max_results: max_results, next_token: next_token, order: order, queue: queue, status: status)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not
      # just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the
      # array.

      def list_presets(
        category : String? = nil,
        list_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil
      ) : Protocol::Request
        input = Types::ListPresetsRequest.new(category: category, list_by: list_by, max_results: max_results, next_token: next_token, order: order)
        list_presets(input)
      end

      def list_presets(input : Types::ListPresetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRESETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not
      # just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the
      # array.

      def list_queues(
        list_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil
      ) : Protocol::Request
        input = Types::ListQueuesRequest.new(list_by: list_by, max_results: max_results, next_token: next_token, order: order)
        list_queues(input)
      end

      def list_queues(input : Types::ListQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the tags for a MediaConvert resource.

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

      # Retrieve a JSON array of all available Job engine versions and the date they expire.

      def list_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVersionsRequest.new(max_results: max_results, next_token: next_token)
        list_versions(input)
      end

      def list_versions(input : Types::ListVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use Probe to obtain detailed information about your input media files. Probe returns a JSON that
      # includes container, codec, frame rate, resolution, track count, audio layout, captions, and more.
      # You can use this information to learn more about your media files, or to help make decisions while
      # automating your transcoding workflow.

      def probe(
        input_files : Array(Types::ProbeInputFile)? = nil
      ) : Protocol::Request
        input = Types::ProbeRequest.new(input_files: input_files)
        probe(input)
      end

      def probe(input : Types::ProbeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PROBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create or change your policy. For more information about policies, see the user guide at
      # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      def put_policy(
        policy : Types::Policy
      ) : Protocol::Request
        input = Types::PutPolicyRequest.new(policy: policy)
        put_policy(input)
      end

      def put_policy(input : Types::PutPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a JSON array that includes job details for up to twenty of your most recent jobs.
      # Optionally filter results further according to input file, queue, or status. To retrieve the twenty
      # next most recent jobs, use the nextToken string returned with the array.

      def search_jobs(
        input_file : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil,
        queue : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::SearchJobsRequest.new(input_file: input_file, max_results: max_results, next_token: next_token, order: order, queue: queue, status: status)
        search_jobs(input)
      end

      def search_jobs(input : Types::SearchJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start an asynchronous jobs query using the provided filters. To receive the list of jobs that match
      # your query, call the GetJobsQueryResults API using the query ID returned by this API.

      def start_jobs_query(
        filter_list : Array(Types::JobsQueryFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil
      ) : Protocol::Request
        input = Types::StartJobsQueryRequest.new(filter_list: filter_list, max_results: max_results, next_token: next_token, order: order)
        start_jobs_query(input)
      end

      def start_jobs_query(input : Types::StartJobsQueryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOBS_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the
      # User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html

      def tag_resource(
        arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see
      # the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html

      def untag_resource(
        arn : String,
        tag_keys : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modify one of your existing job templates.

      def update_job_template(
        name : String,
        acceleration_settings : Types::AccelerationSettings? = nil,
        category : String? = nil,
        description : String? = nil,
        hop_destinations : Array(Types::HopDestination)? = nil,
        priority : Int32? = nil,
        queue : String? = nil,
        settings : Types::JobTemplateSettings? = nil,
        status_update_interval : String? = nil
      ) : Protocol::Request
        input = Types::UpdateJobTemplateRequest.new(name: name, acceleration_settings: acceleration_settings, category: category, description: description, hop_destinations: hop_destinations, priority: priority, queue: queue, settings: settings, status_update_interval: status_update_interval)
        update_job_template(input)
      end

      def update_job_template(input : Types::UpdateJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modify one of your existing presets.

      def update_preset(
        name : String,
        category : String? = nil,
        description : String? = nil,
        settings : Types::PresetSettings? = nil
      ) : Protocol::Request
        input = Types::UpdatePresetRequest.new(name: name, category: category, description: description, settings: settings)
        update_preset(input)
      end

      def update_preset(input : Types::UpdatePresetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modify one of your existing queues.

      def update_queue(
        name : String,
        concurrent_jobs : Int32? = nil,
        description : String? = nil,
        reservation_plan_settings : Types::ReservationPlanSettings? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQueueRequest.new(name: name, concurrent_jobs: concurrent_jobs, description: description, reservation_plan_settings: reservation_plan_settings, status: status)
        update_queue(input)
      end

      def update_queue(input : Types::UpdateQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
