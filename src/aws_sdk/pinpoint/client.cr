module AwsSdk
  module Pinpoint
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

      # Creates an application.

      def create_app(
        create_application_request : Types::CreateApplicationRequest
      ) : Protocol::Request
        input = Types::CreateAppRequest.new(create_application_request: create_application_request)
        create_app(input)
      end

      def create_app(input : Types::CreateAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new campaign for an application or updates the settings of an existing campaign for an
      # application.

      def create_campaign(
        application_id : String,
        write_campaign_request : Types::WriteCampaignRequest
      ) : Protocol::Request
        input = Types::CreateCampaignRequest.new(application_id: application_id, write_campaign_request: write_campaign_request)
        create_campaign(input)
      end

      def create_campaign(input : Types::CreateCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a message template for messages that are sent through the email channel.

      def create_email_template(
        email_template_request : Types::EmailTemplateRequest,
        template_name : String
      ) : Protocol::Request
        input = Types::CreateEmailTemplateRequest.new(email_template_request: email_template_request, template_name: template_name)
        create_email_template(input)
      end

      def create_email_template(input : Types::CreateEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an export job for an application.

      def create_export_job(
        application_id : String,
        export_job_request : Types::ExportJobRequest
      ) : Protocol::Request
        input = Types::CreateExportJobRequest.new(application_id: application_id, export_job_request: export_job_request)
        create_export_job(input)
      end

      def create_export_job(input : Types::CreateExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an import job for an application.

      def create_import_job(
        application_id : String,
        import_job_request : Types::ImportJobRequest
      ) : Protocol::Request
        input = Types::CreateImportJobRequest.new(application_id: application_id, import_job_request: import_job_request)
        create_import_job(input)
      end

      def create_import_job(input : Types::CreateImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new message template for messages using the in-app message channel.

      def create_in_app_template(
        in_app_template_request : Types::InAppTemplateRequest,
        template_name : String
      ) : Protocol::Request
        input = Types::CreateInAppTemplateRequest.new(in_app_template_request: in_app_template_request, template_name: template_name)
        create_in_app_template(input)
      end

      def create_in_app_template(input : Types::CreateInAppTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IN_APP_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a journey for an application.

      def create_journey(
        application_id : String,
        write_journey_request : Types::WriteJourneyRequest
      ) : Protocol::Request
        input = Types::CreateJourneyRequest.new(application_id: application_id, write_journey_request: write_journey_request)
        create_journey(input)
      end

      def create_journey(input : Types::CreateJourneyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOURNEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a message template for messages that are sent through a push notification channel.

      def create_push_template(
        push_notification_template_request : Types::PushNotificationTemplateRequest,
        template_name : String
      ) : Protocol::Request
        input = Types::CreatePushTemplateRequest.new(push_notification_template_request: push_notification_template_request, template_name: template_name)
        create_push_template(input)
      end

      def create_push_template(input : Types::CreatePushTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PUSH_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Pinpoint configuration for a recommender model.

      def create_recommender_configuration(
        create_recommender_configuration : Types::CreateRecommenderConfiguration
      ) : Protocol::Request
        input = Types::CreateRecommenderConfigurationRequest.new(create_recommender_configuration: create_recommender_configuration)
        create_recommender_configuration(input)
      end

      def create_recommender_configuration(input : Types::CreateRecommenderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECOMMENDER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new segment for an application or updates the configuration, dimension, and other settings
      # for an existing segment that's associated with an application.

      def create_segment(
        application_id : String,
        write_segment_request : Types::WriteSegmentRequest
      ) : Protocol::Request
        input = Types::CreateSegmentRequest.new(application_id: application_id, write_segment_request: write_segment_request)
        create_segment(input)
      end

      def create_segment(input : Types::CreateSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a message template for messages that are sent through the SMS channel.

      def create_sms_template(
        sms_template_request : Types::SMSTemplateRequest,
        template_name : String
      ) : Protocol::Request
        input = Types::CreateSmsTemplateRequest.new(sms_template_request: sms_template_request, template_name: template_name)
        create_sms_template(input)
      end

      def create_sms_template(input : Types::CreateSmsTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SMS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a message template for messages that are sent through the voice channel.

      def create_voice_template(
        template_name : String,
        voice_template_request : Types::VoiceTemplateRequest
      ) : Protocol::Request
        input = Types::CreateVoiceTemplateRequest.new(template_name: template_name, voice_template_request: voice_template_request)
        create_voice_template(input)
      end

      def create_voice_template(input : Types::CreateVoiceTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOICE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the ADM channel for an application and deletes any existing settings for the channel.

      def delete_adm_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteAdmChannelRequest.new(application_id: application_id)
        delete_adm_channel(input)
      end

      def delete_adm_channel(input : Types::DeleteAdmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ADM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the APNs channel for an application and deletes any existing settings for the channel.

      def delete_apns_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApnsChannelRequest.new(application_id: application_id)
        delete_apns_channel(input)
      end

      def delete_apns_channel(input : Types::DeleteApnsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APNS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the APNs sandbox channel for an application and deletes any existing settings for the
      # channel.

      def delete_apns_sandbox_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApnsSandboxChannelRequest.new(application_id: application_id)
        delete_apns_sandbox_channel(input)
      end

      def delete_apns_sandbox_channel(input : Types::DeleteApnsSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APNS_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.

      def delete_apns_voip_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApnsVoipChannelRequest.new(application_id: application_id)
        delete_apns_voip_channel(input)
      end

      def delete_apns_voip_channel(input : Types::DeleteApnsVoipChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APNS_VOIP_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the
      # channel.

      def delete_apns_voip_sandbox_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApnsVoipSandboxChannelRequest.new(application_id: application_id)
        delete_apns_voip_sandbox_channel(input)
      end

      def delete_apns_voip_sandbox_channel(input : Types::DeleteApnsVoipSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APNS_VOIP_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an application.

      def delete_app(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteAppRequest.new(application_id: application_id)
        delete_app(input)
      end

      def delete_app(input : Types::DeleteAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the Baidu channel for an application and deletes any existing settings for the channel.

      def delete_baidu_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteBaiduChannelRequest.new(application_id: application_id)
        delete_baidu_channel(input)
      end

      def delete_baidu_channel(input : Types::DeleteBaiduChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BAIDU_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a campaign from an application.

      def delete_campaign(
        application_id : String,
        campaign_id : String
      ) : Protocol::Request
        input = Types::DeleteCampaignRequest.new(application_id: application_id, campaign_id: campaign_id)
        delete_campaign(input)
      end

      def delete_campaign(input : Types::DeleteCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the email channel for an application and deletes any existing settings for the channel.

      def delete_email_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteEmailChannelRequest.new(application_id: application_id)
        delete_email_channel(input)
      end

      def delete_email_channel(input : Types::DeleteEmailChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a message template for messages that were sent through the email channel.

      def delete_email_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteEmailTemplateRequest.new(template_name: template_name, version: version)
        delete_email_template(input)
      end

      def delete_email_template(input : Types::DeleteEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an endpoint from an application.

      def delete_endpoint(
        application_id : String,
        endpoint_id : String
      ) : Protocol::Request
        input = Types::DeleteEndpointRequest.new(application_id: application_id, endpoint_id: endpoint_id)
        delete_endpoint(input)
      end

      def delete_endpoint(input : Types::DeleteEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the event stream for an application.

      def delete_event_stream(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteEventStreamRequest.new(application_id: application_id)
        delete_event_stream(input)
      end

      def delete_event_stream(input : Types::DeleteEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the GCM channel for an application and deletes any existing settings for the channel.

      def delete_gcm_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteGcmChannelRequest.new(application_id: application_id)
        delete_gcm_channel(input)
      end

      def delete_gcm_channel(input : Types::DeleteGcmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GCM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a message template for messages sent using the in-app message channel.

      def delete_in_app_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteInAppTemplateRequest.new(template_name: template_name, version: version)
        delete_in_app_template(input)
      end

      def delete_in_app_template(input : Types::DeleteInAppTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IN_APP_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a journey from an application.

      def delete_journey(
        application_id : String,
        journey_id : String
      ) : Protocol::Request
        input = Types::DeleteJourneyRequest.new(application_id: application_id, journey_id: journey_id)
        delete_journey(input)
      end

      def delete_journey(input : Types::DeleteJourneyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOURNEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a message template for messages that were sent through a push notification channel.

      def delete_push_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::DeletePushTemplateRequest.new(template_name: template_name, version: version)
        delete_push_template(input)
      end

      def delete_push_template(input : Types::DeletePushTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PUSH_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Pinpoint configuration for a recommender model.

      def delete_recommender_configuration(
        recommender_id : String
      ) : Protocol::Request
        input = Types::DeleteRecommenderConfigurationRequest.new(recommender_id: recommender_id)
        delete_recommender_configuration(input)
      end

      def delete_recommender_configuration(input : Types::DeleteRecommenderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOMMENDER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a segment from an application.

      def delete_segment(
        application_id : String,
        segment_id : String
      ) : Protocol::Request
        input = Types::DeleteSegmentRequest.new(application_id: application_id, segment_id: segment_id)
        delete_segment(input)
      end

      def delete_segment(input : Types::DeleteSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the SMS channel for an application and deletes any existing settings for the channel.

      def delete_sms_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteSmsChannelRequest.new(application_id: application_id)
        delete_sms_channel(input)
      end

      def delete_sms_channel(input : Types::DeleteSmsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SMS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a message template for messages that were sent through the SMS channel.

      def delete_sms_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteSmsTemplateRequest.new(template_name: template_name, version: version)
        delete_sms_template(input)
      end

      def delete_sms_template(input : Types::DeleteSmsTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SMS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all the endpoints that are associated with a specific user ID.

      def delete_user_endpoints(
        application_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteUserEndpointsRequest.new(application_id: application_id, user_id: user_id)
        delete_user_endpoints(input)
      end

      def delete_user_endpoints(input : Types::DeleteUserEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the voice channel for an application and deletes any existing settings for the channel.

      def delete_voice_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceChannelRequest.new(application_id: application_id)
        delete_voice_channel(input)
      end

      def delete_voice_channel(input : Types::DeleteVoiceChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a message template for messages that were sent through the voice channel.

      def delete_voice_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVoiceTemplateRequest.new(template_name: template_name, version: version)
        delete_voice_template(input)
      end

      def delete_voice_template(input : Types::DeleteVoiceTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the ADM channel for an application.

      def get_adm_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetAdmChannelRequest.new(application_id: application_id)
        get_adm_channel(input)
      end

      def get_adm_channel(input : Types::GetAdmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ADM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the APNs channel for an application.

      def get_apns_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApnsChannelRequest.new(application_id: application_id)
        get_apns_channel(input)
      end

      def get_apns_channel(input : Types::GetApnsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APNS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the APNs sandbox channel for an application.

      def get_apns_sandbox_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApnsSandboxChannelRequest.new(application_id: application_id)
        get_apns_sandbox_channel(input)
      end

      def get_apns_sandbox_channel(input : Types::GetApnsSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APNS_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the APNs VoIP channel for an application.

      def get_apns_voip_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApnsVoipChannelRequest.new(application_id: application_id)
        get_apns_voip_channel(input)
      end

      def get_apns_voip_channel(input : Types::GetApnsVoipChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APNS_VOIP_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the APNs VoIP sandbox channel for an
      # application.

      def get_apns_voip_sandbox_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApnsVoipSandboxChannelRequest.new(application_id: application_id)
        get_apns_voip_sandbox_channel(input)
      end

      def get_apns_voip_sandbox_channel(input : Types::GetApnsVoipSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APNS_VOIP_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an application.

      def get_app(
        application_id : String
      ) : Protocol::Request
        input = Types::GetAppRequest.new(application_id: application_id)
        get_app(input)
      end

      def get_app(input : Types::GetAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.

      def get_application_date_range_kpi(
        application_id : String,
        kpi_name : String,
        end_time : Time? = nil,
        next_token : String? = nil,
        page_size : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetApplicationDateRangeKpiRequest.new(application_id: application_id, kpi_name: kpi_name, end_time: end_time, next_token: next_token, page_size: page_size, start_time: start_time)
        get_application_date_range_kpi(input)
      end

      def get_application_date_range_kpi(input : Types::GetApplicationDateRangeKpiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_DATE_RANGE_KPI, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the settings for an application.

      def get_application_settings(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationSettingsRequest.new(application_id: application_id)
        get_application_settings(input)
      end

      def get_application_settings(input : Types::GetApplicationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the applications that are associated with your Amazon Pinpoint
      # account.

      def get_apps(
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetAppsRequest.new(page_size: page_size, token: token)
        get_apps(input)
      end

      def get_apps(input : Types::GetAppsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the Baidu channel for an application.

      def get_baidu_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetBaiduChannelRequest.new(application_id: application_id)
        get_baidu_channel(input)
      end

      def get_baidu_channel(input : Types::GetBaiduChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BAIDU_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for a campaign.

      def get_campaign(
        application_id : String,
        campaign_id : String
      ) : Protocol::Request
        input = Types::GetCampaignRequest.new(application_id: application_id, campaign_id: campaign_id)
        get_campaign(input)
      end

      def get_campaign(input : Types::GetCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the activities for a campaign.

      def get_campaign_activities(
        application_id : String,
        campaign_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetCampaignActivitiesRequest.new(application_id: application_id, campaign_id: campaign_id, page_size: page_size, token: token)
        get_campaign_activities(input)
      end

      def get_campaign_activities(input : Types::GetCampaignActivitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_ACTIVITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.

      def get_campaign_date_range_kpi(
        application_id : String,
        campaign_id : String,
        kpi_name : String,
        end_time : Time? = nil,
        next_token : String? = nil,
        page_size : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetCampaignDateRangeKpiRequest.new(application_id: application_id, campaign_id: campaign_id, kpi_name: kpi_name, end_time: end_time, next_token: next_token, page_size: page_size, start_time: start_time)
        get_campaign_date_range_kpi(input)
      end

      def get_campaign_date_range_kpi(input : Types::GetCampaignDateRangeKpiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_DATE_RANGE_KPI, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for a specific version of
      # a campaign.

      def get_campaign_version(
        application_id : String,
        campaign_id : String,
        version : String
      ) : Protocol::Request
        input = Types::GetCampaignVersionRequest.new(application_id: application_id, campaign_id: campaign_id, version: version)
        get_campaign_version(input)
      end

      def get_campaign_version(input : Types::GetCampaignVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for all versions of a
      # campaign.

      def get_campaign_versions(
        application_id : String,
        campaign_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetCampaignVersionsRequest.new(application_id: application_id, campaign_id: campaign_id, page_size: page_size, token: token)
        get_campaign_versions(input)
      end

      def get_campaign_versions(input : Types::GetCampaignVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGN_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for all the campaigns that
      # are associated with an application.

      def get_campaigns(
        application_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetCampaignsRequest.new(application_id: application_id, page_size: page_size, token: token)
        get_campaigns(input)
      end

      def get_campaigns(input : Types::GetCampaignsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAMPAIGNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the history and status of each channel for an application.

      def get_channels(
        application_id : String
      ) : Protocol::Request
        input = Types::GetChannelsRequest.new(application_id: application_id)
        get_channels(input)
      end

      def get_channels(input : Types::GetChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the email channel for an application.

      def get_email_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetEmailChannelRequest.new(application_id: application_id)
        get_email_channel(input)
      end

      def get_email_channel(input : Types::GetEmailChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content and settings of a message template for messages that are sent through the
      # email channel.

      def get_email_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::GetEmailTemplateRequest.new(template_name: template_name, version: version)
        get_email_template(input)
      end

      def get_email_template(input : Types::GetEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the settings and attributes of a specific endpoint for an application.

      def get_endpoint(
        application_id : String,
        endpoint_id : String
      ) : Protocol::Request
        input = Types::GetEndpointRequest.new(application_id: application_id, endpoint_id: endpoint_id)
        get_endpoint(input)
      end

      def get_endpoint(input : Types::GetEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the event stream settings for an application.

      def get_event_stream(
        application_id : String
      ) : Protocol::Request
        input = Types::GetEventStreamRequest.new(application_id: application_id)
        get_event_stream(input)
      end

      def get_event_stream(input : Types::GetEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of a specific export job for an application.

      def get_export_job(
        application_id : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetExportJobRequest.new(application_id: application_id, job_id: job_id)
        get_export_job(input)
      end

      def get_export_job(input : Types::GetExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of all the export jobs for an application.

      def get_export_jobs(
        application_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetExportJobsRequest.new(application_id: application_id, page_size: page_size, token: token)
        get_export_jobs(input)
      end

      def get_export_jobs(input : Types::GetExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the GCM channel for an application.

      def get_gcm_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetGcmChannelRequest.new(application_id: application_id)
        get_gcm_channel(input)
      end

      def get_gcm_channel(input : Types::GetGcmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GCM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of a specific import job for an application.

      def get_import_job(
        application_id : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetImportJobRequest.new(application_id: application_id, job_id: job_id)
        get_import_job(input)
      end

      def get_import_job(input : Types::GetImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of all the import jobs for an application.

      def get_import_jobs(
        application_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetImportJobsRequest.new(application_id: application_id, page_size: page_size, token: token)
        get_import_jobs(input)
      end

      def get_import_jobs(input : Types::GetImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the in-app messages targeted for the provided endpoint ID.

      def get_in_app_messages(
        application_id : String,
        endpoint_id : String
      ) : Protocol::Request
        input = Types::GetInAppMessagesRequest.new(application_id: application_id, endpoint_id: endpoint_id)
        get_in_app_messages(input)
      end

      def get_in_app_messages(input : Types::GetInAppMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IN_APP_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content and settings of a message template for messages sent through the in-app
      # channel.

      def get_in_app_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::GetInAppTemplateRequest.new(template_name: template_name, version: version)
        get_in_app_template(input)
      end

      def get_in_app_template(input : Types::GetInAppTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IN_APP_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for a journey.

      def get_journey(
        application_id : String,
        journey_id : String
      ) : Protocol::Request
        input = Types::GetJourneyRequest.new(application_id: application_id, journey_id: journey_id)
        get_journey(input)
      end

      def get_journey(input : Types::GetJourneyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.

      def get_journey_date_range_kpi(
        application_id : String,
        journey_id : String,
        kpi_name : String,
        end_time : Time? = nil,
        next_token : String? = nil,
        page_size : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetJourneyDateRangeKpiRequest.new(application_id: application_id, journey_id: journey_id, kpi_name: kpi_name, end_time: end_time, next_token: next_token, page_size: page_size, start_time: start_time)
        get_journey_date_range_kpi(input)
      end

      def get_journey_date_range_kpi(input : Types::GetJourneyDateRangeKpiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_DATE_RANGE_KPI, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey
      # activity.

      def get_journey_execution_activity_metrics(
        application_id : String,
        journey_activity_id : String,
        journey_id : String,
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::GetJourneyExecutionActivityMetricsRequest.new(application_id: application_id, journey_activity_id: journey_activity_id, journey_id: journey_id, next_token: next_token, page_size: page_size)
        get_journey_execution_activity_metrics(input)
      end

      def get_journey_execution_activity_metrics(input : Types::GetJourneyExecutionActivityMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_EXECUTION_ACTIVITY_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.

      def get_journey_execution_metrics(
        application_id : String,
        journey_id : String,
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::GetJourneyExecutionMetricsRequest.new(application_id: application_id, journey_id: journey_id, next_token: next_token, page_size: page_size)
        get_journey_execution_metrics(input)
      end

      def get_journey_execution_metrics(input : Types::GetJourneyExecutionMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_EXECUTION_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard run execution metric that applies to a
      # journey activity.

      def get_journey_run_execution_activity_metrics(
        application_id : String,
        journey_activity_id : String,
        journey_id : String,
        run_id : String,
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::GetJourneyRunExecutionActivityMetricsRequest.new(application_id: application_id, journey_activity_id: journey_activity_id, journey_id: journey_id, run_id: run_id, next_token: next_token, page_size: page_size)
        get_journey_run_execution_activity_metrics(input)
      end

      def get_journey_run_execution_activity_metrics(input : Types::GetJourneyRunExecutionActivityMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_RUN_EXECUTION_ACTIVITY_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) pre-aggregated data for a standard run execution metric that applies to a
      # journey.

      def get_journey_run_execution_metrics(
        application_id : String,
        journey_id : String,
        run_id : String,
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::GetJourneyRunExecutionMetricsRequest.new(application_id: application_id, journey_id: journey_id, run_id: run_id, next_token: next_token, page_size: page_size)
        get_journey_run_execution_metrics(input)
      end

      def get_journey_run_execution_metrics(input : Types::GetJourneyRunExecutionMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_RUN_EXECUTION_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the runs of a journey.

      def get_journey_runs(
        application_id : String,
        journey_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetJourneyRunsRequest.new(application_id: application_id, journey_id: journey_id, page_size: page_size, token: token)
        get_journey_runs(input)
      end

      def get_journey_runs(input : Types::GetJourneyRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOURNEY_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content and settings of a message template for messages that are sent through a push
      # notification channel.

      def get_push_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::GetPushTemplateRequest.new(template_name: template_name, version: version)
        get_push_template(input)
      end

      def get_push_template(input : Types::GetPushTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PUSH_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an Amazon Pinpoint configuration for a recommender model.

      def get_recommender_configuration(
        recommender_id : String
      ) : Protocol::Request
        input = Types::GetRecommenderConfigurationRequest.new(recommender_id: recommender_id)
        get_recommender_configuration(input)
      end

      def get_recommender_configuration(input : Types::GetRecommenderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the recommender model configurations that are associated with your
      # Amazon Pinpoint account.

      def get_recommender_configurations(
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetRecommenderConfigurationsRequest.new(page_size: page_size, token: token)
        get_recommender_configurations(input)
      end

      def get_recommender_configurations(input : Types::GetRecommenderConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDER_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the configuration, dimension, and other settings for a specific segment
      # that's associated with an application.

      def get_segment(
        application_id : String,
        segment_id : String
      ) : Protocol::Request
        input = Types::GetSegmentRequest.new(application_id: application_id, segment_id: segment_id)
        get_segment(input)
      end

      def get_segment(input : Types::GetSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the export jobs for a segment.

      def get_segment_export_jobs(
        application_id : String,
        segment_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetSegmentExportJobsRequest.new(application_id: application_id, segment_id: segment_id, page_size: page_size, token: token)
        get_segment_export_jobs(input)
      end

      def get_segment_export_jobs(input : Types::GetSegmentExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the import jobs for a segment.

      def get_segment_import_jobs(
        application_id : String,
        segment_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetSegmentImportJobsRequest.new(application_id: application_id, segment_id: segment_id, page_size: page_size, token: token)
        get_segment_import_jobs(input)
      end

      def get_segment_import_jobs(input : Types::GetSegmentImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the configuration, dimension, and other settings for a specific version
      # of a segment that's associated with an application.

      def get_segment_version(
        application_id : String,
        segment_id : String,
        version : String
      ) : Protocol::Request
        input = Types::GetSegmentVersionRequest.new(application_id: application_id, segment_id: segment_id, version: version)
        get_segment_version(input)
      end

      def get_segment_version(input : Types::GetSegmentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the configuration, dimension, and other settings for all the versions of
      # a specific segment that's associated with an application.

      def get_segment_versions(
        application_id : String,
        segment_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetSegmentVersionsRequest.new(application_id: application_id, segment_id: segment_id, page_size: page_size, token: token)
        get_segment_versions(input)
      end

      def get_segment_versions(input : Types::GetSegmentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the configuration, dimension, and other settings for all the segments
      # that are associated with an application.

      def get_segments(
        application_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::GetSegmentsRequest.new(application_id: application_id, page_size: page_size, token: token)
        get_segments(input)
      end

      def get_segments(input : Types::GetSegmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the SMS channel for an application.

      def get_sms_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetSmsChannelRequest.new(application_id: application_id)
        get_sms_channel(input)
      end

      def get_sms_channel(input : Types::GetSmsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SMS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content and settings of a message template for messages that are sent through the SMS
      # channel.

      def get_sms_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::GetSmsTemplateRequest.new(template_name: template_name, version: version)
        get_sms_template(input)
      end

      def get_sms_template(input : Types::GetSmsTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SMS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the endpoints that are associated with a specific user ID.

      def get_user_endpoints(
        application_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::GetUserEndpointsRequest.new(application_id: application_id, user_id: user_id)
        get_user_endpoints(input)
      end

      def get_user_endpoints(input : Types::GetUserEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status and settings of the voice channel for an application.

      def get_voice_channel(
        application_id : String
      ) : Protocol::Request
        input = Types::GetVoiceChannelRequest.new(application_id: application_id)
        get_voice_channel(input)
      end

      def get_voice_channel(input : Types::GetVoiceChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content and settings of a message template for messages that are sent through the
      # voice channel.

      def get_voice_template(
        template_name : String,
        version : String? = nil
      ) : Protocol::Request
        input = Types::GetVoiceTemplateRequest.new(template_name: template_name, version: version)
        get_voice_template(input)
      end

      def get_voice_template(input : Types::GetVoiceTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the status, configuration, and other settings for all the journeys that
      # are associated with an application.

      def list_journeys(
        application_id : String,
        page_size : String? = nil,
        token : String? = nil
      ) : Protocol::Request
        input = Types::ListJourneysRequest.new(application_id: application_id, page_size: page_size, token: token)
        list_journeys(input)
      end

      def list_journeys(input : Types::ListJourneysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOURNEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all the tags (keys and values) that are associated with an application, campaign, message
      # template, or segment.

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

      # Retrieves information about all the versions of a specific message template.

      def list_template_versions(
        template_name : String,
        template_type : String,
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateVersionsRequest.new(template_name: template_name, template_type: template_type, next_token: next_token, page_size: page_size)
        list_template_versions(input)
      end

      def list_template_versions(input : Types::ListTemplateVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the message templates that are associated with your Amazon Pinpoint
      # account.

      def list_templates(
        next_token : String? = nil,
        page_size : String? = nil,
        prefix : String? = nil,
        template_type : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplatesRequest.new(next_token: next_token, page_size: page_size, prefix: prefix, template_type: template_type)
        list_templates(input)
      end

      def list_templates(input : Types::ListTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a phone number.

      def phone_number_validate(
        number_validate_request : Types::NumberValidateRequest
      ) : Protocol::Request
        input = Types::PhoneNumberValidateRequest.new(number_validate_request: number_validate_request)
        phone_number_validate(input)
      end

      def phone_number_validate(input : Types::PhoneNumberValidateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PHONE_NUMBER_VALIDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new event stream for an application or updates the settings of an existing event stream
      # for an application.

      def put_event_stream(
        application_id : String,
        write_event_stream : Types::WriteEventStream
      ) : Protocol::Request
        input = Types::PutEventStreamRequest.new(application_id: application_id, write_event_stream: write_event_stream)
        put_event_stream(input)
      end

      def put_event_stream(input : Types::PutEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new event to record for endpoints, or creates or updates endpoint data that existing
      # events are associated with.

      def put_events(
        application_id : String,
        events_request : Types::EventsRequest
      ) : Protocol::Request
        input = Types::PutEventsRequest.new(application_id: application_id, events_request: events_request)
        put_events(input)
      end

      def put_events(input : Types::PutEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more custom attributes, of the same attribute type, from the application. Existing
      # endpoints still have the attributes but Amazon Pinpoint will stop capturing new or changed values
      # for these attributes.

      def remove_attributes(
        application_id : String,
        attribute_type : String,
        update_attributes_request : Types::UpdateAttributesRequest
      ) : Protocol::Request
        input = Types::RemoveAttributesRequest.new(application_id: application_id, attribute_type: attribute_type, update_attributes_request: update_attributes_request)
        remove_attributes(input)
      end

      def remove_attributes(input : Types::RemoveAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and sends a direct message.

      def send_messages(
        application_id : String,
        message_request : Types::MessageRequest
      ) : Protocol::Request
        input = Types::SendMessagesRequest.new(application_id: application_id, message_request: message_request)
        send_messages(input)
      end

      def send_messages(input : Types::SendMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send an OTP message

      def send_otp_message(
        application_id : String,
        send_otp_message_request_parameters : Types::SendOTPMessageRequestParameters
      ) : Protocol::Request
        input = Types::SendOTPMessageRequest.new(application_id: application_id, send_otp_message_request_parameters: send_otp_message_request_parameters)
        send_otp_message(input)
      end

      def send_otp_message(input : Types::SendOTPMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_OTP_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and sends a message to a list of users.

      def send_users_messages(
        application_id : String,
        send_users_message_request : Types::SendUsersMessageRequest
      ) : Protocol::Request
        input = Types::SendUsersMessagesRequest.new(application_id: application_id, send_users_message_request: send_users_message_request)
        send_users_messages(input)
      end

      def send_users_messages(input : Types::SendUsersMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_USERS_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags (keys and values) to an application, campaign, message template, or segment.

      def tag_resource(
        resource_arn : String,
        tags_model : Types::TagsModel
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags_model: tags_model)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags (keys and values) from an application, campaign, message template, or
      # segment.

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

      # Enables the ADM channel for an application or updates the status and settings of the ADM channel for
      # an application.

      def update_adm_channel(
        adm_channel_request : Types::ADMChannelRequest,
        application_id : String
      ) : Protocol::Request
        input = Types::UpdateAdmChannelRequest.new(adm_channel_request: adm_channel_request, application_id: application_id)
        update_adm_channel(input)
      end

      def update_adm_channel(input : Types::UpdateAdmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ADM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the APNs channel for an application or updates the status and settings of the APNs channel
      # for an application.

      def update_apns_channel(
        apns_channel_request : Types::APNSChannelRequest,
        application_id : String
      ) : Protocol::Request
        input = Types::UpdateApnsChannelRequest.new(apns_channel_request: apns_channel_request, application_id: application_id)
        update_apns_channel(input)
      end

      def update_apns_channel(input : Types::UpdateApnsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APNS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the APNs sandbox channel for an application or updates the status and settings of the APNs
      # sandbox channel for an application.

      def update_apns_sandbox_channel(
        apns_sandbox_channel_request : Types::APNSSandboxChannelRequest,
        application_id : String
      ) : Protocol::Request
        input = Types::UpdateApnsSandboxChannelRequest.new(apns_sandbox_channel_request: apns_sandbox_channel_request, application_id: application_id)
        update_apns_sandbox_channel(input)
      end

      def update_apns_sandbox_channel(input : Types::UpdateApnsSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APNS_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP
      # channel for an application.

      def update_apns_voip_channel(
        apns_voip_channel_request : Types::APNSVoipChannelRequest,
        application_id : String
      ) : Protocol::Request
        input = Types::UpdateApnsVoipChannelRequest.new(apns_voip_channel_request: apns_voip_channel_request, application_id: application_id)
        update_apns_voip_channel(input)
      end

      def update_apns_voip_channel(input : Types::UpdateApnsVoipChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APNS_VOIP_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the
      # APNs VoIP sandbox channel for an application.

      def update_apns_voip_sandbox_channel(
        apns_voip_sandbox_channel_request : Types::APNSVoipSandboxChannelRequest,
        application_id : String
      ) : Protocol::Request
        input = Types::UpdateApnsVoipSandboxChannelRequest.new(apns_voip_sandbox_channel_request: apns_voip_sandbox_channel_request, application_id: application_id)
        update_apns_voip_sandbox_channel(input)
      end

      def update_apns_voip_sandbox_channel(input : Types::UpdateApnsVoipSandboxChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APNS_VOIP_SANDBOX_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for an application.

      def update_application_settings(
        application_id : String,
        write_application_settings_request : Types::WriteApplicationSettingsRequest
      ) : Protocol::Request
        input = Types::UpdateApplicationSettingsRequest.new(application_id: application_id, write_application_settings_request: write_application_settings_request)
        update_application_settings(input)
      end

      def update_application_settings(input : Types::UpdateApplicationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the Baidu channel for an application or updates the status and settings of the Baidu channel
      # for an application.

      def update_baidu_channel(
        application_id : String,
        baidu_channel_request : Types::BaiduChannelRequest
      ) : Protocol::Request
        input = Types::UpdateBaiduChannelRequest.new(application_id: application_id, baidu_channel_request: baidu_channel_request)
        update_baidu_channel(input)
      end

      def update_baidu_channel(input : Types::UpdateBaiduChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BAIDU_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration and other settings for a campaign.

      def update_campaign(
        application_id : String,
        campaign_id : String,
        write_campaign_request : Types::WriteCampaignRequest
      ) : Protocol::Request
        input = Types::UpdateCampaignRequest.new(application_id: application_id, campaign_id: campaign_id, write_campaign_request: write_campaign_request)
        update_campaign(input)
      end

      def update_campaign(input : Types::UpdateCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the email channel for an application or updates the status and settings of the email channel
      # for an application.

      def update_email_channel(
        application_id : String,
        email_channel_request : Types::EmailChannelRequest
      ) : Protocol::Request
        input = Types::UpdateEmailChannelRequest.new(application_id: application_id, email_channel_request: email_channel_request)
        update_email_channel(input)
      end

      def update_email_channel(input : Types::UpdateEmailChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EMAIL_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing message template for messages that are sent through the email channel.

      def update_email_template(
        email_template_request : Types::EmailTemplateRequest,
        template_name : String,
        create_new_version : Bool? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEmailTemplateRequest.new(email_template_request: email_template_request, template_name: template_name, create_new_version: create_new_version, version: version)
        update_email_template(input)
      end

      def update_email_template(input : Types::UpdateEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new endpoint for an application or updates the settings and attributes of an existing
      # endpoint for an application. You can also use this operation to define custom attributes for an
      # endpoint. If an update includes one or more values for a custom attribute, Amazon Pinpoint replaces
      # (overwrites) any existing values with the new values.

      def update_endpoint(
        application_id : String,
        endpoint_id : String,
        endpoint_request : Types::EndpointRequest
      ) : Protocol::Request
        input = Types::UpdateEndpointRequest.new(application_id: application_id, endpoint_id: endpoint_id, endpoint_request: endpoint_request)
        update_endpoint(input)
      end

      def update_endpoint(input : Types::UpdateEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new batch of endpoints for an application or updates the settings and attributes of a
      # batch of existing endpoints for an application. You can also use this operation to define custom
      # attributes for a batch of endpoints. If an update includes one or more values for a custom
      # attribute, Amazon Pinpoint replaces (overwrites) any existing values with the new values.

      def update_endpoints_batch(
        application_id : String,
        endpoint_batch_request : Types::EndpointBatchRequest
      ) : Protocol::Request
        input = Types::UpdateEndpointsBatchRequest.new(application_id: application_id, endpoint_batch_request: endpoint_batch_request)
        update_endpoints_batch(input)
      end

      def update_endpoints_batch(input : Types::UpdateEndpointsBatchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENDPOINTS_BATCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the GCM channel for an application or updates the status and settings of the GCM channel for
      # an application.

      def update_gcm_channel(
        application_id : String,
        gcm_channel_request : Types::GCMChannelRequest
      ) : Protocol::Request
        input = Types::UpdateGcmChannelRequest.new(application_id: application_id, gcm_channel_request: gcm_channel_request)
        update_gcm_channel(input)
      end

      def update_gcm_channel(input : Types::UpdateGcmChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GCM_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing message template for messages sent through the in-app message channel.

      def update_in_app_template(
        in_app_template_request : Types::InAppTemplateRequest,
        template_name : String,
        create_new_version : Bool? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInAppTemplateRequest.new(in_app_template_request: in_app_template_request, template_name: template_name, create_new_version: create_new_version, version: version)
        update_in_app_template(input)
      end

      def update_in_app_template(input : Types::UpdateInAppTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IN_APP_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration and other settings for a journey.

      def update_journey(
        application_id : String,
        journey_id : String,
        write_journey_request : Types::WriteJourneyRequest
      ) : Protocol::Request
        input = Types::UpdateJourneyRequest.new(application_id: application_id, journey_id: journey_id, write_journey_request: write_journey_request)
        update_journey(input)
      end

      def update_journey(input : Types::UpdateJourneyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOURNEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Pause, resume or cancels (stops) a journey.

      def update_journey_state(
        application_id : String,
        journey_id : String,
        journey_state_request : Types::JourneyStateRequest
      ) : Protocol::Request
        input = Types::UpdateJourneyStateRequest.new(application_id: application_id, journey_id: journey_id, journey_state_request: journey_state_request)
        update_journey_state(input)
      end

      def update_journey_state(input : Types::UpdateJourneyStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOURNEY_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing message template for messages that are sent through a push notification channel.

      def update_push_template(
        push_notification_template_request : Types::PushNotificationTemplateRequest,
        template_name : String,
        create_new_version : Bool? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePushTemplateRequest.new(push_notification_template_request: push_notification_template_request, template_name: template_name, create_new_version: create_new_version, version: version)
        update_push_template(input)
      end

      def update_push_template(input : Types::UpdatePushTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PUSH_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Pinpoint configuration for a recommender model.

      def update_recommender_configuration(
        recommender_id : String,
        update_recommender_configuration : Types::UpdateRecommenderConfiguration
      ) : Protocol::Request
        input = Types::UpdateRecommenderConfigurationRequest.new(recommender_id: recommender_id, update_recommender_configuration: update_recommender_configuration)
        update_recommender_configuration(input)
      end

      def update_recommender_configuration(input : Types::UpdateRecommenderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOMMENDER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new segment for an application or updates the configuration, dimension, and other settings
      # for an existing segment that's associated with an application.

      def update_segment(
        application_id : String,
        segment_id : String,
        write_segment_request : Types::WriteSegmentRequest
      ) : Protocol::Request
        input = Types::UpdateSegmentRequest.new(application_id: application_id, segment_id: segment_id, write_segment_request: write_segment_request)
        update_segment(input)
      end

      def update_segment(input : Types::UpdateSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the SMS channel for an application or updates the status and settings of the SMS channel for
      # an application.

      def update_sms_channel(
        application_id : String,
        sms_channel_request : Types::SMSChannelRequest
      ) : Protocol::Request
        input = Types::UpdateSmsChannelRequest.new(application_id: application_id, sms_channel_request: sms_channel_request)
        update_sms_channel(input)
      end

      def update_sms_channel(input : Types::UpdateSmsChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SMS_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing message template for messages that are sent through the SMS channel.

      def update_sms_template(
        sms_template_request : Types::SMSTemplateRequest,
        template_name : String,
        create_new_version : Bool? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSmsTemplateRequest.new(sms_template_request: sms_template_request, template_name: template_name, create_new_version: create_new_version, version: version)
        update_sms_template(input)
      end

      def update_sms_template(input : Types::UpdateSmsTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SMS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the status of a specific version of a message template to active .

      def update_template_active_version(
        template_active_version_request : Types::TemplateActiveVersionRequest,
        template_name : String,
        template_type : String
      ) : Protocol::Request
        input = Types::UpdateTemplateActiveVersionRequest.new(template_active_version_request: template_active_version_request, template_name: template_name, template_type: template_type)
        update_template_active_version(input)
      end

      def update_template_active_version(input : Types::UpdateTemplateActiveVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE_ACTIVE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the voice channel for an application or updates the status and settings of the voice channel
      # for an application.

      def update_voice_channel(
        application_id : String,
        voice_channel_request : Types::VoiceChannelRequest
      ) : Protocol::Request
        input = Types::UpdateVoiceChannelRequest.new(application_id: application_id, voice_channel_request: voice_channel_request)
        update_voice_channel(input)
      end

      def update_voice_channel(input : Types::UpdateVoiceChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing message template for messages that are sent through the voice channel.

      def update_voice_template(
        template_name : String,
        voice_template_request : Types::VoiceTemplateRequest,
        create_new_version : Bool? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVoiceTemplateRequest.new(template_name: template_name, voice_template_request: voice_template_request, create_new_version: create_new_version, version: version)
        update_voice_template(input)
      end

      def update_voice_template(input : Types::UpdateVoiceTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verify an OTP

      def verify_otp_message(
        application_id : String,
        verify_otp_message_request_parameters : Types::VerifyOTPMessageRequestParameters
      ) : Protocol::Request
        input = Types::VerifyOTPMessageRequest.new(application_id: application_id, verify_otp_message_request_parameters: verify_otp_message_request_parameters)
        verify_otp_message(input)
      end

      def verify_otp_message(input : Types::VerifyOTPMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_OTP_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
