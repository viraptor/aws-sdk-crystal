module AwsSdk
  module MediaTailor
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

      # Configures Amazon CloudWatch log settings for a channel.
      def configure_logs_for_channel(
        channel_name : String,
        log_types : Array(String)
      ) : Protocol::Request
        input = Types::ConfigureLogsForChannelRequest.new(channel_name: channel_name, log_types: log_types)
        configure_logs_for_channel(input)
      end
      def configure_logs_for_channel(input : Types::ConfigureLogsForChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIGURE_LOGS_FOR_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines where AWS Elemental MediaTailor sends logs for the playback configuration.
      def configure_logs_for_playback_configuration(
        percent_enabled : Int32,
        playback_configuration_name : String,
        ads_interaction_log : Types::AdsInteractionLog? = nil,
        enabled_logging_strategies : Array(String)? = nil,
        manifest_service_interaction_log : Types::ManifestServiceInteractionLog? = nil
      ) : Protocol::Request
        input = Types::ConfigureLogsForPlaybackConfigurationRequest.new(percent_enabled: percent_enabled, playback_configuration_name: playback_configuration_name, ads_interaction_log: ads_interaction_log, enabled_logging_strategies: enabled_logging_strategies, manifest_service_interaction_log: manifest_service_interaction_log)
        configure_logs_for_playback_configuration(input)
      end
      def configure_logs_for_playback_configuration(input : Types::ConfigureLogsForPlaybackConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIGURE_LOGS_FOR_PLAYBACK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def create_channel(
        channel_name : String,
        outputs : Array(Types::RequestOutputItem),
        playback_mode : String,
        audiences : Array(String)? = nil,
        filler_slate : Types::SlateSource? = nil,
        tags : Hash(String, String)? = nil,
        tier : String? = nil,
        time_shift_configuration : Types::TimeShiftConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(channel_name: channel_name, outputs: outputs, playback_mode: playback_mode, audiences: audiences, filler_slate: filler_slate, tags: tags, tier: tier, time_shift_configuration: time_shift_configuration)
        create_channel(input)
      end
      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The live source configuration.
      def create_live_source(
        http_package_configurations : Array(Types::HttpPackageConfiguration),
        live_source_name : String,
        source_location_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLiveSourceRequest.new(http_package_configurations: http_package_configurations, live_source_name: live_source_name, source_location_name: source_location_name, tags: tags)
        create_live_source(input)
      end
      def create_live_source(input : Types::CreateLiveSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LIVE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a prefetch schedule for a playback configuration. A prefetch schedule allows you to tell
      # MediaTailor to fetch and prepare certain ads before an ad break happens. For more information about
      # ad prefetching, see Using ad prefetching in the MediaTailor User Guide .
      def create_prefetch_schedule(
        name : String,
        playback_configuration_name : String,
        consumption : Types::PrefetchConsumption? = nil,
        recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration? = nil,
        retrieval : Types::PrefetchRetrieval? = nil,
        schedule_type : String? = nil,
        stream_id : String? = nil
      ) : Protocol::Request
        input = Types::CreatePrefetchScheduleRequest.new(name: name, playback_configuration_name: playback_configuration_name, consumption: consumption, recurring_prefetch_configuration: recurring_prefetch_configuration, retrieval: retrieval, schedule_type: schedule_type, stream_id: stream_id)
        create_prefetch_schedule(input)
      end
      def create_prefetch_schedule(input : Types::CreatePrefetchScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PREFETCH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a program within a channel. For information about programs, see Working with programs in the
      # MediaTailor User Guide .
      def create_program(
        channel_name : String,
        program_name : String,
        schedule_configuration : Types::ScheduleConfiguration,
        source_location_name : String,
        ad_breaks : Array(Types::AdBreak)? = nil,
        audience_media : Array(Types::AudienceMedia)? = nil,
        live_source_name : String? = nil,
        vod_source_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateProgramRequest.new(channel_name: channel_name, program_name: program_name, schedule_configuration: schedule_configuration, source_location_name: source_location_name, ad_breaks: ad_breaks, audience_media: audience_media, live_source_name: live_source_name, vod_source_name: vod_source_name)
        create_program(input)
      end
      def create_program(input : Types::CreateProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a source location. A source location is a container for sources. For more information about
      # source locations, see Working with source locations in the MediaTailor User Guide .
      def create_source_location(
        http_configuration : Types::HttpConfiguration,
        source_location_name : String,
        access_configuration : Types::AccessConfiguration? = nil,
        default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
        segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSourceLocationRequest.new(http_configuration: http_configuration, source_location_name: source_location_name, access_configuration: access_configuration, default_segment_delivery_configuration: default_segment_delivery_configuration, segment_delivery_configurations: segment_delivery_configurations, tags: tags)
        create_source_location(input)
      end
      def create_source_location(input : Types::CreateSourceLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOURCE_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The VOD source configuration parameters.
      def create_vod_source(
        http_package_configurations : Array(Types::HttpPackageConfiguration),
        source_location_name : String,
        vod_source_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVodSourceRequest.new(http_package_configurations: http_package_configurations, source_location_name: source_location_name, vod_source_name: vod_source_name, tags: tags)
        create_vod_source(input)
      end
      def create_vod_source(input : Types::CreateVodSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOD_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def delete_channel(
        channel_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(channel_name: channel_name)
        delete_channel(input)
      end
      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The channel policy to delete.
      def delete_channel_policy(
        channel_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelPolicyRequest.new(channel_name: channel_name)
        delete_channel_policy(input)
      end
      def delete_channel_policy(input : Types::DeleteChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The live source to delete.
      def delete_live_source(
        live_source_name : String,
        source_location_name : String
      ) : Protocol::Request
        input = Types::DeleteLiveSourceRequest.new(live_source_name: live_source_name, source_location_name: source_location_name)
        delete_live_source(input)
      end
      def delete_live_source(input : Types::DeleteLiveSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LIVE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a playback configuration. For information about MediaTailor configurations, see Working with
      # configurations in AWS Elemental MediaTailor .
      def delete_playback_configuration(
        name : String
      ) : Protocol::Request
        input = Types::DeletePlaybackConfigurationRequest.new(name: name)
        delete_playback_configuration(input)
      end
      def delete_playback_configuration(input : Types::DeletePlaybackConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PLAYBACK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a prefetch schedule for a specific playback configuration. If you call
      # DeletePrefetchSchedule on an expired prefetch schedule, MediaTailor returns an HTTP 404 status code.
      # For more information about ad prefetching, see Using ad prefetching in the MediaTailor User Guide .
      def delete_prefetch_schedule(
        name : String,
        playback_configuration_name : String
      ) : Protocol::Request
        input = Types::DeletePrefetchScheduleRequest.new(name: name, playback_configuration_name: playback_configuration_name)
        delete_prefetch_schedule(input)
      end
      def delete_prefetch_schedule(input : Types::DeletePrefetchScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PREFETCH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a program within a channel. For information about programs, see Working with programs in the
      # MediaTailor User Guide .
      def delete_program(
        channel_name : String,
        program_name : String
      ) : Protocol::Request
        input = Types::DeleteProgramRequest.new(channel_name: channel_name, program_name: program_name)
        delete_program(input)
      end
      def delete_program(input : Types::DeleteProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a source location. A source location is a container for sources. For more information about
      # source locations, see Working with source locations in the MediaTailor User Guide .
      def delete_source_location(
        source_location_name : String
      ) : Protocol::Request
        input = Types::DeleteSourceLocationRequest.new(source_location_name: source_location_name)
        delete_source_location(input)
      end
      def delete_source_location(input : Types::DeleteSourceLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOURCE_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The video on demand (VOD) source to delete.
      def delete_vod_source(
        source_location_name : String,
        vod_source_name : String
      ) : Protocol::Request
        input = Types::DeleteVodSourceRequest.new(source_location_name: source_location_name, vod_source_name: vod_source_name)
        delete_vod_source(input)
      end
      def delete_vod_source(input : Types::DeleteVodSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOD_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def describe_channel(
        channel_name : String
      ) : Protocol::Request
        input = Types::DescribeChannelRequest.new(channel_name: channel_name)
        describe_channel(input)
      end
      def describe_channel(input : Types::DescribeChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The live source to describe.
      def describe_live_source(
        live_source_name : String,
        source_location_name : String
      ) : Protocol::Request
        input = Types::DescribeLiveSourceRequest.new(live_source_name: live_source_name, source_location_name: source_location_name)
        describe_live_source(input)
      end
      def describe_live_source(input : Types::DescribeLiveSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LIVE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a program within a channel. For information about programs, see Working with programs in
      # the MediaTailor User Guide .
      def describe_program(
        channel_name : String,
        program_name : String
      ) : Protocol::Request
        input = Types::DescribeProgramRequest.new(channel_name: channel_name, program_name: program_name)
        describe_program(input)
      end
      def describe_program(input : Types::DescribeProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a source location. A source location is a container for sources. For more information
      # about source locations, see Working with source locations in the MediaTailor User Guide .
      def describe_source_location(
        source_location_name : String
      ) : Protocol::Request
        input = Types::DescribeSourceLocationRequest.new(source_location_name: source_location_name)
        describe_source_location(input)
      end
      def describe_source_location(input : Types::DescribeSourceLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SOURCE_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides details about a specific video on demand (VOD) source in a specific source location.
      def describe_vod_source(
        source_location_name : String,
        vod_source_name : String
      ) : Protocol::Request
        input = Types::DescribeVodSourceRequest.new(source_location_name: source_location_name, vod_source_name: vod_source_name)
        describe_vod_source(input)
      end
      def describe_vod_source(input : Types::DescribeVodSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VOD_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the channel's IAM policy. IAM policies are used to control access to your channel.
      def get_channel_policy(
        channel_name : String
      ) : Protocol::Request
        input = Types::GetChannelPolicyRequest.new(channel_name: channel_name)
        get_channel_policy(input)
      end
      def get_channel_policy(input : Types::GetChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about your channel's schedule.
      def get_channel_schedule(
        channel_name : String,
        audience : String? = nil,
        duration_minutes : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetChannelScheduleRequest.new(channel_name: channel_name, audience: audience, duration_minutes: duration_minutes, max_results: max_results, next_token: next_token)
        get_channel_schedule(input)
      end
      def get_channel_schedule(input : Types::GetChannelScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a playback configuration. For information about MediaTailor configurations, see Working
      # with configurations in AWS Elemental MediaTailor .
      def get_playback_configuration(
        name : String
      ) : Protocol::Request
        input = Types::GetPlaybackConfigurationRequest.new(name: name)
        get_playback_configuration(input)
      end
      def get_playback_configuration(input : Types::GetPlaybackConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLAYBACK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a prefetch schedule for a playback configuration. A prefetch schedule allows you to tell
      # MediaTailor to fetch and prepare certain ads before an ad break happens. For more information about
      # ad prefetching, see Using ad prefetching in the MediaTailor User Guide .
      def get_prefetch_schedule(
        name : String,
        playback_configuration_name : String
      ) : Protocol::Request
        input = Types::GetPrefetchScheduleRequest.new(name: name, playback_configuration_name: playback_configuration_name)
        get_prefetch_schedule(input)
      end
      def get_prefetch_schedule(input : Types::GetPrefetchScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PREFETCH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the alerts that are associated with a MediaTailor channel assembly resource.
      def list_alerts(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAlertsRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_alerts(input)
      end
      def list_alerts(input : Types::ListAlertsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALERTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the channels that are associated with the current AWS account.
      def list_channels(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(max_results: max_results, next_token: next_token)
        list_channels(input)
      end
      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the live sources contained in a source location. A source represents a piece of content.
      def list_live_sources(
        source_location_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLiveSourcesRequest.new(source_location_name: source_location_name, max_results: max_results, next_token: next_token)
        list_live_sources(input)
      end
      def list_live_sources(input : Types::ListLiveSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIVE_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves existing playback configurations. For information about MediaTailor configurations, see
      # Working with Configurations in AWS Elemental MediaTailor .
      def list_playback_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPlaybackConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_playback_configurations(input)
      end
      def list_playback_configurations(input : Types::ListPlaybackConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLAYBACK_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the prefetch schedules for a playback configuration.
      def list_prefetch_schedules(
        playback_configuration_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schedule_type : String? = nil,
        stream_id : String? = nil
      ) : Protocol::Request
        input = Types::ListPrefetchSchedulesRequest.new(playback_configuration_name: playback_configuration_name, max_results: max_results, next_token: next_token, schedule_type: schedule_type, stream_id: stream_id)
        list_prefetch_schedules(input)
      end
      def list_prefetch_schedules(input : Types::ListPrefetchSchedulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PREFETCH_SCHEDULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the source locations for a channel. A source location defines the host server URL, and
      # contains a list of sources.
      def list_source_locations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSourceLocationsRequest.new(max_results: max_results, next_token: next_token)
        list_source_locations(input)
      end
      def list_source_locations(input : Types::ListSourceLocationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOURCE_LOCATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of tags that are associated with this resource. Tags are key-value pairs that you can
      # associate with Amazon resources to help with organization, access control, and cost tracking. For
      # more information, see Tagging AWS Elemental MediaTailor Resources .
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

      # Lists the VOD sources contained in a source location. A source represents a piece of content.
      def list_vod_sources(
        source_location_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVodSourcesRequest.new(source_location_name: source_location_name, max_results: max_results, next_token: next_token)
        list_vod_sources(input)
      end
      def list_vod_sources(input : Types::ListVodSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOD_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IAM policy for the channel. IAM policies are used to control access to your channel.
      def put_channel_policy(
        channel_name : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutChannelPolicyRequest.new(channel_name: channel_name, policy: policy)
        put_channel_policy(input)
      end
      def put_channel_policy(input : Types::PutChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a playback configuration. For information about MediaTailor configurations, see Working with
      # configurations in AWS Elemental MediaTailor .
      def put_playback_configuration(
        name : String,
        ad_conditioning_configuration : Types::AdConditioningConfiguration? = nil,
        ad_decision_server_configuration : Types::AdDecisionServerConfiguration? = nil,
        ad_decision_server_url : String? = nil,
        avail_suppression : Types::AvailSuppression? = nil,
        bumper : Types::Bumper? = nil,
        cdn_configuration : Types::CdnConfiguration? = nil,
        configuration_aliases : Hash(String, Hash(String, String))? = nil,
        dash_configuration : Types::DashConfigurationForPut? = nil,
        insertion_mode : String? = nil,
        live_pre_roll_configuration : Types::LivePreRollConfiguration? = nil,
        manifest_processing_rules : Types::ManifestProcessingRules? = nil,
        personalization_threshold_seconds : Int32? = nil,
        slate_ad_url : String? = nil,
        tags : Hash(String, String)? = nil,
        transcode_profile_name : String? = nil,
        video_content_source_url : String? = nil
      ) : Protocol::Request
        input = Types::PutPlaybackConfigurationRequest.new(name: name, ad_conditioning_configuration: ad_conditioning_configuration, ad_decision_server_configuration: ad_decision_server_configuration, ad_decision_server_url: ad_decision_server_url, avail_suppression: avail_suppression, bumper: bumper, cdn_configuration: cdn_configuration, configuration_aliases: configuration_aliases, dash_configuration: dash_configuration, insertion_mode: insertion_mode, live_pre_roll_configuration: live_pre_roll_configuration, manifest_processing_rules: manifest_processing_rules, personalization_threshold_seconds: personalization_threshold_seconds, slate_ad_url: slate_ad_url, tags: tags, transcode_profile_name: transcode_profile_name, video_content_source_url: video_content_source_url)
        put_playback_configuration(input)
      end
      def put_playback_configuration(input : Types::PutPlaybackConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PLAYBACK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def start_channel(
        channel_name : String
      ) : Protocol::Request
        input = Types::StartChannelRequest.new(channel_name: channel_name)
        start_channel(input)
      end
      def start_channel(input : Types::StartChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def stop_channel(
        channel_name : String
      ) : Protocol::Request
        input = Types::StopChannelRequest.new(channel_name: channel_name)
        stop_channel(input)
      end
      def stop_channel(input : Types::StopChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The resource to tag. Tags are key-value pairs that you can associate with Amazon resources to help
      # with organization, access control, and cost tracking. For more information, see Tagging AWS
      # Elemental MediaTailor Resources .
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

      # The resource to untag.
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

      # Updates a channel. For information about MediaTailor channels, see Working with channels in the
      # MediaTailor User Guide .
      def update_channel(
        channel_name : String,
        outputs : Array(Types::RequestOutputItem),
        audiences : Array(String)? = nil,
        filler_slate : Types::SlateSource? = nil,
        time_shift_configuration : Types::TimeShiftConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(channel_name: channel_name, outputs: outputs, audiences: audiences, filler_slate: filler_slate, time_shift_configuration: time_shift_configuration)
        update_channel(input)
      end
      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a live source's configuration.
      def update_live_source(
        http_package_configurations : Array(Types::HttpPackageConfiguration),
        live_source_name : String,
        source_location_name : String
      ) : Protocol::Request
        input = Types::UpdateLiveSourceRequest.new(http_package_configurations: http_package_configurations, live_source_name: live_source_name, source_location_name: source_location_name)
        update_live_source(input)
      end
      def update_live_source(input : Types::UpdateLiveSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIVE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a program within a channel.
      def update_program(
        channel_name : String,
        program_name : String,
        schedule_configuration : Types::UpdateProgramScheduleConfiguration,
        ad_breaks : Array(Types::AdBreak)? = nil,
        audience_media : Array(Types::AudienceMedia)? = nil
      ) : Protocol::Request
        input = Types::UpdateProgramRequest.new(channel_name: channel_name, program_name: program_name, schedule_configuration: schedule_configuration, ad_breaks: ad_breaks, audience_media: audience_media)
        update_program(input)
      end
      def update_program(input : Types::UpdateProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a source location. A source location is a container for sources. For more information about
      # source locations, see Working with source locations in the MediaTailor User Guide .
      def update_source_location(
        http_configuration : Types::HttpConfiguration,
        source_location_name : String,
        access_configuration : Types::AccessConfiguration? = nil,
        default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
        segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateSourceLocationRequest.new(http_configuration: http_configuration, source_location_name: source_location_name, access_configuration: access_configuration, default_segment_delivery_configuration: default_segment_delivery_configuration, segment_delivery_configurations: segment_delivery_configurations)
        update_source_location(input)
      end
      def update_source_location(input : Types::UpdateSourceLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOURCE_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a VOD source's configuration.
      def update_vod_source(
        http_package_configurations : Array(Types::HttpPackageConfiguration),
        source_location_name : String,
        vod_source_name : String
      ) : Protocol::Request
        input = Types::UpdateVodSourceRequest.new(http_package_configurations: http_package_configurations, source_location_name: source_location_name, vod_source_name: vod_source_name)
        update_vod_source(input)
      end
      def update_vod_source(input : Types::UpdateVodSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOD_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
