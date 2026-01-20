module AwsSdk
  module ConnectCampaigns
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

      # Creates a campaign for the specified Amazon Connect account. This API is idempotent.

      def create_campaign(
        connect_instance_id : String,
        dialer_config : Types::DialerConfig,
        name : String,
        outbound_call_config : Types::OutboundCallConfig,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCampaignRequest.new(connect_instance_id: connect_instance_id, dialer_config: dialer_config, name: name, outbound_call_config: outbound_call_config, tags: tags)
        create_campaign(input)
      end

      def create_campaign(input : Types::CreateCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a campaign from the specified Amazon Connect account.

      def delete_campaign(
        id : String
      ) : Protocol::Request
        input = Types::DeleteCampaignRequest.new(id: id)
        delete_campaign(input)
      end

      def delete_campaign(input : Types::DeleteCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a connect instance config from the specified AWS account.

      def delete_connect_instance_config(
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectInstanceConfigRequest.new(connect_instance_id: connect_instance_id)
        delete_connect_instance_config(input)
      end

      def delete_connect_instance_config(input : Types::DeleteConnectInstanceConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECT_INSTANCE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the Connect Campaigns onboarding job for the specified Amazon Connect instance.

      def delete_instance_onboarding_job(
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::DeleteInstanceOnboardingJobRequest.new(connect_instance_id: connect_instance_id)
        delete_instance_onboarding_job(input)
      end

      def delete_instance_onboarding_job(input : Types::DeleteInstanceOnboardingJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INSTANCE_ONBOARDING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specific campaign.

      def describe_campaign(
        id : String
      ) : Protocol::Request
        input = Types::DescribeCampaignRequest.new(id: id)
        describe_campaign(input)
      end

      def describe_campaign(input : Types::DescribeCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get state of a campaign for the specified Amazon Connect account.

      def get_campaign_state(
        id : String
      ) : Protocol::Request
        input = Types::GetCampaignStateRequest.new(id: id)
        get_campaign_state(input)
      end

      def get_campaign_state(input : Types::GetCampaignStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get state of campaigns for the specified Amazon Connect account.

      def get_campaign_state_batch(
        campaign_ids : Array(String)
      ) : Protocol::Request
        input = Types::GetCampaignStateBatchRequest.new(campaign_ids: campaign_ids)
        get_campaign_state_batch(input)
      end

      def get_campaign_state_batch(input : Types::GetCampaignStateBatchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_STATE_BATCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the specific Connect instance config.

      def get_connect_instance_config(
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::GetConnectInstanceConfigRequest.new(connect_instance_id: connect_instance_id)
        get_connect_instance_config(input)
      end

      def get_connect_instance_config(input : Types::GetConnectInstanceConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECT_INSTANCE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the specific instance onboarding job status.

      def get_instance_onboarding_job_status(
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::GetInstanceOnboardingJobStatusRequest.new(connect_instance_id: connect_instance_id)
        get_instance_onboarding_job_status(input)
      end

      def get_instance_onboarding_job_status(input : Types::GetInstanceOnboardingJobStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSTANCE_ONBOARDING_JOB_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the campaigns under the specified Amazon Connect account.

      def list_campaigns(
        filters : Types::CampaignFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCampaignsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_campaigns(input)
      end

      def list_campaigns(input : Types::ListCampaignsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CAMPAIGNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List tags for a resource.

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

      # Pauses a campaign for the specified Amazon Connect account.

      def pause_campaign(
        id : String
      ) : Protocol::Request
        input = Types::PauseCampaignRequest.new(id: id)
        pause_campaign(input)
      end

      def pause_campaign(input : Types::PauseCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PAUSE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates dials requests for the specified campaign Amazon Connect account. This API is idempotent.

      def put_dial_request_batch(
        dial_requests : Array(Types::DialRequest),
        id : String
      ) : Protocol::Request
        input = Types::PutDialRequestBatchRequest.new(dial_requests: dial_requests, id: id)
        put_dial_request_batch(input)
      end

      def put_dial_request_batch(input : Types::PutDialRequestBatchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DIAL_REQUEST_BATCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a campaign for the specified Amazon Connect account.

      def resume_campaign(
        id : String
      ) : Protocol::Request
        input = Types::ResumeCampaignRequest.new(id: id)
        resume_campaign(input)
      end

      def resume_campaign(input : Types::ResumeCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESUME_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a campaign for the specified Amazon Connect account.

      def start_campaign(
        id : String
      ) : Protocol::Request
        input = Types::StartCampaignRequest.new(id: id)
        start_campaign(input)
      end

      def start_campaign(input : Types::StartCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Onboard the specific Amazon Connect instance to Connect Campaigns.

      def start_instance_onboarding_job(
        connect_instance_id : String,
        encryption_config : Types::EncryptionConfig
      ) : Protocol::Request
        input = Types::StartInstanceOnboardingJobRequest.new(connect_instance_id: connect_instance_id, encryption_config: encryption_config)
        start_instance_onboarding_job(input)
      end

      def start_instance_onboarding_job(input : Types::StartInstanceOnboardingJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INSTANCE_ONBOARDING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a campaign for the specified Amazon Connect account.

      def stop_campaign(
        id : String
      ) : Protocol::Request
        input = Types::StopCampaignRequest.new(id: id)
        stop_campaign(input)
      end

      def stop_campaign(input : Types::StopCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tag a resource.

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

      # Untag a resource.

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

      # Updates the dialer config of a campaign. This API is idempotent.

      def update_campaign_dialer_config(
        dialer_config : Types::DialerConfig,
        id : String
      ) : Protocol::Request
        input = Types::UpdateCampaignDialerConfigRequest.new(dialer_config: dialer_config, id: id)
        update_campaign_dialer_config(input)
      end

      def update_campaign_dialer_config(input : Types::UpdateCampaignDialerConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_DIALER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name of a campaign. This API is idempotent.

      def update_campaign_name(
        id : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateCampaignNameRequest.new(id: id, name: name)
        update_campaign_name(input)
      end

      def update_campaign_name(input : Types::UpdateCampaignNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the outbound call config of a campaign. This API is idempotent.

      def update_campaign_outbound_call_config(
        id : String,
        answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
        connect_contact_flow_id : String? = nil,
        connect_source_phone_number : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCampaignOutboundCallConfigRequest.new(id: id, answer_machine_detection_config: answer_machine_detection_config, connect_contact_flow_id: connect_contact_flow_id, connect_source_phone_number: connect_source_phone_number)
        update_campaign_outbound_call_config(input)
      end

      def update_campaign_outbound_call_config(input : Types::UpdateCampaignOutboundCallConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_OUTBOUND_CALL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
