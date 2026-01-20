module Aws
  module KinesisVideo
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

      # Creates a signaling channel. CreateSignalingChannel is an asynchronous operation.

      def create_signaling_channel(
        channel_name : String,
        channel_type : String? = nil,
        single_master_configuration : Types::SingleMasterConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSignalingChannelInput.new(channel_name: channel_name, channel_type: channel_type, single_master_configuration: single_master_configuration, tags: tags)
        create_signaling_channel(input)
      end

      def create_signaling_channel(input : Types::CreateSignalingChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SIGNALING_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Kinesis video stream. When you create a new stream, Kinesis Video Streams assigns it a
      # version number. When you change the stream's metadata, Kinesis Video Streams updates the version.
      # CreateStream is an asynchronous operation. For information about how the service works, see How it
      # Works . You must have permissions for the KinesisVideo:CreateStream action.

      def create_stream(
        stream_name : String,
        data_retention_in_hours : Int32? = nil,
        device_name : String? = nil,
        kms_key_id : String? = nil,
        media_type : String? = nil,
        stream_storage_configuration : Types::StreamStorageConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStreamInput.new(stream_name: stream_name, data_retention_in_hours: data_retention_in_hours, device_name: device_name, kms_key_id: kms_key_id, media_type: media_type, stream_storage_configuration: stream_storage_configuration, tags: tags)
        create_stream(input)
      end

      def create_stream(input : Types::CreateStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # An asynchronous API that deletes a stream’s existing edge configuration, as well as the
      # corresponding media from the Edge Agent. When you invoke this API, the sync status is set to
      # DELETING . A deletion process starts, in which active edge jobs are stopped and all media is deleted
      # from the edge device. The time to delete varies, depending on the total amount of stored media. If
      # the deletion process fails, the sync status changes to DELETE_FAILED . You will need to re-try the
      # deletion. When the deletion process has completed successfully, the edge configuration is no longer
      # accessible.

      def delete_edge_configuration(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteEdgeConfigurationInput.new(stream_arn: stream_arn, stream_name: stream_name)
        delete_edge_configuration(input)
      end

      def delete_edge_configuration(input : Types::DeleteEdgeConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EDGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified signaling channel. DeleteSignalingChannel is an asynchronous operation. If you
      # don't specify the channel's current version, the most recent version is deleted.

      def delete_signaling_channel(
        channel_arn : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteSignalingChannelInput.new(channel_arn: channel_arn, current_version: current_version)
        delete_signaling_channel(input)
      end

      def delete_signaling_channel(input : Types::DeleteSignalingChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SIGNALING_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Kinesis video stream and the data contained in the stream. This method marks the stream
      # for deletion, and makes the data in the stream inaccessible immediately. To ensure that you have the
      # latest version of the stream before deleting it, you can specify the stream version. Kinesis Video
      # Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a
      # new version number. To get the latest stream version, use the DescribeStream API. This operation
      # requires permission for the KinesisVideo:DeleteStream action.

      def delete_stream(
        stream_arn : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteStreamInput.new(stream_arn: stream_arn, current_version: current_version)
        delete_stream(input)
      end

      def delete_stream(input : Types::DeleteStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a stream’s edge configuration that was set using the StartEdgeConfigurationUpdate API and
      # the latest status of the edge agent's recorder and uploader jobs. Use this API to get the status of
      # the configuration to determine if the configuration is in sync with the Edge Agent. Use this API to
      # evaluate the health of the Edge Agent.

      def describe_edge_configuration(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeEdgeConfigurationInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_edge_configuration(input)
      end

      def describe_edge_configuration(input : Types::DescribeEdgeConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EDGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the ImageGenerationConfiguration for a given Kinesis video stream.

      def describe_image_generation_configuration(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeImageGenerationConfigurationInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_image_generation_configuration(input)
      end

      def describe_image_generation_configuration(input : Types::DescribeImageGenerationConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IMAGE_GENERATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most current information about the stream. The streamName or streamARN should be
      # provided in the input.

      def describe_mapped_resource_configuration(
        max_results : Int32? = nil,
        next_token : String? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeMappedResourceConfigurationInput.new(max_results: max_results, next_token: next_token, stream_arn: stream_arn, stream_name: stream_name)
        describe_mapped_resource_configuration(input)
      end

      def describe_mapped_resource_configuration(input : Types::DescribeMappedResourceConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MAPPED_RESOURCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most current information about the channel. Specify the ChannelName or ChannelARN in the
      # input.

      def describe_media_storage_configuration(
        channel_arn : String? = nil,
        channel_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeMediaStorageConfigurationInput.new(channel_arn: channel_arn, channel_name: channel_name)
        describe_media_storage_configuration(input)
      end

      def describe_media_storage_configuration(input : Types::DescribeMediaStorageConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MEDIA_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the NotificationConfiguration for a given Kinesis video stream.

      def describe_notification_configuration(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeNotificationConfigurationInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_notification_configuration(input)
      end

      def describe_notification_configuration(input : Types::DescribeNotificationConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most current information about the signaling channel. You must specify either the name
      # or the Amazon Resource Name (ARN) of the channel that you want to describe.

      def describe_signaling_channel(
        channel_arn : String? = nil,
        channel_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSignalingChannelInput.new(channel_arn: channel_arn, channel_name: channel_name)
        describe_signaling_channel(input)
      end

      def describe_signaling_channel(input : Types::DescribeSignalingChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SIGNALING_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most current information about the specified stream. You must specify either the
      # StreamName or the StreamARN .

      def describe_stream(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeStreamInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_stream(input)
      end

      def describe_stream(input : Types::DescribeStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current storage configuration for the specified Kinesis video stream. In the request,
      # you must specify either the StreamName or the StreamARN . You must have permissions for the
      # KinesisVideo:DescribeStreamStorageConfiguration action.

      def describe_stream_storage_configuration(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeStreamStorageConfigurationInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_stream_storage_configuration(input)
      end

      def describe_stream_storage_configuration(input : Types::DescribeStreamStorageConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STREAM_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an endpoint for a specified stream for either reading or writing. Use this endpoint in your
      # application to read from the specified stream (using the GetMedia or GetMediaForFragmentList
      # operations) or write to it (using the PutMedia operation). The returned endpoint does not have the
      # API name appended. The client needs to add the API name to the returned endpoint. In the request,
      # specify the stream either by StreamName or StreamARN .

      def get_data_endpoint(
        api_name : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::GetDataEndpointInput.new(api_name: api_name, stream_arn: stream_arn, stream_name: stream_name)
        get_data_endpoint(input)
      end

      def get_data_endpoint(input : Types::GetDataEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides an endpoint for the specified signaling channel to send and receive messages. This API uses
      # the SingleMasterChannelEndpointConfiguration input parameter, which consists of the Protocols and
      # Role properties. Protocols is used to determine the communication mechanism. For example, if you
      # specify WSS as the protocol, this API produces a secure websocket endpoint. If you specify HTTPS as
      # the protocol, this API generates an HTTPS endpoint. If you specify WEBRTC as the protocol, but the
      # signaling channel isn't configured for ingestion, you will receive the error
      # InvalidArgumentException . Role determines the messaging permissions. A MASTER role results in this
      # API generating an endpoint that a client can use to communicate with any of the viewers on the
      # channel. A VIEWER role results in this API generating an endpoint that a client can use to
      # communicate only with a MASTER .

      def get_signaling_channel_endpoint(
        channel_arn : String,
        single_master_channel_endpoint_configuration : Types::SingleMasterChannelEndpointConfiguration? = nil
      ) : Protocol::Request
        input = Types::GetSignalingChannelEndpointInput.new(channel_arn: channel_arn, single_master_channel_endpoint_configuration: single_master_channel_endpoint_configuration)
        get_signaling_channel_endpoint(input)
      end

      def get_signaling_channel_endpoint(input : Types::GetSignalingChannelEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIGNALING_CHANNEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of edge configurations associated with the specified Edge Agent. In the request,
      # you must specify the Edge Agent HubDeviceArn .

      def list_edge_agent_configurations(
        hub_device_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEdgeAgentConfigurationsInput.new(hub_device_arn: hub_device_arn, max_results: max_results, next_token: next_token)
        list_edge_agent_configurations(input)
      end

      def list_edge_agent_configurations(input : Types::ListEdgeAgentConfigurationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EDGE_AGENT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of ChannelInfo objects. Each object describes a signaling channel. To retrieve only
      # those channels that satisfy a specific condition, you can specify a ChannelNameCondition .

      def list_signaling_channels(
        channel_name_condition : Types::ChannelNameCondition? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSignalingChannelsInput.new(channel_name_condition: channel_name_condition, max_results: max_results, next_token: next_token)
        list_signaling_channels(input)
      end

      def list_signaling_channels(input : Types::ListSignalingChannelsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIGNALING_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of StreamInfo objects. Each object describes a stream. To retrieve only streams
      # that satisfy a specific condition, you can specify a StreamNameCondition .

      def list_streams(
        max_results : Int32? = nil,
        next_token : String? = nil,
        stream_name_condition : Types::StreamNameCondition? = nil
      ) : Protocol::Request
        input = Types::ListStreamsInput.new(max_results: max_results, next_token: next_token, stream_name_condition: stream_name_condition)
        list_streams(input)
      end

      def list_streams(input : Types::ListStreamsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags associated with the specified signaling channel.

      def list_tags_for_resource(
        resource_arn : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags associated with the specified stream. In the request, you must specify either
      # the StreamName or the StreamARN .

      def list_tags_for_stream(
        next_token : String? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForStreamInput.new(next_token: next_token, stream_arn: stream_arn, stream_name: stream_name)
        list_tags_for_stream(input)
      end

      def list_tags_for_stream(input : Types::ListTagsForStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # An asynchronous API that updates a stream’s existing edge configuration. The Kinesis Video Stream
      # will sync the stream’s edge configuration with the Edge Agent IoT Greengrass component that runs on
      # an IoT Hub Device, setup at your premise. The time to sync can vary and depends on the connectivity
      # of the Hub Device. The SyncStatus will be updated as the edge configuration is acknowledged, and
      # synced with the Edge Agent. If this API is invoked for the first time, a new edge configuration will
      # be created for the stream, and the sync status will be set to SYNCING . You will have to wait for
      # the sync status to reach a terminal state such as: IN_SYNC , or SYNC_FAILED , before using this API
      # again. If you invoke this API during the syncing process, a ResourceInUseException will be thrown.
      # The connectivity of the stream’s edge configuration and the Edge Agent will be retried for 15
      # minutes. After 15 minutes, the status will transition into the SYNC_FAILED state. To move an edge
      # configuration from one device to another, use DeleteEdgeConfiguration to delete the current edge
      # configuration. You can then invoke StartEdgeConfigurationUpdate with an updated Hub Device ARN.

      def start_edge_configuration_update(
        edge_config : Types::EdgeConfig,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::StartEdgeConfigurationUpdateInput.new(edge_config: edge_config, stream_arn: stream_arn, stream_name: stream_name)
        start_edge_configuration_update(input)
      end

      def start_edge_configuration_update(input : Types::StartEdgeConfigurationUpdateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EDGE_CONFIGURATION_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to a signaling channel. A tag is a key-value pair (the value is optional) that
      # you can define and assign to Amazon Web Services resources. If you specify a tag that already
      # exists, the tag value is replaced with the value that you specify in the request. For more
      # information, see Using Cost Allocation Tags in the Billing and Cost Management and Cost Management
      # User Guide .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to a stream. A tag is a key-value pair (the value is optional) that you can
      # define and assign to Amazon Web Services resources. If you specify a tag that already exists, the
      # tag value is replaced with the value that you specify in the request. For more information, see
      # Using Cost Allocation Tags in the Billing and Cost Management and Cost Management User Guide . You
      # must provide either the StreamName or the StreamARN . This operation requires permission for the
      # KinesisVideo:TagStream action. A Kinesis video stream can support up to 50 tags.

      def tag_stream(
        tags : Hash(String, String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::TagStreamInput.new(tags: tags, stream_arn: stream_arn, stream_name: stream_name)
        tag_stream(input)
      end

      def tag_stream(input : Types::TagStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from a signaling channel. In the request, specify only a tag key or keys;
      # don't specify the value. If you specify a tag key that does not exist, it's ignored.

      def untag_resource(
        resource_arn : String,
        tag_key_list : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_key_list: tag_key_list)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from a stream. In the request, specify only a tag key or keys; don't
      # specify the value. If you specify a tag key that does not exist, it's ignored. In the request, you
      # must provide the StreamName or StreamARN .

      def untag_stream(
        tag_key_list : Array(String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UntagStreamInput.new(tag_key_list: tag_key_list, stream_arn: stream_arn, stream_name: stream_name)
        untag_stream(input)
      end

      def untag_stream(input : Types::UntagStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Increases or decreases the stream's data retention period by the value that you specify. To indicate
      # whether you want to increase or decrease the data retention period, specify the Operation parameter
      # in the request body. In the request, you must specify either the StreamName or the StreamARN . This
      # operation requires permission for the KinesisVideo:UpdateDataRetention action. Changing the data
      # retention period affects the data in the stream as follows: If the data retention period is
      # increased, existing data is retained for the new retention period. For example, if the data
      # retention period is increased from one hour to seven hours, all existing data is retained for seven
      # hours. If the data retention period is decreased, existing data is retained for the new retention
      # period. For example, if the data retention period is decreased from seven hours to one hour, all
      # existing data is retained for one hour, and any data older than one hour is deleted immediately.

      def update_data_retention(
        current_version : String,
        data_retention_change_in_hours : Int32,
        operation : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataRetentionInput.new(current_version: current_version, data_retention_change_in_hours: data_retention_change_in_hours, operation: operation, stream_arn: stream_arn, stream_name: stream_name)
        update_data_retention(input)
      end

      def update_data_retention(input : Types::UpdateDataRetentionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_RETENTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the StreamInfo and ImageProcessingConfiguration fields.

      def update_image_generation_configuration(
        image_generation_configuration : Types::ImageGenerationConfiguration? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateImageGenerationConfigurationInput.new(image_generation_configuration: image_generation_configuration, stream_arn: stream_arn, stream_name: stream_name)
        update_image_generation_configuration(input)
      end

      def update_image_generation_configuration(input : Types::UpdateImageGenerationConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IMAGE_GENERATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a SignalingChannel to a stream to store the media. There are two signaling modes that you
      # can specify : If StorageStatus is enabled, the data will be stored in the StreamARN provided. In
      # order for WebRTC Ingestion to work, the stream must have data retention enabled. If StorageStatus is
      # disabled, no data will be stored, and the StreamARN parameter will not be needed. If StorageStatus
      # is enabled, direct peer-to-peer (master-viewer) connections no longer occur. Peers connect directly
      # to the storage session. You must call the JoinStorageSession API to trigger an SDP offer send and
      # establish a connection between a peer and the storage session.

      def update_media_storage_configuration(
        channel_arn : String,
        media_storage_configuration : Types::MediaStorageConfiguration
      ) : Protocol::Request
        input = Types::UpdateMediaStorageConfigurationInput.new(channel_arn: channel_arn, media_storage_configuration: media_storage_configuration)
        update_media_storage_configuration(input)
      end

      def update_media_storage_configuration(input : Types::UpdateMediaStorageConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEDIA_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the notification information for a stream.

      def update_notification_configuration(
        notification_configuration : Types::NotificationConfiguration? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNotificationConfigurationInput.new(notification_configuration: notification_configuration, stream_arn: stream_arn, stream_name: stream_name)
        update_notification_configuration(input)
      end

      def update_notification_configuration(input : Types::UpdateNotificationConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the existing signaling channel. This is an asynchronous operation and takes time to
      # complete. If the MessageTtlSeconds value is updated (either increased or reduced), it only applies
      # to new messages sent via this channel after it's been updated. Existing messages are still expired
      # as per the previous MessageTtlSeconds value.

      def update_signaling_channel(
        channel_arn : String,
        current_version : String,
        single_master_configuration : Types::SingleMasterConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateSignalingChannelInput.new(channel_arn: channel_arn, current_version: current_version, single_master_configuration: single_master_configuration)
        update_signaling_channel(input)
      end

      def update_signaling_channel(input : Types::UpdateSignalingChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SIGNALING_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates stream metadata, such as the device name and media type. You must provide the stream name or
      # the Amazon Resource Name (ARN) of the stream. To make sure that you have the latest version of the
      # stream before updating it, you can specify the stream version. Kinesis Video Streams assigns a
      # version to each stream. When you update a stream, Kinesis Video Streams assigns a new version
      # number. To get the latest stream version, use the DescribeStream API. UpdateStream is an
      # asynchronous operation, and takes time to complete.

      def update_stream(
        current_version : String,
        device_name : String? = nil,
        media_type : String? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStreamInput.new(current_version: current_version, device_name: device_name, media_type: media_type, stream_arn: stream_arn, stream_name: stream_name)
        update_stream(input)
      end

      def update_stream(input : Types::UpdateStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the storage configuration for an existing Kinesis video stream. This operation allows you to
      # modify the storage tier settings for a stream, enabling you to optimize storage costs and
      # performance based on your access patterns. UpdateStreamStorageConfiguration is an asynchronous
      # operation. You must have permissions for the KinesisVideo:UpdateStreamStorageConfiguration action.

      def update_stream_storage_configuration(
        current_version : String,
        stream_storage_configuration : Types::StreamStorageConfiguration,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStreamStorageConfigurationInput.new(current_version: current_version, stream_storage_configuration: stream_storage_configuration, stream_arn: stream_arn, stream_name: stream_name)
        update_stream_storage_configuration(input)
      end

      def update_stream_storage_configuration(input : Types::UpdateStreamStorageConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STREAM_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
