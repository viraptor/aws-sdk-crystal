module AwsSdk
  module VoiceID
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

      # Associates the fraudsters with the watchlist specified in the same domain.
      def associate_fraudster(
        domain_id : String,
        fraudster_id : String,
        watchlist_id : String
      ) : Types::AssociateFraudsterResponse
        input = Types::AssociateFraudsterRequest.new(domain_id: domain_id, fraudster_id: fraudster_id, watchlist_id: watchlist_id)
        associate_fraudster(input)
      end
      def associate_fraudster(input : Types::AssociateFraudsterRequest) : Types::AssociateFraudsterResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FRAUDSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFraudsterResponse, "AssociateFraudster")
      end

      # Creates a domain that contains all Amazon Connect Voice ID data, such as speakers, fraudsters,
      # customer audio, and voiceprints. Every domain is created with a default watchlist that fraudsters
      # can be a part of.
      def create_domain(
        name : String,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDomainResponse
        input = Types::CreateDomainRequest.new(name: name, server_side_encryption_configuration: server_side_encryption_configuration, client_token: client_token, description: description, tags: tags)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Types::CreateDomainResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDomainResponse, "CreateDomain")
      end

      # Creates a watchlist that fraudsters can be a part of.
      def create_watchlist(
        domain_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreateWatchlistResponse
        input = Types::CreateWatchlistRequest.new(domain_id: domain_id, name: name, client_token: client_token, description: description)
        create_watchlist(input)
      end
      def create_watchlist(input : Types::CreateWatchlistRequest) : Types::CreateWatchlistResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WATCHLIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWatchlistResponse, "CreateWatchlist")
      end

      # Deletes the specified domain from Voice ID.
      def delete_domain(
        domain_id : String
      ) : Nil
        input = Types::DeleteDomainRequest.new(domain_id: domain_id)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified fraudster from Voice ID. This action disassociates the fraudster from any
      # watchlists it is a part of.
      def delete_fraudster(
        domain_id : String,
        fraudster_id : String
      ) : Nil
        input = Types::DeleteFraudsterRequest.new(domain_id: domain_id, fraudster_id: fraudster_id)
        delete_fraudster(input)
      end
      def delete_fraudster(input : Types::DeleteFraudsterRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FRAUDSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified speaker from Voice ID.
      def delete_speaker(
        domain_id : String,
        speaker_id : String
      ) : Nil
        input = Types::DeleteSpeakerRequest.new(domain_id: domain_id, speaker_id: speaker_id)
        delete_speaker(input)
      end
      def delete_speaker(input : Types::DeleteSpeakerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SPEAKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified watchlist from Voice ID. This API throws an exception when there are
      # fraudsters in the watchlist that you are trying to delete. You must delete the fraudsters, and then
      # delete the watchlist. Every domain has a default watchlist which cannot be deleted.
      def delete_watchlist(
        domain_id : String,
        watchlist_id : String
      ) : Nil
        input = Types::DeleteWatchlistRequest.new(domain_id: domain_id, watchlist_id: watchlist_id)
        delete_watchlist(input)
      end
      def delete_watchlist(input : Types::DeleteWatchlistRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WATCHLIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes the specified domain.
      def describe_domain(
        domain_id : String
      ) : Types::DescribeDomainResponse
        input = Types::DescribeDomainRequest.new(domain_id: domain_id)
        describe_domain(input)
      end
      def describe_domain(input : Types::DescribeDomainRequest) : Types::DescribeDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDomainResponse, "DescribeDomain")
      end

      # Describes the specified fraudster.
      def describe_fraudster(
        domain_id : String,
        fraudster_id : String
      ) : Types::DescribeFraudsterResponse
        input = Types::DescribeFraudsterRequest.new(domain_id: domain_id, fraudster_id: fraudster_id)
        describe_fraudster(input)
      end
      def describe_fraudster(input : Types::DescribeFraudsterRequest) : Types::DescribeFraudsterResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FRAUDSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFraudsterResponse, "DescribeFraudster")
      end

      # Describes the specified fraudster registration job.
      def describe_fraudster_registration_job(
        domain_id : String,
        job_id : String
      ) : Types::DescribeFraudsterRegistrationJobResponse
        input = Types::DescribeFraudsterRegistrationJobRequest.new(domain_id: domain_id, job_id: job_id)
        describe_fraudster_registration_job(input)
      end
      def describe_fraudster_registration_job(input : Types::DescribeFraudsterRegistrationJobRequest) : Types::DescribeFraudsterRegistrationJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FRAUDSTER_REGISTRATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFraudsterRegistrationJobResponse, "DescribeFraudsterRegistrationJob")
      end

      # Describes the specified speaker.
      def describe_speaker(
        domain_id : String,
        speaker_id : String
      ) : Types::DescribeSpeakerResponse
        input = Types::DescribeSpeakerRequest.new(domain_id: domain_id, speaker_id: speaker_id)
        describe_speaker(input)
      end
      def describe_speaker(input : Types::DescribeSpeakerRequest) : Types::DescribeSpeakerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SPEAKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSpeakerResponse, "DescribeSpeaker")
      end

      # Describes the specified speaker enrollment job.
      def describe_speaker_enrollment_job(
        domain_id : String,
        job_id : String
      ) : Types::DescribeSpeakerEnrollmentJobResponse
        input = Types::DescribeSpeakerEnrollmentJobRequest.new(domain_id: domain_id, job_id: job_id)
        describe_speaker_enrollment_job(input)
      end
      def describe_speaker_enrollment_job(input : Types::DescribeSpeakerEnrollmentJobRequest) : Types::DescribeSpeakerEnrollmentJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SPEAKER_ENROLLMENT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSpeakerEnrollmentJobResponse, "DescribeSpeakerEnrollmentJob")
      end

      # Describes the specified watchlist.
      def describe_watchlist(
        domain_id : String,
        watchlist_id : String
      ) : Types::DescribeWatchlistResponse
        input = Types::DescribeWatchlistRequest.new(domain_id: domain_id, watchlist_id: watchlist_id)
        describe_watchlist(input)
      end
      def describe_watchlist(input : Types::DescribeWatchlistRequest) : Types::DescribeWatchlistResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WATCHLIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWatchlistResponse, "DescribeWatchlist")
      end

      # Disassociates the fraudsters from the watchlist specified. Voice ID always expects a fraudster to be
      # a part of at least one watchlist. If you try to disassociate a fraudster from its only watchlist, a
      # ValidationException is thrown.
      def disassociate_fraudster(
        domain_id : String,
        fraudster_id : String,
        watchlist_id : String
      ) : Types::DisassociateFraudsterResponse
        input = Types::DisassociateFraudsterRequest.new(domain_id: domain_id, fraudster_id: fraudster_id, watchlist_id: watchlist_id)
        disassociate_fraudster(input)
      end
      def disassociate_fraudster(input : Types::DisassociateFraudsterRequest) : Types::DisassociateFraudsterResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FRAUDSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFraudsterResponse, "DisassociateFraudster")
      end

      # Evaluates a specified session based on audio data accumulated during a streaming Amazon Connect
      # Voice ID call.
      def evaluate_session(
        domain_id : String,
        session_name_or_id : String
      ) : Types::EvaluateSessionResponse
        input = Types::EvaluateSessionRequest.new(domain_id: domain_id, session_name_or_id: session_name_or_id)
        evaluate_session(input)
      end
      def evaluate_session(input : Types::EvaluateSessionRequest) : Types::EvaluateSessionResponse
        request = Protocol::JsonRpc.build_request(Model::EVALUATE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EvaluateSessionResponse, "EvaluateSession")
      end

      # Lists all the domains in the Amazon Web Services account.
      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDomainsResponse
        input = Types::ListDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Types::ListDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDomainsResponse, "ListDomains")
      end

      # Lists all the fraudster registration jobs in the domain with the given JobStatus . If JobStatus is
      # not provided, this lists all fraudster registration jobs in the given domain.
      def list_fraudster_registration_jobs(
        domain_id : String,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFraudsterRegistrationJobsResponse
        input = Types::ListFraudsterRegistrationJobsRequest.new(domain_id: domain_id, job_status: job_status, max_results: max_results, next_token: next_token)
        list_fraudster_registration_jobs(input)
      end
      def list_fraudster_registration_jobs(input : Types::ListFraudsterRegistrationJobsRequest) : Types::ListFraudsterRegistrationJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FRAUDSTER_REGISTRATION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFraudsterRegistrationJobsResponse, "ListFraudsterRegistrationJobs")
      end

      # Lists all fraudsters in a specified watchlist or domain.
      def list_fraudsters(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        watchlist_id : String? = nil
      ) : Types::ListFraudstersResponse
        input = Types::ListFraudstersRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token, watchlist_id: watchlist_id)
        list_fraudsters(input)
      end
      def list_fraudsters(input : Types::ListFraudstersRequest) : Types::ListFraudstersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FRAUDSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFraudstersResponse, "ListFraudsters")
      end

      # Lists all the speaker enrollment jobs in the domain with the specified JobStatus . If JobStatus is
      # not provided, this lists all jobs with all possible speaker enrollment job statuses.
      def list_speaker_enrollment_jobs(
        domain_id : String,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSpeakerEnrollmentJobsResponse
        input = Types::ListSpeakerEnrollmentJobsRequest.new(domain_id: domain_id, job_status: job_status, max_results: max_results, next_token: next_token)
        list_speaker_enrollment_jobs(input)
      end
      def list_speaker_enrollment_jobs(input : Types::ListSpeakerEnrollmentJobsRequest) : Types::ListSpeakerEnrollmentJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SPEAKER_ENROLLMENT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSpeakerEnrollmentJobsResponse, "ListSpeakerEnrollmentJobs")
      end

      # Lists all speakers in a specified domain.
      def list_speakers(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSpeakersResponse
        input = Types::ListSpeakersRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_speakers(input)
      end
      def list_speakers(input : Types::ListSpeakersRequest) : Types::ListSpeakersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SPEAKERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSpeakersResponse, "ListSpeakers")
      end

      # Lists all tags associated with a specified Voice ID resource.
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

      # Lists all watchlists in a specified domain.
      def list_watchlists(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWatchlistsResponse
        input = Types::ListWatchlistsRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_watchlists(input)
      end
      def list_watchlists(input : Types::ListWatchlistsRequest) : Types::ListWatchlistsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WATCHLISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWatchlistsResponse, "ListWatchlists")
      end

      # Opts out a speaker from Voice ID. A speaker can be opted out regardless of whether or not they
      # already exist in Voice ID. If they don't yet exist, a new speaker is created in an opted out state.
      # If they already exist, their existing status is overridden and they are opted out. Enrollment and
      # evaluation authentication requests are rejected for opted out speakers, and opted out speakers have
      # no voice embeddings stored in Voice ID.
      def opt_out_speaker(
        domain_id : String,
        speaker_id : String
      ) : Types::OptOutSpeakerResponse
        input = Types::OptOutSpeakerRequest.new(domain_id: domain_id, speaker_id: speaker_id)
        opt_out_speaker(input)
      end
      def opt_out_speaker(input : Types::OptOutSpeakerRequest) : Types::OptOutSpeakerResponse
        request = Protocol::JsonRpc.build_request(Model::OPT_OUT_SPEAKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::OptOutSpeakerResponse, "OptOutSpeaker")
      end

      # Starts a new batch fraudster registration job using provided details.
      def start_fraudster_registration_job(
        data_access_role_arn : String,
        domain_id : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        client_token : String? = nil,
        job_name : String? = nil,
        registration_config : Types::RegistrationConfig? = nil
      ) : Types::StartFraudsterRegistrationJobResponse
        input = Types::StartFraudsterRegistrationJobRequest.new(data_access_role_arn: data_access_role_arn, domain_id: domain_id, input_data_config: input_data_config, output_data_config: output_data_config, client_token: client_token, job_name: job_name, registration_config: registration_config)
        start_fraudster_registration_job(input)
      end
      def start_fraudster_registration_job(input : Types::StartFraudsterRegistrationJobRequest) : Types::StartFraudsterRegistrationJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_FRAUDSTER_REGISTRATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFraudsterRegistrationJobResponse, "StartFraudsterRegistrationJob")
      end

      # Starts a new batch speaker enrollment job using specified details.
      def start_speaker_enrollment_job(
        data_access_role_arn : String,
        domain_id : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        client_token : String? = nil,
        enrollment_config : Types::EnrollmentConfig? = nil,
        job_name : String? = nil
      ) : Types::StartSpeakerEnrollmentJobResponse
        input = Types::StartSpeakerEnrollmentJobRequest.new(data_access_role_arn: data_access_role_arn, domain_id: domain_id, input_data_config: input_data_config, output_data_config: output_data_config, client_token: client_token, enrollment_config: enrollment_config, job_name: job_name)
        start_speaker_enrollment_job(input)
      end
      def start_speaker_enrollment_job(input : Types::StartSpeakerEnrollmentJobRequest) : Types::StartSpeakerEnrollmentJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_SPEAKER_ENROLLMENT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSpeakerEnrollmentJobResponse, "StartSpeakerEnrollmentJob")
      end

      # Tags a Voice ID resource with the provided list of tags.
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

      # Removes specified tags from a specified Amazon Connect Voice ID resource.
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

      # Updates the specified domain. This API has clobber behavior, and clears and replaces all attributes.
      # If an optional field, such as 'Description' is not provided, it is removed from the domain.
      def update_domain(
        domain_id : String,
        name : String,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
        description : String? = nil
      ) : Types::UpdateDomainResponse
        input = Types::UpdateDomainRequest.new(domain_id: domain_id, name: name, server_side_encryption_configuration: server_side_encryption_configuration, description: description)
        update_domain(input)
      end
      def update_domain(input : Types::UpdateDomainRequest) : Types::UpdateDomainResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainResponse, "UpdateDomain")
      end

      # Updates the specified watchlist. Every domain has a default watchlist which cannot be updated.
      def update_watchlist(
        domain_id : String,
        watchlist_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Types::UpdateWatchlistResponse
        input = Types::UpdateWatchlistRequest.new(domain_id: domain_id, watchlist_id: watchlist_id, description: description, name: name)
        update_watchlist(input)
      end
      def update_watchlist(input : Types::UpdateWatchlistRequest) : Types::UpdateWatchlistResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WATCHLIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWatchlistResponse, "UpdateWatchlist")
      end
    end
  end
end
