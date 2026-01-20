module Aws
  module ConnectCampaignsV2
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

      # Creates a campaign for the specified Amazon Connect account. This API is idempotent.

      def create_campaign(
        connect_instance_id : String,
        name : String,
        channel_subtype_config : Types::ChannelSubtypeConfig? = nil,
        communication_limits_override : Types::CommunicationLimitsConfig? = nil,
        communication_time_config : Types::CommunicationTimeConfig? = nil,
        connect_campaign_flow_arn : String? = nil,
        schedule : Types::Schedule? = nil,
        source : Types::Source? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateCampaignRequest.new(connect_instance_id: connect_instance_id, name: name, channel_subtype_config: channel_subtype_config, communication_limits_override: communication_limits_override, communication_time_config: communication_time_config, connect_campaign_flow_arn: connect_campaign_flow_arn, schedule: schedule, source: source, tags: tags, type: type)
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

      # Deletes the channel subtype config of a campaign. This API is idempotent.

      def delete_campaign_channel_subtype_config(
        channel_subtype : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteCampaignChannelSubtypeConfigRequest.new(channel_subtype: channel_subtype, id: id)
        delete_campaign_channel_subtype_config(input)
      end

      def delete_campaign_channel_subtype_config(input : Types::DeleteCampaignChannelSubtypeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAMPAIGN_CHANNEL_SUBTYPE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the communication limits config for a campaign. This API is idempotent.

      def delete_campaign_communication_limits(
        config : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteCampaignCommunicationLimitsRequest.new(config: config, id: id)
        delete_campaign_communication_limits(input)
      end

      def delete_campaign_communication_limits(input : Types::DeleteCampaignCommunicationLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAMPAIGN_COMMUNICATION_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the communication time config for a campaign. This API is idempotent.

      def delete_campaign_communication_time(
        config : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteCampaignCommunicationTimeRequest.new(config: config, id: id)
        delete_campaign_communication_time(input)
      end

      def delete_campaign_communication_time(input : Types::DeleteCampaignCommunicationTimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAMPAIGN_COMMUNICATION_TIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a connect instance config from the specified AWS account.

      def delete_connect_instance_config(
        connect_instance_id : String,
        campaign_deletion_policy : String? = nil
      ) : Protocol::Request
        input = Types::DeleteConnectInstanceConfigRequest.new(connect_instance_id: connect_instance_id, campaign_deletion_policy: campaign_deletion_policy)
        delete_connect_instance_config(input)
      end

      def delete_connect_instance_config(input : Types::DeleteConnectInstanceConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECT_INSTANCE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the integration for the specified Amazon Connect instance.

      def delete_connect_instance_integration(
        connect_instance_id : String,
        integration_identifier : Types::IntegrationIdentifier
      ) : Protocol::Request
        input = Types::DeleteConnectInstanceIntegrationRequest.new(connect_instance_id: connect_instance_id, integration_identifier: integration_identifier)
        delete_connect_instance_integration(input)
      end

      def delete_connect_instance_integration(input : Types::DeleteConnectInstanceIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECT_INSTANCE_INTEGRATION, input, endpoint)
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

      # Get the instance communication limits.

      def get_instance_communication_limits(
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::GetInstanceCommunicationLimitsRequest.new(connect_instance_id: connect_instance_id)
        get_instance_communication_limits(input)
      end

      def get_instance_communication_limits(input : Types::GetInstanceCommunicationLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSTANCE_COMMUNICATION_LIMITS, input, endpoint)
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

      # Provides summary information about the integration under the specified Connect instance.

      def list_connect_instance_integrations(
        connect_instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectInstanceIntegrationsRequest.new(connect_instance_id: connect_instance_id, max_results: max_results, next_token: next_token)
        list_connect_instance_integrations(input)
      end

      def list_connect_instance_integrations(input : Types::ListConnectInstanceIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECT_INSTANCE_INTEGRATIONS, input, endpoint)
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

      # Put or update the integration for the specified Amazon Connect instance.

      def put_connect_instance_integration(
        connect_instance_id : String,
        integration_config : Types::IntegrationConfig
      ) : Protocol::Request
        input = Types::PutConnectInstanceIntegrationRequest.new(connect_instance_id: connect_instance_id, integration_config: integration_config)
        put_connect_instance_integration(input)
      end

      def put_connect_instance_integration(input : Types::PutConnectInstanceIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONNECT_INSTANCE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put the instance communication limits. This API is idempotent.

      def put_instance_communication_limits(
        communication_limits_config : Types::InstanceCommunicationLimitsConfig,
        connect_instance_id : String
      ) : Protocol::Request
        input = Types::PutInstanceCommunicationLimitsRequest.new(communication_limits_config: communication_limits_config, connect_instance_id: connect_instance_id)
        put_instance_communication_limits(input)
      end

      def put_instance_communication_limits(input : Types::PutInstanceCommunicationLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INSTANCE_COMMUNICATION_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates outbound requests for the specified campaign Amazon Connect account. This API is idempotent.

      def put_outbound_request_batch(
        id : String,
        outbound_requests : Array(Types::OutboundRequest)
      ) : Protocol::Request
        input = Types::PutOutboundRequestBatchRequest.new(id: id, outbound_requests: outbound_requests)
        put_outbound_request_batch(input)
      end

      def put_outbound_request_batch(input : Types::PutOutboundRequestBatchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_OUTBOUND_REQUEST_BATCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Takes in a list of profile outbound requests to be placed as part of an outbound campaign. This API
      # is idempotent.

      def put_profile_outbound_request_batch(
        id : String,
        profile_outbound_requests : Array(Types::ProfileOutboundRequest)
      ) : Protocol::Request
        input = Types::PutProfileOutboundRequestBatchRequest.new(id: id, profile_outbound_requests: profile_outbound_requests)
        put_profile_outbound_request_batch(input)
      end

      def put_profile_outbound_request_batch(input : Types::PutProfileOutboundRequestBatchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PROFILE_OUTBOUND_REQUEST_BATCH, input, endpoint)
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

      # Updates the channel subtype config of a campaign. This API is idempotent.

      def update_campaign_channel_subtype_config(
        channel_subtype_config : Types::ChannelSubtypeConfig,
        id : String
      ) : Protocol::Request
        input = Types::UpdateCampaignChannelSubtypeConfigRequest.new(channel_subtype_config: channel_subtype_config, id: id)
        update_campaign_channel_subtype_config(input)
      end

      def update_campaign_channel_subtype_config(input : Types::UpdateCampaignChannelSubtypeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_CHANNEL_SUBTYPE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the communication limits config for a campaign. This API is idempotent.

      def update_campaign_communication_limits(
        communication_limits_override : Types::CommunicationLimitsConfig,
        id : String
      ) : Protocol::Request
        input = Types::UpdateCampaignCommunicationLimitsRequest.new(communication_limits_override: communication_limits_override, id: id)
        update_campaign_communication_limits(input)
      end

      def update_campaign_communication_limits(input : Types::UpdateCampaignCommunicationLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_COMMUNICATION_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the communication time config for a campaign. This API is idempotent.

      def update_campaign_communication_time(
        communication_time_config : Types::CommunicationTimeConfig,
        id : String
      ) : Protocol::Request
        input = Types::UpdateCampaignCommunicationTimeRequest.new(communication_time_config: communication_time_config, id: id)
        update_campaign_communication_time(input)
      end

      def update_campaign_communication_time(input : Types::UpdateCampaignCommunicationTimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_COMMUNICATION_TIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the campaign flow associated with a campaign. This API is idempotent.

      def update_campaign_flow_association(
        connect_campaign_flow_arn : String,
        id : String
      ) : Protocol::Request
        input = Types::UpdateCampaignFlowAssociationRequest.new(connect_campaign_flow_arn: connect_campaign_flow_arn, id: id)
        update_campaign_flow_association(input)
      end

      def update_campaign_flow_association(input : Types::UpdateCampaignFlowAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_FLOW_ASSOCIATION, input, endpoint)
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

      # Updates the schedule for a campaign. This API is idempotent.

      def update_campaign_schedule(
        id : String,
        schedule : Types::Schedule
      ) : Protocol::Request
        input = Types::UpdateCampaignScheduleRequest.new(id: id, schedule: schedule)
        update_campaign_schedule(input)
      end

      def update_campaign_schedule(input : Types::UpdateCampaignScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the campaign source with a campaign. This API is idempotent.

      def update_campaign_source(
        id : String,
        source : Types::Source
      ) : Protocol::Request
        input = Types::UpdateCampaignSourceRequest.new(id: id, source: source)
        update_campaign_source(input)
      end

      def update_campaign_source(input : Types::UpdateCampaignSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
