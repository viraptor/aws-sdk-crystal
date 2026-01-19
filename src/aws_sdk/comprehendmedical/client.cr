module AwsSdk
  module ComprehendMedical
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

      # Gets the properties associated with a medical entities detection job. Use this operation to get the
      # status of a detection job.
      def describe_entities_detection_v2_job(
        job_id : String
      ) : Types::DescribeEntitiesDetectionV2JobResponse
        input = Types::DescribeEntitiesDetectionV2JobRequest.new(job_id: job_id)
        describe_entities_detection_v2_job(input)
      end
      def describe_entities_detection_v2_job(input : Types::DescribeEntitiesDetectionV2JobRequest) : Types::DescribeEntitiesDetectionV2JobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITIES_DETECTION_V2_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntitiesDetectionV2JobResponse, "DescribeEntitiesDetectionV2Job")
      end

      # Gets the properties associated with an InferICD10CM job. Use this operation to get the status of an
      # inference job.
      def describe_icd10_cm_inference_job(
        job_id : String
      ) : Types::DescribeICD10CMInferenceJobResponse
        input = Types::DescribeICD10CMInferenceJobRequest.new(job_id: job_id)
        describe_icd10_cm_inference_job(input)
      end
      def describe_icd10_cm_inference_job(input : Types::DescribeICD10CMInferenceJobRequest) : Types::DescribeICD10CMInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ICD10_CM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeICD10CMInferenceJobResponse, "DescribeICD10CMInferenceJob")
      end

      # Gets the properties associated with a protected health information (PHI) detection job. Use this
      # operation to get the status of a detection job.
      def describe_phi_detection_job(
        job_id : String
      ) : Types::DescribePHIDetectionJobResponse
        input = Types::DescribePHIDetectionJobRequest.new(job_id: job_id)
        describe_phi_detection_job(input)
      end
      def describe_phi_detection_job(input : Types::DescribePHIDetectionJobRequest) : Types::DescribePHIDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PHI_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePHIDetectionJobResponse, "DescribePHIDetectionJob")
      end

      # Gets the properties associated with an InferRxNorm job. Use this operation to get the status of an
      # inference job.
      def describe_rx_norm_inference_job(
        job_id : String
      ) : Types::DescribeRxNormInferenceJobResponse
        input = Types::DescribeRxNormInferenceJobRequest.new(job_id: job_id)
        describe_rx_norm_inference_job(input)
      end
      def describe_rx_norm_inference_job(input : Types::DescribeRxNormInferenceJobRequest) : Types::DescribeRxNormInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RX_NORM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRxNormInferenceJobResponse, "DescribeRxNormInferenceJob")
      end

      # Gets the properties associated with an InferSNOMEDCT job. Use this operation to get the status of an
      # inference job.
      def describe_snomedct_inference_job(
        job_id : String
      ) : Types::DescribeSNOMEDCTInferenceJobResponse
        input = Types::DescribeSNOMEDCTInferenceJobRequest.new(job_id: job_id)
        describe_snomedct_inference_job(input)
      end
      def describe_snomedct_inference_job(input : Types::DescribeSNOMEDCTInferenceJobRequest) : Types::DescribeSNOMEDCTInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SNOMEDCT_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSNOMEDCTInferenceJobResponse, "DescribeSNOMEDCTInferenceJob")
      end

      # The DetectEntities operation is deprecated. You should use the DetectEntitiesV2 operation instead.
      # Inspects the clinical text for a variety of medical entities and returns specific information about
      # them such as entity category, location, and confidence score on that information.
      def detect_entities(
        text : String
      ) : Types::DetectEntitiesResponse
        input = Types::DetectEntitiesRequest.new(text: text)
        detect_entities(input)
      end
      def detect_entities(input : Types::DetectEntitiesRequest) : Types::DetectEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectEntitiesResponse, "DetectEntities")
      end

      # Inspects the clinical text for a variety of medical entities and returns specific information about
      # them such as entity category, location, and confidence score on that information. Amazon Comprehend
      # Medical only detects medical entities in English language texts. The DetectEntitiesV2 operation
      # replaces the DetectEntities operation. This new action uses a different model for determining the
      # entities in your medical text and changes the way that some entities are returned in the output. You
      # should use the DetectEntitiesV2 operation in all new applications. The DetectEntitiesV2 operation
      # returns the Acuity and Direction entities as attributes instead of types.
      def detect_entities_v2(
        text : String
      ) : Types::DetectEntitiesV2Response
        input = Types::DetectEntitiesV2Request.new(text: text)
        detect_entities_v2(input)
      end
      def detect_entities_v2(input : Types::DetectEntitiesV2Request) : Types::DetectEntitiesV2Response
        request = Protocol::JsonRpc.build_request(Model::DETECT_ENTITIES_V2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectEntitiesV2Response, "DetectEntitiesV2")
      end

      # Inspects the clinical text for protected health information (PHI) entities and returns the entity
      # category, location, and confidence score for each entity. Amazon Comprehend Medical only detects
      # entities in English language texts.
      def detect_phi(
        text : String
      ) : Types::DetectPHIResponse
        input = Types::DetectPHIRequest.new(text: text)
        detect_phi(input)
      end
      def detect_phi(input : Types::DetectPHIRequest) : Types::DetectPHIResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_PHI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectPHIResponse, "DetectPHI")
      end

      # InferICD10CM detects medical conditions as entities listed in a patient record and links those
      # entities to normalized concept identifiers in the ICD-10-CM knowledge base from the Centers for
      # Disease Control. Amazon Comprehend Medical only detects medical entities in English language texts.
      def infer_icd10_cm(
        text : String
      ) : Types::InferICD10CMResponse
        input = Types::InferICD10CMRequest.new(text: text)
        infer_icd10_cm(input)
      end
      def infer_icd10_cm(input : Types::InferICD10CMRequest) : Types::InferICD10CMResponse
        request = Protocol::JsonRpc.build_request(Model::INFER_ICD10_CM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InferICD10CMResponse, "InferICD10CM")
      end

      # InferRxNorm detects medications as entities listed in a patient record and links to the normalized
      # concept identifiers in the RxNorm database from the National Library of Medicine. Amazon Comprehend
      # Medical only detects medical entities in English language texts.
      def infer_rx_norm(
        text : String
      ) : Types::InferRxNormResponse
        input = Types::InferRxNormRequest.new(text: text)
        infer_rx_norm(input)
      end
      def infer_rx_norm(input : Types::InferRxNormRequest) : Types::InferRxNormResponse
        request = Protocol::JsonRpc.build_request(Model::INFER_RX_NORM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InferRxNormResponse, "InferRxNorm")
      end

      # InferSNOMEDCT detects possible medical concepts as entities and links them to codes from the
      # Systematized Nomenclature of Medicine, Clinical Terms (SNOMED-CT) ontology
      def infer_snomedct(
        text : String
      ) : Types::InferSNOMEDCTResponse
        input = Types::InferSNOMEDCTRequest.new(text: text)
        infer_snomedct(input)
      end
      def infer_snomedct(input : Types::InferSNOMEDCTRequest) : Types::InferSNOMEDCTResponse
        request = Protocol::JsonRpc.build_request(Model::INFER_SNOMEDCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InferSNOMEDCTResponse, "InferSNOMEDCT")
      end

      # Gets a list of medical entity detection jobs that you have submitted.
      def list_entities_detection_v2_jobs(
        filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntitiesDetectionV2JobsResponse
        input = Types::ListEntitiesDetectionV2JobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_entities_detection_v2_jobs(input)
      end
      def list_entities_detection_v2_jobs(input : Types::ListEntitiesDetectionV2JobsRequest) : Types::ListEntitiesDetectionV2JobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITIES_DETECTION_V2_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntitiesDetectionV2JobsResponse, "ListEntitiesDetectionV2Jobs")
      end

      # Gets a list of InferICD10CM jobs that you have submitted.
      def list_icd10_cm_inference_jobs(
        filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListICD10CMInferenceJobsResponse
        input = Types::ListICD10CMInferenceJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_icd10_cm_inference_jobs(input)
      end
      def list_icd10_cm_inference_jobs(input : Types::ListICD10CMInferenceJobsRequest) : Types::ListICD10CMInferenceJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ICD10_CM_INFERENCE_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListICD10CMInferenceJobsResponse, "ListICD10CMInferenceJobs")
      end

      # Gets a list of protected health information (PHI) detection jobs you have submitted.
      def list_phi_detection_jobs(
        filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPHIDetectionJobsResponse
        input = Types::ListPHIDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_phi_detection_jobs(input)
      end
      def list_phi_detection_jobs(input : Types::ListPHIDetectionJobsRequest) : Types::ListPHIDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PHI_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPHIDetectionJobsResponse, "ListPHIDetectionJobs")
      end

      # Gets a list of InferRxNorm jobs that you have submitted.
      def list_rx_norm_inference_jobs(
        filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRxNormInferenceJobsResponse
        input = Types::ListRxNormInferenceJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_rx_norm_inference_jobs(input)
      end
      def list_rx_norm_inference_jobs(input : Types::ListRxNormInferenceJobsRequest) : Types::ListRxNormInferenceJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RX_NORM_INFERENCE_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRxNormInferenceJobsResponse, "ListRxNormInferenceJobs")
      end

      # Gets a list of InferSNOMEDCT jobs a user has submitted.
      def list_snomedct_inference_jobs(
        filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSNOMEDCTInferenceJobsResponse
        input = Types::ListSNOMEDCTInferenceJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_snomedct_inference_jobs(input)
      end
      def list_snomedct_inference_jobs(input : Types::ListSNOMEDCTInferenceJobsRequest) : Types::ListSNOMEDCTInferenceJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SNOMEDCT_INFERENCE_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSNOMEDCTInferenceJobsResponse, "ListSNOMEDCTInferenceJobs")
      end

      # Starts an asynchronous medical entity detection job for a collection of documents. Use the
      # DescribeEntitiesDetectionV2Job operation to track the status of a job.
      def start_entities_detection_v2_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key : String? = nil
      ) : Types::StartEntitiesDetectionV2JobResponse
        input = Types::StartEntitiesDetectionV2JobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, kms_key: kms_key)
        start_entities_detection_v2_job(input)
      end
      def start_entities_detection_v2_job(input : Types::StartEntitiesDetectionV2JobRequest) : Types::StartEntitiesDetectionV2JobResponse
        request = Protocol::JsonRpc.build_request(Model::START_ENTITIES_DETECTION_V2_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEntitiesDetectionV2JobResponse, "StartEntitiesDetectionV2Job")
      end

      # Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM ontology. Use
      # the DescribeICD10CMInferenceJob operation to track the status of a job.
      def start_icd10_cm_inference_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key : String? = nil
      ) : Types::StartICD10CMInferenceJobResponse
        input = Types::StartICD10CMInferenceJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, kms_key: kms_key)
        start_icd10_cm_inference_job(input)
      end
      def start_icd10_cm_inference_job(input : Types::StartICD10CMInferenceJobRequest) : Types::StartICD10CMInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_ICD10_CM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartICD10CMInferenceJobResponse, "StartICD10CMInferenceJob")
      end

      # Starts an asynchronous job to detect protected health information (PHI). Use the
      # DescribePHIDetectionJob operation to track the status of a job.
      def start_phi_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key : String? = nil
      ) : Types::StartPHIDetectionJobResponse
        input = Types::StartPHIDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, kms_key: kms_key)
        start_phi_detection_job(input)
      end
      def start_phi_detection_job(input : Types::StartPHIDetectionJobRequest) : Types::StartPHIDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_PHI_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartPHIDetectionJobResponse, "StartPHIDetectionJob")
      end

      # Starts an asynchronous job to detect medication entities and link them to the RxNorm ontology. Use
      # the DescribeRxNormInferenceJob operation to track the status of a job.
      def start_rx_norm_inference_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key : String? = nil
      ) : Types::StartRxNormInferenceJobResponse
        input = Types::StartRxNormInferenceJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, kms_key: kms_key)
        start_rx_norm_inference_job(input)
      end
      def start_rx_norm_inference_job(input : Types::StartRxNormInferenceJobRequest) : Types::StartRxNormInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_RX_NORM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRxNormInferenceJobResponse, "StartRxNormInferenceJob")
      end

      # Starts an asynchronous job to detect medical concepts and link them to the SNOMED-CT ontology. Use
      # the DescribeSNOMEDCTInferenceJob operation to track the status of a job.
      def start_snomedct_inference_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key : String? = nil
      ) : Types::StartSNOMEDCTInferenceJobResponse
        input = Types::StartSNOMEDCTInferenceJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, kms_key: kms_key)
        start_snomedct_inference_job(input)
      end
      def start_snomedct_inference_job(input : Types::StartSNOMEDCTInferenceJobRequest) : Types::StartSNOMEDCTInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_SNOMEDCT_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSNOMEDCTInferenceJobResponse, "StartSNOMEDCTInferenceJob")
      end

      # Stops a medical entities detection job in progress.
      def stop_entities_detection_v2_job(
        job_id : String
      ) : Types::StopEntitiesDetectionV2JobResponse
        input = Types::StopEntitiesDetectionV2JobRequest.new(job_id: job_id)
        stop_entities_detection_v2_job(input)
      end
      def stop_entities_detection_v2_job(input : Types::StopEntitiesDetectionV2JobRequest) : Types::StopEntitiesDetectionV2JobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ENTITIES_DETECTION_V2_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopEntitiesDetectionV2JobResponse, "StopEntitiesDetectionV2Job")
      end

      # Stops an InferICD10CM inference job in progress.
      def stop_icd10_cm_inference_job(
        job_id : String
      ) : Types::StopICD10CMInferenceJobResponse
        input = Types::StopICD10CMInferenceJobRequest.new(job_id: job_id)
        stop_icd10_cm_inference_job(input)
      end
      def stop_icd10_cm_inference_job(input : Types::StopICD10CMInferenceJobRequest) : Types::StopICD10CMInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ICD10_CM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopICD10CMInferenceJobResponse, "StopICD10CMInferenceJob")
      end

      # Stops a protected health information (PHI) detection job in progress.
      def stop_phi_detection_job(
        job_id : String
      ) : Types::StopPHIDetectionJobResponse
        input = Types::StopPHIDetectionJobRequest.new(job_id: job_id)
        stop_phi_detection_job(input)
      end
      def stop_phi_detection_job(input : Types::StopPHIDetectionJobRequest) : Types::StopPHIDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_PHI_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopPHIDetectionJobResponse, "StopPHIDetectionJob")
      end

      # Stops an InferRxNorm inference job in progress.
      def stop_rx_norm_inference_job(
        job_id : String
      ) : Types::StopRxNormInferenceJobResponse
        input = Types::StopRxNormInferenceJobRequest.new(job_id: job_id)
        stop_rx_norm_inference_job(input)
      end
      def stop_rx_norm_inference_job(input : Types::StopRxNormInferenceJobRequest) : Types::StopRxNormInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_RX_NORM_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRxNormInferenceJobResponse, "StopRxNormInferenceJob")
      end

      # Stops an InferSNOMEDCT inference job in progress.
      def stop_snomedct_inference_job(
        job_id : String
      ) : Types::StopSNOMEDCTInferenceJobResponse
        input = Types::StopSNOMEDCTInferenceJobRequest.new(job_id: job_id)
        stop_snomedct_inference_job(input)
      end
      def stop_snomedct_inference_job(input : Types::StopSNOMEDCTInferenceJobRequest) : Types::StopSNOMEDCTInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_SNOMEDCT_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopSNOMEDCTInferenceJobResponse, "StopSNOMEDCTInferenceJob")
      end
    end
  end
end
