require "json"
require "time"

module AwsSdk
  module KinesisVideo
    module Types

      # You do not have required permissions to perform this operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum limit of active signaling channels for this Amazon Web Services account
      # in this region.
      struct AccountChannelLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of streams created for the account is too high.
      struct AccountStreamLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that encapsulates a signaling channel's metadata and properties.
      struct ChannelInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String?

        # The name of the signaling channel.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # Current status of the signaling channel.
        @[JSON::Field(key: "ChannelStatus")]
        getter channel_status : String?

        # The type of the signaling channel.
        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # The time at which the signaling channel was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A structure that contains the configuration for the SINGLE_MASTER channel type.
        @[JSON::Field(key: "SingleMasterConfiguration")]
        getter single_master_configuration : Types::SingleMasterConfiguration?

        # The current version of the signaling channel.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_name : String? = nil,
          @channel_status : String? = nil,
          @channel_type : String? = nil,
          @creation_time : Time? = nil,
          @single_master_configuration : Types::SingleMasterConfiguration? = nil,
          @version : String? = nil
        )
        end
      end

      # An optional input parameter for the ListSignalingChannels API. When this parameter is specified
      # while invoking ListSignalingChannels , the API returns only the channels that satisfy a condition
      # specified in ChannelNameCondition .
      struct ChannelNameCondition
        include JSON::Serializable

        # A comparison operator. Currently, you can only specify the BEGINS_WITH operator, which finds
        # signaling channels whose names begin with a given prefix.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # A value to compare.
        @[JSON::Field(key: "ComparisonValue")]
        getter comparison_value : String?

        def initialize(
          @comparison_operator : String? = nil,
          @comparison_value : String? = nil
        )
        end
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.
      struct ClientLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateSignalingChannelInput
        include JSON::Serializable

        # A name for the signaling channel that you are creating. It must be unique for each Amazon Web
        # Services account and Amazon Web Services Region.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # A type of the signaling channel that you are creating. Currently, SINGLE_MASTER is the only
        # supported channel type.
        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # A structure containing the configuration for the SINGLE_MASTER channel type. The default
        # configuration for the channel message's time to live is 60 seconds (1 minute).
        @[JSON::Field(key: "SingleMasterConfiguration")]
        getter single_master_configuration : Types::SingleMasterConfiguration?

        # A set of tags (key-value pairs) that you want to associate with this channel.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @channel_name : String,
          @channel_type : String? = nil,
          @single_master_configuration : Types::SingleMasterConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSignalingChannelOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created channel.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String?

        def initialize(
          @channel_arn : String? = nil
        )
        end
      end

      struct CreateStreamInput
        include JSON::Serializable

        # A name for the stream that you are creating. The stream name is an identifier for the stream, and
        # must be unique for each account and region.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String

        # The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains
        # the data in a data store that is associated with the stream. The default value is 0, indicating that
        # the stream does not persist data. The minimum is 1 hour. When the DataRetentionInHours value is 0,
        # consumers can still consume the fragments that remain in the service host buffer, which has a
        # retention time limit of 5 minutes and a retention memory limit of 200 MB. Fragments are removed from
        # the buffer when either limit is reached.
        @[JSON::Field(key: "DataRetentionInHours")]
        getter data_retention_in_hours : Int32?

        # The name of the device that is writing to the stream. In the current implementation, Kinesis Video
        # Streams doesn't use this name.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The ID of the Key Management Service (KMS) key that you want Kinesis Video Streams to use to encrypt
        # stream data. If no key ID is specified, the default, Kinesis Video-managed key ( aws/kinesisvideo )
        # is used. For more information, see DescribeKey .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The media type of the stream. Consumers of the stream can use this information when processing the
        # stream. For more information about media types, see Media Types . If you choose to specify the
        # MediaType , see Naming Requirements for guidelines. Example valid values include "video/h264" and
        # "video/h264,audio/aac". This parameter is optional; the default value is null (or empty in JSON).
        @[JSON::Field(key: "MediaType")]
        getter media_type : String?

        # The configuration for the stream's storage, including the default storage tier for stream data. This
        # configuration determines how stream data is stored and accessed, with different tiers offering
        # varying levels of performance and cost optimization. If not specified, the stream will use the
        # default storage configuration with HOT tier for optimal performance.
        @[JSON::Field(key: "StreamStorageConfiguration")]
        getter stream_storage_configuration : Types::StreamStorageConfiguration?

        # A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is
        # optional).
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @stream_name : String,
          @data_retention_in_hours : Int32? = nil,
          @device_name : String? = nil,
          @kms_key_id : String? = nil,
          @media_type : String? = nil,
          @stream_storage_configuration : Types::StreamStorageConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateStreamOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @stream_arn : String? = nil
        )
        end
      end

      struct DeleteEdgeConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream. Specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which to delete the edge configuration. Specify either the StreamName or
        # the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DeleteEdgeConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSignalingChannelInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel that you want to delete.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # The current version of the signaling channel that you want to delete. You can obtain the current
        # version by invoking the DescribeSignalingChannel or ListSignalingChannels API operations.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String?

        def initialize(
          @channel_arn : String,
          @current_version : String? = nil
        )
        end
      end

      struct DeleteSignalingChannelOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteStreamInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream that you want to delete.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # Optional: The version of the stream that you want to delete. Specify the version as a safeguard to
        # ensure that your are deleting the correct stream. To get the stream version, use the DescribeStream
        # API. If not specified, only the CreationTime is checked before deleting the stream.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String?

        def initialize(
          @stream_arn : String,
          @current_version : String? = nil
        )
        end
      end

      struct DeleteStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration details required to delete the connection of the stream from the Edge Agent.
      struct DeletionConfig
        include JSON::Serializable

        # The boolean value used to indicate whether or not you want to mark the media for deletion, once it
        # has been uploaded to the Kinesis Video Stream cloud. The media files can be deleted if any of the
        # deletion configuration values are set to true , such as when the limit for the EdgeRetentionInHours
        # , or the MaxLocalMediaSizeInMB , has been reached. Since the default value is set to true ,
        # configure the uploader schedule such that the media files are not being deleted before they are
        # initially uploaded to the Amazon Web Services cloud.
        @[JSON::Field(key: "DeleteAfterUpload")]
        getter delete_after_upload : Bool?

        # The number of hours that you want to retain the data in the stream on the Edge Agent. The default
        # value of the retention time is 720 hours, which translates to 30 days.
        @[JSON::Field(key: "EdgeRetentionInHours")]
        getter edge_retention_in_hours : Int32?

        # The value of the local size required in order to delete the edge configuration.
        @[JSON::Field(key: "LocalSizeConfig")]
        getter local_size_config : Types::LocalSizeConfig?

        def initialize(
          @delete_after_upload : Bool? = nil,
          @edge_retention_in_hours : Int32? = nil,
          @local_size_config : Types::LocalSizeConfig? = nil
        )
        end
      end

      struct DescribeEdgeConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream. Specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream whose edge configuration you want to update. Specify either the StreamName or
        # the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeEdgeConfigurationOutput
        include JSON::Serializable

        # The timestamp at which a stream’s edge configuration was first created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # An object that contains the latest status details for an edge agent's recorder and uploader jobs.
        # Use this information to determine the current health of an edge agent.
        @[JSON::Field(key: "EdgeAgentStatus")]
        getter edge_agent_status : Types::EdgeAgentStatus?

        # A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT
        # Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.
        @[JSON::Field(key: "EdgeConfig")]
        getter edge_config : Types::EdgeConfig?

        # A description of the generated failure status.
        @[JSON::Field(key: "FailedStatusDetails")]
        getter failed_status_details : String?

        # The timestamp at which a stream’s edge configuration was last updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which the edge configuration was updated.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The latest status of the edge configuration update.
        @[JSON::Field(key: "SyncStatus")]
        getter sync_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @edge_agent_status : Types::EdgeAgentStatus? = nil,
          @edge_config : Types::EdgeConfig? = nil,
          @failed_status_details : String? = nil,
          @last_updated_time : Time? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @sync_status : String? = nil
        )
        end
      end

      struct DescribeImageGenerationConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis video stream from which to retrieve the image
        # generation configuration. You must specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which to retrieve the image generation configuration. You must specify
        # either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeImageGenerationConfigurationOutput
        include JSON::Serializable

        # The structure that contains the information required for the Kinesis video stream (KVS) images
        # delivery. If this structure is null, the configuration will be deleted from the stream.
        @[JSON::Field(key: "ImageGenerationConfiguration")]
        getter image_generation_configuration : Types::ImageGenerationConfiguration?

        def initialize(
          @image_generation_configuration : Types::ImageGenerationConfiguration? = nil
        )
        end
      end

      struct DescribeMappedResourceConfigurationInput
        include JSON::Serializable

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to provide in your next request, to get another batch of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeMappedResourceConfigurationOutput
        include JSON::Serializable

        # A structure that encapsulates, or contains, the media storage configuration properties.
        @[JSON::Field(key: "MappedResourceConfigurationList")]
        getter mapped_resource_configuration_list : Array(Types::MappedResourceConfigurationListItem)?

        # The token that was used in the NextToken request to fetch the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @mapped_resource_configuration_list : Array(Types::MappedResourceConfigurationListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeMediaStorageConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the channel.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String?

        # The name of the channel.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_name : String? = nil
        )
        end
      end

      struct DescribeMediaStorageConfigurationOutput
        include JSON::Serializable

        # A structure that encapsulates, or contains, the media storage configuration properties.
        @[JSON::Field(key: "MediaStorageConfiguration")]
        getter media_storage_configuration : Types::MediaStorageConfiguration?

        def initialize(
          @media_storage_configuration : Types::MediaStorageConfiguration? = nil
        )
        end
      end

      struct DescribeNotificationConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to retrieve the
        # notification configuration. You must specify either the StreamName or the StreamARN.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which to retrieve the notification configuration. You must specify
        # either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeNotificationConfigurationOutput
        include JSON::Serializable

        # The structure that contains the information required for notifications. If the structure is null,
        # the configuration will be deleted from the stream.
        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        def initialize(
          @notification_configuration : Types::NotificationConfiguration? = nil
        )
        end
      end

      struct DescribeSignalingChannelInput
        include JSON::Serializable

        # The ARN of the signaling channel that you want to describe.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String?

        # The name of the signaling channel that you want to describe.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_name : String? = nil
        )
        end
      end

      struct DescribeSignalingChannelOutput
        include JSON::Serializable

        # A structure that encapsulates the specified signaling channel's metadata and properties.
        @[JSON::Field(key: "ChannelInfo")]
        getter channel_info : Types::ChannelInfo?

        def initialize(
          @channel_info : Types::ChannelInfo? = nil
        )
        end
      end

      struct DescribeStreamInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeStreamOutput
        include JSON::Serializable

        # An object that describes the stream.
        @[JSON::Field(key: "StreamInfo")]
        getter stream_info : Types::StreamInfo?

        def initialize(
          @stream_info : Types::StreamInfo? = nil
        )
        end
      end

      struct DescribeStreamStorageConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream for which you want to retrieve the storage
        # configuration.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for which you want to retrieve the storage configuration.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct DescribeStreamStorageConfigurationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The current storage configuration for the stream, including the default storage tier and other
        # storage-related settings.
        @[JSON::Field(key: "StreamStorageConfiguration")]
        getter stream_storage_configuration : Types::StreamStorageConfiguration?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @stream_storage_configuration : Types::StreamStorageConfiguration? = nil
        )
        end
      end

      # Not implemented.
      struct DeviceStreamLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains the latest status details for an edge agent's recorder and uploader jobs.
      # Use this information to determine the current health of an edge agent.
      struct EdgeAgentStatus
        include JSON::Serializable

        # The latest status of a stream’s edge recording job.
        @[JSON::Field(key: "LastRecorderStatus")]
        getter last_recorder_status : Types::LastRecorderStatus?

        # The latest status of a stream’s edge to cloud uploader job.
        @[JSON::Field(key: "LastUploaderStatus")]
        getter last_uploader_status : Types::LastUploaderStatus?

        def initialize(
          @last_recorder_status : Types::LastRecorderStatus? = nil,
          @last_uploader_status : Types::LastUploaderStatus? = nil
        )
        end
      end

      # A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT
      # Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.
      struct EdgeConfig
        include JSON::Serializable

        # The " Internet of Things (IoT) Thing " Arn of the stream.
        @[JSON::Field(key: "HubDeviceArn")]
        getter hub_device_arn : String

        # The recorder configuration consists of the local MediaSourceConfig details, that are used as
        # credentials to access the local media files streamed on the camera.
        @[JSON::Field(key: "RecorderConfig")]
        getter recorder_config : Types::RecorderConfig

        # The deletion configuration is made up of the retention time ( EdgeRetentionInHours ) and local size
        # configuration ( LocalSizeConfig ) details that are used to make the deletion.
        @[JSON::Field(key: "DeletionConfig")]
        getter deletion_config : Types::DeletionConfig?

        # The uploader configuration contains the ScheduleExpression details that are used to schedule upload
        # jobs for the recorded media files from the Edge Agent to a Kinesis Video Stream.
        @[JSON::Field(key: "UploaderConfig")]
        getter uploader_config : Types::UploaderConfig?

        def initialize(
          @hub_device_arn : String,
          @recorder_config : Types::RecorderConfig,
          @deletion_config : Types::DeletionConfig? = nil,
          @uploader_config : Types::UploaderConfig? = nil
        )
        end
      end

      struct GetDataEndpointInput
        include JSON::Serializable

        # The name of the API action for which to get an endpoint.
        @[JSON::Field(key: "APIName")]
        getter api_name : String

        # The Amazon Resource Name (ARN) of the stream that you want to get the endpoint for. You must specify
        # either this parameter or a StreamName in the request.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream that you want to get the endpoint for. You must specify either this parameter
        # or a StreamARN in the request.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @api_name : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct GetDataEndpointOutput
        include JSON::Serializable

        # The endpoint value. To read data from the stream or to write data to it, specify this endpoint in
        # your application.
        @[JSON::Field(key: "DataEndpoint")]
        getter data_endpoint : String?

        def initialize(
          @data_endpoint : String? = nil
        )
        end
      end

      struct GetSignalingChannelEndpointInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signalling channel for which you want to get an endpoint.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # A structure containing the endpoint configuration for the SINGLE_MASTER channel type.
        @[JSON::Field(key: "SingleMasterChannelEndpointConfiguration")]
        getter single_master_channel_endpoint_configuration : Types::SingleMasterChannelEndpointConfiguration?

        def initialize(
          @channel_arn : String,
          @single_master_channel_endpoint_configuration : Types::SingleMasterChannelEndpointConfiguration? = nil
        )
        end
      end

      struct GetSignalingChannelEndpointOutput
        include JSON::Serializable

        # A list of endpoints for the specified signaling channel.
        @[JSON::Field(key: "ResourceEndpointList")]
        getter resource_endpoint_list : Array(Types::ResourceEndpointListItem)?

        def initialize(
          @resource_endpoint_list : Array(Types::ResourceEndpointListItem)? = nil
        )
        end
      end

      # The structure that contains the information required for the KVS images delivery. If null, the
      # configuration will be deleted from the stream.
      struct ImageGenerationConfiguration
        include JSON::Serializable

        # The structure that contains the information required to deliver images to a customer.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::ImageGenerationDestinationConfig

        # The accepted image format.
        @[JSON::Field(key: "Format")]
        getter format : String

        # The origin of the Server or Producer timestamps to use to generate the images.
        @[JSON::Field(key: "ImageSelectorType")]
        getter image_selector_type : String

        # The time interval in milliseconds (ms) at which the images need to be generated from the stream. The
        # minimum value that can be provided is 200 ms. If the timestamp range is less than the sampling
        # interval, the Image from the StartTimestamp will be returned if available.
        @[JSON::Field(key: "SamplingInterval")]
        getter sampling_interval : Int32

        # Indicates whether the ContinuousImageGenerationConfigurations API is enabled or disabled.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The list of a key-value pair structure that contains extra parameters that can be applied when the
        # image is generated. The FormatConfig key is the JPEGQuality , which indicates the JPEG quality key
        # to be used to generate the image. The FormatConfig value accepts ints from 1 to 100. If the value is
        # 1, the image will be generated with less quality and the best compression. If the value is 100, the
        # image will be generated with the best quality and less compression. If no value is provided, the
        # default value of the JPEGQuality key will be set to 80.
        @[JSON::Field(key: "FormatConfig")]
        getter format_config : Hash(String, String)?

        # The height of the output image that is used in conjunction with the WidthPixels parameter. When both
        # HeightPixels and WidthPixels parameters are provided, the image will be stretched to fit the
        # specified aspect ratio. If only the HeightPixels parameter is provided, its original aspect ratio
        # will be used to calculate the WidthPixels ratio. If neither parameter is provided, the original
        # image size will be returned.
        @[JSON::Field(key: "HeightPixels")]
        getter height_pixels : Int32?

        # The width of the output image that is used in conjunction with the HeightPixels parameter. When both
        # WidthPixels and HeightPixels parameters are provided, the image will be stretched to fit the
        # specified aspect ratio. If only the WidthPixels parameter is provided, its original aspect ratio
        # will be used to calculate the HeightPixels ratio. If neither parameter is provided, the original
        # image size will be returned.
        @[JSON::Field(key: "WidthPixels")]
        getter width_pixels : Int32?

        def initialize(
          @destination_config : Types::ImageGenerationDestinationConfig,
          @format : String,
          @image_selector_type : String,
          @sampling_interval : Int32,
          @status : String,
          @format_config : Hash(String, String)? = nil,
          @height_pixels : Int32? = nil,
          @width_pixels : Int32? = nil
        )
        end
      end

      # The structure that contains the information required to deliver images to a customer.
      struct ImageGenerationDestinationConfig
        include JSON::Serializable

        # The Amazon Web Services Region of the S3 bucket where images will be delivered. This
        # DestinationRegion must match the Region where the stream is located.
        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String

        # The Uniform Resource Identifier (URI) that identifies where the images will be delivered.
        @[JSON::Field(key: "Uri")]
        getter uri : String

        def initialize(
          @destination_region : String,
          @uri : String
        )
        end
      end

      # The value for this input parameter is invalid.
      struct InvalidArgumentException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Not implemented.
      struct InvalidDeviceException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The format of the StreamARN is invalid.
      struct InvalidResourceFormatException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The latest status of a stream's edge recording job.
      struct LastRecorderStatus
        include JSON::Serializable

        # A description of a recorder job’s latest status.
        @[JSON::Field(key: "JobStatusDetails")]
        getter job_status_details : String?

        # The timestamp at which the recorder job was last executed and media stored to local disk.
        @[JSON::Field(key: "LastCollectedTime")]
        getter last_collected_time : Time?

        # The timestamp at which the recorder status was last updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The status of the latest recorder job.
        @[JSON::Field(key: "RecorderStatus")]
        getter recorder_status : String?

        def initialize(
          @job_status_details : String? = nil,
          @last_collected_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @recorder_status : String? = nil
        )
        end
      end

      # The latest status of a stream’s edge to cloud uploader job.
      struct LastUploaderStatus
        include JSON::Serializable

        # A description of an uploader job’s latest status.
        @[JSON::Field(key: "JobStatusDetails")]
        getter job_status_details : String?

        # The timestamp at which the uploader job was last executed and media collected to the cloud.
        @[JSON::Field(key: "LastCollectedTime")]
        getter last_collected_time : Time?

        # The timestamp at which the uploader status was last updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The status of the latest uploader job.
        @[JSON::Field(key: "UploaderStatus")]
        getter uploader_status : String?

        def initialize(
          @job_status_details : String? = nil,
          @last_collected_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @uploader_status : String? = nil
        )
        end
      end

      # A description of a single stream's edge configuration.
      struct ListEdgeAgentConfigurationsEdgeConfig
        include JSON::Serializable

        # The timestamp when the stream first created the edge config.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        @[JSON::Field(key: "EdgeConfig")]
        getter edge_config : Types::EdgeConfig?

        # A description of the generated failure status.
        @[JSON::Field(key: "FailedStatusDetails")]
        getter failed_status_details : String?

        # The timestamp when the stream last updated the edge config.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The current sync status of the stream's edge configuration.
        @[JSON::Field(key: "SyncStatus")]
        getter sync_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @edge_config : Types::EdgeConfig? = nil,
          @failed_status_details : String? = nil,
          @last_updated_time : Time? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @sync_status : String? = nil
        )
        end
      end

      struct ListEdgeAgentConfigurationsInput
        include JSON::Serializable

        # The "Internet of Things (IoT) Thing" Arn of the edge agent.
        @[JSON::Field(key: "HubDeviceArn")]
        getter hub_device_arn : String

        # The maximum number of edge configurations to return in the response. The default is 5.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify this parameter, when the result of a ListEdgeAgentConfigurations operation is
        # truncated, the call returns the NextToken in the response. To get another batch of edge
        # configurations, provide this token in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hub_device_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEdgeAgentConfigurationsOutput
        include JSON::Serializable

        # A description of a single stream's edge configuration.
        @[JSON::Field(key: "EdgeConfigs")]
        getter edge_configs : Array(Types::ListEdgeAgentConfigurationsEdgeConfig)?

        # If the response is truncated, the call returns this element with a given token. To get the next
        # batch of edge configurations, use this token in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @edge_configs : Array(Types::ListEdgeAgentConfigurationsEdgeConfig)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSignalingChannelsInput
        include JSON::Serializable

        # Optional: Returns only the channels that satisfy a specific condition.
        @[JSON::Field(key: "ChannelNameCondition")]
        getter channel_name_condition : Types::ChannelNameCondition?

        # The maximum number of channels to return in the response. The default is 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify this parameter, when the result of a ListSignalingChannels operation is truncated,
        # the call returns the NextToken in the response. To get another batch of channels, provide this token
        # in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_name_condition : Types::ChannelNameCondition? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSignalingChannelsOutput
        include JSON::Serializable

        # An array of ChannelInfo objects.
        @[JSON::Field(key: "ChannelInfoList")]
        getter channel_info_list : Array(Types::ChannelInfo)?

        # If the response is truncated, the call returns this element with a token. To get the next batch of
        # streams, use this token in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_info_list : Array(Types::ChannelInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamsInput
        include JSON::Serializable

        # The maximum number of streams to return in the response. The default is 10,000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify this parameter, when the result of a ListStreams operation is truncated, the call
        # returns the NextToken in the response. To get another batch of streams, provide this token in your
        # next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Optional: Returns only streams that satisfy a specific condition. Currently, you can specify only
        # the prefix of a stream name as a condition.
        @[JSON::Field(key: "StreamNameCondition")]
        getter stream_name_condition : Types::StreamNameCondition?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stream_name_condition : Types::StreamNameCondition? = nil
        )
        end
      end

      struct ListStreamsOutput
        include JSON::Serializable

        # If the response is truncated, the call returns this element with a token. To get the next batch of
        # streams, use this token in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of StreamInfo objects.
        @[JSON::Field(key: "StreamInfoList")]
        getter stream_info_list : Array(Types::StreamInfo)?

        def initialize(
          @next_token : String? = nil,
          @stream_info_list : Array(Types::StreamInfo)? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel for which you want to list tags.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # If you specify this parameter and the result of a ListTagsForResource call is truncated, the
        # response includes a token that you can use in the next request to fetch the next batch of tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # If you specify this parameter and the result of a ListTagsForResource call is truncated, the
        # response includes a token that you can use in the next request to fetch the next set of tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A map of tag keys and values associated with the specified signaling channel.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTagsForStreamInput
        include JSON::Serializable

        # If you specify this parameter and the result of a ListTagsForStream call is truncated, the response
        # includes a token that you can use in the next request to fetch the next batch of tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the stream that you want to list tags for.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream that you want to list tags for.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @next_token : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct ListTagsForStreamOutput
        include JSON::Serializable

        # If you specify this parameter and the result of a ListTags call is truncated, the response includes
        # a token that you can use in the next request to fetch the next set of tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A map of tag keys and values associated with the specified stream.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration details that include the maximum size of the media ( MaxLocalMediaSizeInMB ) that
      # you want to store for a stream on the Edge Agent, as well as the strategy that should be used (
      # StrategyOnFullSize ) when a stream's maximum size has been reached.
      struct LocalSizeConfig
        include JSON::Serializable

        # The overall maximum size of the media that you want to store for a stream on the Edge Agent.
        @[JSON::Field(key: "MaxLocalMediaSizeInMB")]
        getter max_local_media_size_in_mb : Int32?

        # The strategy to perform when a stream’s MaxLocalMediaSizeInMB limit is reached.
        @[JSON::Field(key: "StrategyOnFullSize")]
        getter strategy_on_full_size : String?

        def initialize(
          @max_local_media_size_in_mb : Int32? = nil,
          @strategy_on_full_size : String? = nil
        )
        end
      end

      # A structure that encapsulates, or contains, the media storage configuration properties.
      struct MappedResourceConfigurationListItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis Video Stream resource, associated with the stream.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The type of the associated resource for the kinesis video stream.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration details that consist of the credentials required ( MediaUriSecretArn and
      # MediaUriType ) to access the media files that are streamed to the camera.
      struct MediaSourceConfig
        include JSON::Serializable

        # The Amazon Web Services Secrets Manager ARN for the username and password of the camera, or a local
        # media file location.
        @[JSON::Field(key: "MediaUriSecretArn")]
        getter media_uri_secret_arn : String

        # The Uniform Resource Identifier (URI) type. The FILE_URI value can be used to stream local media
        # files. Preview only supports the RTSP_URI media source URI format .
        @[JSON::Field(key: "MediaUriType")]
        getter media_uri_type : String

        def initialize(
          @media_uri_secret_arn : String,
          @media_uri_type : String
        )
        end
      end

      # A structure that encapsulates, or contains, the media storage configuration properties. If
      # StorageStatus is enabled, the data will be stored in the StreamARN provided. In order for WebRTC
      # Ingestion to work, the stream must have data retention enabled. If StorageStatus is disabled, no
      # data will be stored, and the StreamARN parameter will not be needed.
      struct MediaStorageConfiguration
        include JSON::Serializable

        # The status of the media storage configuration.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @status : String,
          @stream_arn : String? = nil
        )
        end
      end

      # The Stream data retention in hours is equal to zero.
      struct NoDataRetentionException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The caller is not authorized to perform this operation.
      struct NotAuthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Use this API to configure Amazon Simple Notification Service (Amazon SNS) notifications for when
      # fragments become available in a stream. If this parameter is null, the configuration will be deleted
      # from the stream. See Notifications in Kinesis Video Streams for more information.
      struct NotificationConfiguration
        include JSON::Serializable

        # The destination information required to deliver a notification to a customer.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::NotificationDestinationConfig

        # Indicates if a notification configuration is enabled or disabled.
        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @destination_config : Types::NotificationDestinationConfig,
          @status : String
        )
        end
      end

      # The structure that contains the information required to deliver a notification to a customer.
      struct NotificationDestinationConfig
        include JSON::Serializable

        # The Uniform Resource Identifier (URI) that identifies where the images will be delivered.
        @[JSON::Field(key: "Uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # The recorder configuration consists of the local MediaSourceConfig details that are used as
      # credentials to access the local media files streamed on the camera.
      struct RecorderConfig
        include JSON::Serializable

        # The configuration details that consist of the credentials required ( MediaUriSecretArn and
        # MediaUriType ) to access the media files streamed to the camera.
        @[JSON::Field(key: "MediaSourceConfig")]
        getter media_source_config : Types::MediaSourceConfig

        # The configuration that consists of the ScheduleExpression and the DurationInMinutes details that
        # specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the
        # ScheduleExpression attribute is not provided, then the Edge Agent will always be set to recording
        # mode.
        @[JSON::Field(key: "ScheduleConfig")]
        getter schedule_config : Types::ScheduleConfig?

        def initialize(
          @media_source_config : Types::MediaSourceConfig,
          @schedule_config : Types::ScheduleConfig? = nil
        )
        end
      end

      # An object that describes the endpoint of the signaling channel returned by the
      # GetSignalingChannelEndpoint API. The media server endpoint will correspond to the WEBRTC Protocol.
      struct ResourceEndpointListItem
        include JSON::Serializable

        # The protocol of the signaling channel returned by the GetSignalingChannelEndpoint API.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The endpoint of the signaling channel returned by the GetSignalingChannelEndpoint API.
        @[JSON::Field(key: "ResourceEndpoint")]
        getter resource_endpoint : String?

        def initialize(
          @protocol : String? = nil,
          @resource_endpoint : String? = nil
        )
        end
      end

      # When the input StreamARN or ChannelARN in CLOUD_STORAGE_MODE is already mapped to a different
      # Kinesis Video Stream resource, or if the provided input StreamARN or ChannelARN is not in Active
      # status, try one of the following : The DescribeMediaStorageConfiguration API to determine what the
      # stream given channel is mapped to. The DescribeMappedResourceConfiguration API to determine the
      # channel that the given stream is mapped to. The DescribeStream or DescribeSignalingChannel API to
      # determine the status of the resource.
      struct ResourceInUseException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Kinesis Video Streams can't find the stream that you specified.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This API enables you to specify the duration that the camera, or local media file, should record
      # onto the Edge Agent. The ScheduleConfig consists of the ScheduleExpression and the DurationInMinutes
      # attributes. If the ScheduleConfig is not provided in the RecorderConfig , then the Edge Agent will
      # always be set to recording mode. If the ScheduleConfig is not provided in the UploaderConfig , then
      # the Edge Agent will upload at regular intervals (every 1 hour).
      struct ScheduleConfig
        include JSON::Serializable

        # The total duration to record the media. If the ScheduleExpression attribute is provided, then the
        # DurationInSeconds attribute should also be specified.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The Quartz cron expression that takes care of scheduling jobs to record from the camera, or local
        # media file, onto the Edge Agent. If the ScheduleExpression is not provided for the RecorderConfig ,
        # then the Edge Agent will always be set to recording mode. For more information about Quartz, refer
        # to the Cron Trigger Tutorial page to understand the valid expressions and its use.
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        def initialize(
          @duration_in_seconds : Int32,
          @schedule_expression : String
        )
        end
      end

      # An object that contains the endpoint configuration for the SINGLE_MASTER channel type.
      struct SingleMasterChannelEndpointConfiguration
        include JSON::Serializable

        # This property is used to determine the nature of communication over this SINGLE_MASTER signaling
        # channel. If WSS is specified, this API returns a websocket endpoint. If HTTPS is specified, this API
        # returns an HTTPS endpoint.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # This property is used to determine messaging permissions in this SINGLE_MASTER signaling channel. If
        # MASTER is specified, this API returns an endpoint that a client can use to receive offers from and
        # send answers to any of the viewers on this signaling channel. If VIEWER is specified, this API
        # returns an endpoint that a client can use only to send offers to another MASTER client on this
        # signaling channel.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @protocols : Array(String)? = nil,
          @role : String? = nil
        )
        end
      end

      # A structure that contains the configuration for the SINGLE_MASTER channel type.
      struct SingleMasterConfiguration
        include JSON::Serializable

        # The period of time (in seconds) a signaling channel retains undelivered messages before they are
        # discarded. Use to update this value.
        @[JSON::Field(key: "MessageTtlSeconds")]
        getter message_ttl_seconds : Int32?

        def initialize(
          @message_ttl_seconds : Int32? = nil
        )
        end
      end

      struct StartEdgeConfigurationUpdateInput
        include JSON::Serializable

        # The edge configuration details required to invoke the update process.
        @[JSON::Field(key: "EdgeConfig")]
        getter edge_config : Types::EdgeConfig

        # The Amazon Resource Name (ARN) of the stream. Specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream whose edge configuration you want to update. Specify either the StreamName or
        # the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @edge_config : Types::EdgeConfig,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct StartEdgeConfigurationUpdateOutput
        include JSON::Serializable

        # The timestamp at which a stream’s edge configuration was first created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT
        # Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.
        @[JSON::Field(key: "EdgeConfig")]
        getter edge_config : Types::EdgeConfig?

        # A description of the generated failure status.
        @[JSON::Field(key: "FailedStatusDetails")]
        getter failed_status_details : String?

        # The timestamp at which a stream’s edge configuration was last updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which the edge configuration was updated.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The current sync status of the stream's edge configuration. When you invoke this API, the sync
        # status will be set to the SYNCING state. Use the DescribeEdgeConfiguration API to get the latest
        # status of the edge configuration.
        @[JSON::Field(key: "SyncStatus")]
        getter sync_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @edge_config : Types::EdgeConfig? = nil,
          @failed_status_details : String? = nil,
          @last_updated_time : Time? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @sync_status : String? = nil
        )
        end
      end

      # The Exception rendered when the Amazon Kinesis Video Stream can't find a stream's edge configuration
      # that you specified.
      struct StreamEdgeConfigurationNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object describing a Kinesis video stream.
      struct StreamInfo
        include JSON::Serializable

        # A time stamp that indicates when the stream was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # How long the stream retains data, in hours.
        @[JSON::Field(key: "DataRetentionInHours")]
        getter data_retention_in_hours : Int32?

        # The name of the device that is associated with the stream.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The ID of the Key Management Service (KMS) key that Kinesis Video Streams uses to encrypt data on
        # the stream.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The MediaType of the stream.
        @[JSON::Field(key: "MediaType")]
        getter media_type : String?

        # The status of the stream.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The version of the stream.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_retention_in_hours : Int32? = nil,
          @device_name : String? = nil,
          @kms_key_id : String? = nil,
          @media_type : String? = nil,
          @status : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Specifies the condition that streams must satisfy to be returned when you list streams (see the
      # ListStreams API). A condition has a comparison operation and a value. Currently, you can specify
      # only the BEGINS_WITH operator, which finds streams whose names start with a given prefix.
      struct StreamNameCondition
        include JSON::Serializable

        # A comparison operator. Currently, you can specify only the BEGINS_WITH operator, which finds streams
        # whose names start with a given prefix.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # A value to compare.
        @[JSON::Field(key: "ComparisonValue")]
        getter comparison_value : String?

        def initialize(
          @comparison_operator : String? = nil,
          @comparison_value : String? = nil
        )
        end
      end

      # The configuration for stream storage, including the default storage tier for stream data. This
      # configuration determines how stream data is stored and accessed, with different tiers offering
      # varying levels of performance and cost optimization.
      struct StreamStorageConfiguration
        include JSON::Serializable

        # The default storage tier for the stream data. This setting determines the storage class used for
        # stream data, affecting both performance characteristics and storage costs. Available storage tiers:
        # HOT - Optimized for frequent access with the lowest latency and highest performance. Ideal for
        # real-time applications and frequently accessed data. WARM - Balanced performance and cost for
        # moderately accessed data. Suitable for data that is accessed regularly but not continuously.
        @[JSON::Field(key: "DefaultStorageTier")]
        getter default_storage_tier : String

        def initialize(
          @default_storage_tier : String
        )
        end
      end

      # A key and value pair that is associated with the specified signaling channel.
      struct Tag
        include JSON::Serializable

        # The key of the tag that is associated with the specified signaling channel.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag that is associated with the specified signaling channel.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel to which you want to add tags.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags to associate with the specified signaling channel. Each tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct TagStreamInput
        include JSON::Serializable

        # A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is
        # optional).
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        # The Amazon Resource Name (ARN) of the resource that you want to add the tag or tags to.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream that you want to add the tag or tags to.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @tags : Hash(String, String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct TagStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded the limit of tags that you can associate with the resource. A Kinesis video stream
      # can support up to 50 tags.
      struct TagsPerResourceExceededLimitException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel from which you want to remove tags.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of the keys of the tags that you want to remove.
        @[JSON::Field(key: "TagKeyList")]
        getter tag_key_list : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_key_list : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagStreamInput
        include JSON::Serializable

        # A list of the keys of the tags that you want to remove.
        @[JSON::Field(key: "TagKeyList")]
        getter tag_key_list : Array(String)

        # The Amazon Resource Name (ARN) of the stream that you want to remove tags from.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream that you want to remove tags from.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @tag_key_list : Array(String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UntagStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateDataRetentionInput
        include JSON::Serializable

        # The version of the stream whose retention period you want to change. To get the version, call either
        # the DescribeStream or the ListStreams API.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String

        # The number of hours to adjust the current retention by. The value you specify is added to or
        # subtracted from the current value, depending on the operation . The minimum value for data retention
        # is 0 and the maximum value is 87600 (ten years).
        @[JSON::Field(key: "DataRetentionChangeInHours")]
        getter data_retention_change_in_hours : Int32

        # Indicates whether you want to increase or decrease the retention period.
        @[JSON::Field(key: "Operation")]
        getter operation : String

        # The Amazon Resource Name (ARN) of the stream whose retention period you want to change.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream whose retention period you want to change.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @current_version : String,
          @data_retention_change_in_hours : Int32,
          @operation : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UpdateDataRetentionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateImageGenerationConfigurationInput
        include JSON::Serializable

        # The structure that contains the information required for the KVS images delivery. If the structure
        # is null, the configuration will be deleted from the stream.
        @[JSON::Field(key: "ImageGenerationConfiguration")]
        getter image_generation_configuration : Types::ImageGenerationConfiguration?

        # The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the image
        # generation configuration. You must specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which to update the image generation configuration. You must specify
        # either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @image_generation_configuration : Types::ImageGenerationConfiguration? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UpdateImageGenerationConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMediaStorageConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the channel.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # A structure that encapsulates, or contains, the media storage configuration properties.
        @[JSON::Field(key: "MediaStorageConfiguration")]
        getter media_storage_configuration : Types::MediaStorageConfiguration

        def initialize(
          @channel_arn : String,
          @media_storage_configuration : Types::MediaStorageConfiguration
        )
        end
      end

      struct UpdateMediaStorageConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateNotificationConfigurationInput
        include JSON::Serializable

        # The structure containing the information required for notifications. If the structure is null, the
        # configuration will be deleted from the stream.
        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        # The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the
        # notification configuration. You must specify either the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream from which to update the notification configuration. You must specify either
        # the StreamName or the StreamARN .
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @notification_configuration : Types::NotificationConfiguration? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UpdateNotificationConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateSignalingChannelInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel that you want to update.
        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # The current version of the signaling channel that you want to update.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String

        # The structure containing the configuration for the SINGLE_MASTER type of the signaling channel that
        # you want to update. This parameter and the channel message's time-to-live are required for channels
        # with the SINGLE_MASTER channel type.
        @[JSON::Field(key: "SingleMasterConfiguration")]
        getter single_master_configuration : Types::SingleMasterConfiguration?

        def initialize(
          @channel_arn : String,
          @current_version : String,
          @single_master_configuration : Types::SingleMasterConfiguration? = nil
        )
        end
      end

      struct UpdateSignalingChannelOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateStreamInput
        include JSON::Serializable

        # The version of the stream whose metadata you want to update.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String

        # The name of the device that is writing to the stream. In the current implementation, Kinesis Video
        # Streams does not use this name.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The stream's media type. Use MediaType to specify the type of content that the stream contains to
        # the consumers of the stream. For more information about media types, see Media Types . If you choose
        # to specify the MediaType , see Naming Requirements . To play video on the console, you must specify
        # the correct video type. For example, if the video in the stream is H.264, specify video/h264 as the
        # MediaType .
        @[JSON::Field(key: "MediaType")]
        getter media_type : String?

        # The ARN of the stream whose metadata you want to update.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream whose metadata you want to update. The stream name is an identifier for the
        # stream, and must be unique for each account and region.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @current_version : String,
          @device_name : String? = nil,
          @media_type : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UpdateStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateStreamStorageConfigurationInput
        include JSON::Serializable

        # The version of the stream whose storage configuration you want to change. To get the version, call
        # either the DescribeStream or the ListStreams API.
        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String

        # The new storage configuration for the stream. This includes the default storage tier that determines
        # how stream data is stored and accessed. Different storage tiers offer varying levels of performance
        # and cost optimization to match your specific use case requirements.
        @[JSON::Field(key: "StreamStorageConfiguration")]
        getter stream_storage_configuration : Types::StreamStorageConfiguration

        # The Amazon Resource Name (ARN) of the stream for which you want to update the storage configuration.
        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for which you want to update the storage configuration.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @current_version : String,
          @stream_storage_configuration : Types::StreamStorageConfiguration,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      struct UpdateStreamStorageConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration that consists of the ScheduleExpression and the DurationInMinutes details that
      # specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the
      # ScheduleConfig is not provided in the UploaderConfig , then the Edge Agent will upload at regular
      # intervals (every 1 hour).
      struct UploaderConfig
        include JSON::Serializable

        # The configuration that consists of the ScheduleExpression and the DurationInMinutes details that
        # specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the
        # ScheduleConfig is not provided in this UploaderConfig , then the Edge Agent will upload at regular
        # intervals (every 1 hour).
        @[JSON::Field(key: "ScheduleConfig")]
        getter schedule_config : Types::ScheduleConfig

        def initialize(
          @schedule_config : Types::ScheduleConfig
        )
        end
      end

      # The stream version that you specified is not the latest version. To get the latest version, use the
      # DescribeStream API.
      struct VersionMismatchException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
