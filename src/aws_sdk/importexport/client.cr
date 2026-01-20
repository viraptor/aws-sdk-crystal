module AwsSdk
  module ImportExport
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

      # This operation cancels a specified job. Only the job owner can cancel it. The operation fails if the
      # job has already started or is complete.

      def cancel_job(
        job_id : String,
        api_version : String? = nil
      ) : Types::CancelJobOutput

        input = Types::CancelJobInput.new(job_id: job_id, api_version: api_version)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobInput) : Types::CancelJobOutput
        request = Protocol::Query.build_request(Model::CANCEL_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CancelJobOutput, "CancelJob")
      end

      # This operation initiates the process of scheduling an upload or download of your data. You include
      # in the request a manifest that describes the data transfer specifics. The response to the request
      # includes a job ID, which you can use in other operations, a signature that you use to identify your
      # storage device, and the address where you should ship your storage device.

      def create_job(
        job_type : String,
        manifest : String,
        validate_only : Bool,
        api_version : String? = nil,
        manifest_addendum : String? = nil
      ) : Types::CreateJobOutput

        input = Types::CreateJobInput.new(job_type: job_type, manifest: manifest, validate_only: validate_only, api_version: api_version, manifest_addendum: manifest_addendum)
        create_job(input)
      end

      def create_job(input : Types::CreateJobInput) : Types::CreateJobOutput
        request = Protocol::Query.build_request(Model::CREATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateJobOutput, "CreateJob")
      end

      # This operation generates a pre-paid UPS shipping label that you will use to ship your device to AWS
      # for processing.

      def get_shipping_label(
        job_ids : Array(String),
        api_version : String? = nil,
        city : String? = nil,
        company : String? = nil,
        country : String? = nil,
        name : String? = nil,
        phone_number : String? = nil,
        postal_code : String? = nil,
        state_or_province : String? = nil,
        street1 : String? = nil,
        street2 : String? = nil,
        street3 : String? = nil
      ) : Types::GetShippingLabelOutput

        input = Types::GetShippingLabelInput.new(job_ids: job_ids, api_version: api_version, city: city, company: company, country: country, name: name, phone_number: phone_number, postal_code: postal_code, state_or_province: state_or_province, street1: street1, street2: street2, street3: street3)
        get_shipping_label(input)
      end

      def get_shipping_label(input : Types::GetShippingLabelInput) : Types::GetShippingLabelOutput
        request = Protocol::Query.build_request(Model::GET_SHIPPING_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetShippingLabelOutput, "GetShippingLabel")
      end

      # This operation returns information about a job, including where the job is in the processing
      # pipeline, the status of the results, and the signature value associated with the job. You can only
      # return information about jobs you own.

      def get_status(
        job_id : String,
        api_version : String? = nil
      ) : Types::GetStatusOutput

        input = Types::GetStatusInput.new(job_id: job_id, api_version: api_version)
        get_status(input)
      end

      def get_status(input : Types::GetStatusInput) : Types::GetStatusOutput
        request = Protocol::Query.build_request(Model::GET_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetStatusOutput, "GetStatus")
      end

      # This operation returns the jobs associated with the requester. AWS Import/Export lists the jobs in
      # reverse chronological order based on the date of creation. For example if Job Test1 was created
      # 2009Dec30 and Test2 was created 2010Feb05, the ListJobs operation would return Test2 followed by
      # Test1.

      def list_jobs(
        api_version : String? = nil,
        marker : String? = nil,
        max_jobs : Int32? = nil
      ) : Types::ListJobsOutput

        input = Types::ListJobsInput.new(api_version: api_version, marker: marker, max_jobs: max_jobs)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsInput) : Types::ListJobsOutput
        request = Protocol::Query.build_request(Model::LIST_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListJobsOutput, "ListJobs")
      end

      # You use this operation to change the parameters specified in the original manifest file by supplying
      # a new manifest file. The manifest file attached to this request replaces the original manifest file.
      # You can only use the operation after a CreateJob request but before the data transfer starts and you
      # can only use it on jobs you own.

      def update_job(
        job_id : String,
        job_type : String,
        manifest : String,
        validate_only : Bool,
        api_version : String? = nil
      ) : Types::UpdateJobOutput

        input = Types::UpdateJobInput.new(job_id: job_id, job_type: job_type, manifest: manifest, validate_only: validate_only, api_version: api_version)
        update_job(input)
      end

      def update_job(input : Types::UpdateJobInput) : Types::UpdateJobOutput
        request = Protocol::Query.build_request(Model::UPDATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateJobOutput, "UpdateJob")
      end
    end
  end
end
