require "json"
require "time"

module AwsSdk
  module MediaConnect
    module Types

      # Add a flow source to an existing bridge.
      struct AddBridgeFlowSourceRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the flow to use as a source of this bridge.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # The name of the flow source. This name is used to reference the source and must be unique among
        # sources in this bridge.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the VPC interface attachment to use for this source.
        @[JSON::Field(key: "flowVpcInterfaceAttachment")]
        getter flow_vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @flow_arn : String,
          @name : String,
          @flow_vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # Add a network output to an existing bridge.
      struct AddBridgeNetworkOutputRequest
        include JSON::Serializable

        # The network output IP Address.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String

        # The network output name. This name is used to reference the output and must be unique among outputs
        # in this bridge.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network output's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The network output port.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The network output protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The network output TTL.
        @[JSON::Field(key: "ttl")]
        getter ttl : Int32

        def initialize(
          @ip_address : String,
          @name : String,
          @network_name : String,
          @port : Int32,
          @protocol : String,
          @ttl : Int32
        )
        end
      end

      # Add a network source to an existing bridge.
      struct AddBridgeNetworkSourceRequest
        include JSON::Serializable

        # The network source multicast IP.
        @[JSON::Field(key: "multicastIp")]
        getter multicast_ip : String

        # The name of the network source. This name is used to reference the source and must be unique among
        # sources in this bridge.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network source's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The network source port.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The network source protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The settings related to the multicast source.
        @[JSON::Field(key: "multicastSourceSettings")]
        getter multicast_source_settings : Types::MulticastSourceSettings?

        def initialize(
          @multicast_ip : String,
          @name : String,
          @network_name : String,
          @port : Int32,
          @protocol : String,
          @multicast_source_settings : Types::MulticastSourceSettings? = nil
        )
        end
      end

      # Add outputs to the specified bridge.
      struct AddBridgeOutputRequest
        include JSON::Serializable

        # The network output of the bridge. A network output is delivered to your premises.
        @[JSON::Field(key: "networkOutput")]
        getter network_output : Types::AddBridgeNetworkOutputRequest?

        def initialize(
          @network_output : Types::AddBridgeNetworkOutputRequest? = nil
        )
        end
      end

      struct AddBridgeOutputsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The outputs that you want to add to this bridge.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::AddBridgeOutputRequest)

        def initialize(
          @bridge_arn : String,
          @outputs : Array(Types::AddBridgeOutputRequest)
        )
        end
      end

      struct AddBridgeOutputsResponse
        include JSON::Serializable

        # The ARN of the bridge that you added outputs to.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The outputs that you added to this bridge.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::BridgeOutput)?

        def initialize(
          @bridge_arn : String? = nil,
          @outputs : Array(Types::BridgeOutput)? = nil
        )
        end
      end

      # Add an output to a bridge.
      struct AddBridgeSourceRequest
        include JSON::Serializable

        # The source of the flow.
        @[JSON::Field(key: "flowSource")]
        getter flow_source : Types::AddBridgeFlowSourceRequest?

        # The source of the network.
        @[JSON::Field(key: "networkSource")]
        getter network_source : Types::AddBridgeNetworkSourceRequest?

        def initialize(
          @flow_source : Types::AddBridgeFlowSourceRequest? = nil,
          @network_source : Types::AddBridgeNetworkSourceRequest? = nil
        )
        end
      end

      struct AddBridgeSourcesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The sources that you want to add to this bridge.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::AddBridgeSourceRequest)

        def initialize(
          @bridge_arn : String,
          @sources : Array(Types::AddBridgeSourceRequest)
        )
        end
      end

      struct AddBridgeSourcesResponse
        include JSON::Serializable

        # The ARN of the bridge that you added sources to.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The sources that you added to this bridge.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::BridgeSource)?

        def initialize(
          @bridge_arn : String? = nil,
          @sources : Array(Types::BridgeSource)? = nil
        )
        end
      end

      # Create a bridge with the egress bridge type. An egress bridge is a cloud-to-ground bridge. The
      # content comes from an existing MediaConnect flow and is delivered to your premises.
      struct AddEgressGatewayBridgeRequest
        include JSON::Serializable

        # The maximum expected bitrate (in bps) of the egress bridge.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32

        def initialize(
          @max_bitrate : Int32
        )
        end
      end

      struct AddFlowMediaStreamsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The media streams that you want to add to the flow.
        @[JSON::Field(key: "mediaStreams")]
        getter media_streams : Array(Types::AddMediaStreamRequest)

        def initialize(
          @flow_arn : String,
          @media_streams : Array(Types::AddMediaStreamRequest)
        )
        end
      end

      struct AddFlowMediaStreamsResponse
        include JSON::Serializable

        # The ARN of the flow that you added media streams to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The media streams that you added to the flow.
        @[JSON::Field(key: "mediaStreams")]
        getter media_streams : Array(Types::MediaStream)?

        def initialize(
          @flow_arn : String? = nil,
          @media_streams : Array(Types::MediaStream)? = nil
        )
        end
      end

      # Exception raised by Elemental MediaConnect when adding the flow output. See the error message for
      # the operation for more information on the cause of this exception.
      struct AddFlowOutputs420Exception
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct AddFlowOutputsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to add outputs to.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # A list of outputs that you want to add to the flow.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::AddOutputRequest)

        def initialize(
          @flow_arn : String,
          @outputs : Array(Types::AddOutputRequest)
        )
        end
      end

      struct AddFlowOutputsResponse
        include JSON::Serializable

        # The ARN of the flow that these outputs were added to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The details of the newly added outputs.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)?

        def initialize(
          @flow_arn : String? = nil,
          @outputs : Array(Types::Output)? = nil
        )
        end
      end

      struct AddFlowSourcesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # A list of sources that you want to add to the flow.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::SetSourceRequest)

        def initialize(
          @flow_arn : String,
          @sources : Array(Types::SetSourceRequest)
        )
        end
      end

      struct AddFlowSourcesResponse
        include JSON::Serializable

        # The ARN of the flow that these sources were added to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The details of the newly added sources.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::Source)?

        def initialize(
          @flow_arn : String? = nil,
          @sources : Array(Types::Source)? = nil
        )
        end
      end

      struct AddFlowVpcInterfacesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # A list of VPC interfaces that you want to add to the flow.
        @[JSON::Field(key: "vpcInterfaces")]
        getter vpc_interfaces : Array(Types::VpcInterfaceRequest)

        def initialize(
          @flow_arn : String,
          @vpc_interfaces : Array(Types::VpcInterfaceRequest)
        )
        end
      end

      struct AddFlowVpcInterfacesResponse
        include JSON::Serializable

        # The ARN of the flow that these VPC interfaces were added to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The details of the newly added VPC interfaces.
        @[JSON::Field(key: "vpcInterfaces")]
        getter vpc_interfaces : Array(Types::VpcInterface)?

        def initialize(
          @flow_arn : String? = nil,
          @vpc_interfaces : Array(Types::VpcInterface)? = nil
        )
        end
      end

      # Create a bridge with the ingress bridge type. An ingress bridge is a ground-to-cloud bridge. The
      # content originates at your premises and is delivered to the cloud.
      struct AddIngressGatewayBridgeRequest
        include JSON::Serializable

        # The maximum expected bitrate (in bps) of the ingress bridge.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32

        # The maximum number of expected outputs on the ingress bridge.
        @[JSON::Field(key: "maxOutputs")]
        getter max_outputs : Int32

        def initialize(
          @max_bitrate : Int32,
          @max_outputs : Int32
        )
        end
      end

      # Create a maintenance setting for a flow.
      struct AddMaintenance
        include JSON::Serializable

        # A day of a week when the maintenance will happen.
        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String

        # UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes must be 00. Example:
        # 13:00. The default value is 02:00.
        @[JSON::Field(key: "maintenanceStartHour")]
        getter maintenance_start_hour : String

        def initialize(
          @maintenance_day : String,
          @maintenance_start_hour : String
        )
        end
      end

      # The media stream that you want to add to the flow.
      struct AddMediaStreamRequest
        include JSON::Serializable

        # A unique identifier for the media stream.
        @[JSON::Field(key: "mediaStreamId")]
        getter media_stream_id : Int32

        # A name that helps you distinguish one media stream from another.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The type of media stream.
        @[JSON::Field(key: "mediaStreamType")]
        getter media_stream_type : String

        # The attributes that you want to assign to the new media stream.
        @[JSON::Field(key: "attributes")]
        getter attributes : Types::MediaStreamAttributesRequest?

        # The sample rate (in Hz) for the stream. If the media stream type is video or ancillary data, set
        # this value to 90000. If the media stream type is audio, set this value to either 48000 or 96000.
        @[JSON::Field(key: "clockRate")]
        getter clock_rate : Int32?

        # A description that can help you quickly identify what your media stream is used for.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The key-value pairs that can be used to tag and organize the media stream.
        @[JSON::Field(key: "mediaStreamTags")]
        getter media_stream_tags : Hash(String, String)?

        # The resolution of the video.
        @[JSON::Field(key: "videoFormat")]
        getter video_format : String?

        def initialize(
          @media_stream_id : Int32,
          @media_stream_name : String,
          @media_stream_type : String,
          @attributes : Types::MediaStreamAttributesRequest? = nil,
          @clock_rate : Int32? = nil,
          @description : String? = nil,
          @media_stream_tags : Hash(String, String)? = nil,
          @video_format : String? = nil
        )
        end
      end

      # A request to add an output to a flow.
      struct AddOutputRequest
        include JSON::Serializable

        # The range of IP addresses that should be allowed to initiate output requests to this flow. These IP
        # addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example,
        # 10.0.0.0/16.
        @[JSON::Field(key: "cidrAllowList")]
        getter cidr_allow_list : Array(String)?

        # A description of the output. This description appears only on the Audit Manager console and will not
        # be seen by the end user.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The IP address from which video will be sent to output destinations.
        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The type of key used for the encryption. If no keyType is provided, the service will use the default
        # setting (static-key). Allowable encryption types: static-key.
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::Encryption?

        # The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based
        # streams.
        @[JSON::Field(key: "maxLatency")]
        getter max_latency : Int32?

        # The media streams that are associated with the output, and the parameters for those associations.
        @[JSON::Field(key: "mediaStreamOutputConfigurations")]
        getter media_stream_output_configurations : Array(Types::MediaStreamOutputConfigurationRequest)?

        # The minimum latency in milliseconds for SRT-based streams. In streams that use the SRT protocol,
        # this value that you set on your MediaConnect source or output represents the minimal potential
        # latency of that connection. The latency of the stream is set to the highest number between the
        # sender’s minimum latency and the receiver’s minimum latency.
        @[JSON::Field(key: "minLatency")]
        getter min_latency : Int32?

        # The name of the output. This value must be unique within the current flow.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A suffix for the names of the NDI sources that the flow creates. If a custom name isn't specified,
        # MediaConnect uses the output name.
        @[JSON::Field(key: "ndiProgramName")]
        getter ndi_program_name : String?

        # A quality setting for the NDI Speed HQ encoder.
        @[JSON::Field(key: "ndiSpeedHqQuality")]
        getter ndi_speed_hq_quality : Int32?

        # An indication of whether the new output should be enabled or disabled as soon as it is created. If
        # you don't specify the outputStatus field in your request, MediaConnect sets it to ENABLED.
        @[JSON::Field(key: "outputStatus")]
        getter output_status : String?

        # The key-value pairs that can be used to tag and organize the output.
        @[JSON::Field(key: "outputTags")]
        getter output_tags : Hash(String, String)?

        # The port to use when content is distributed to this output.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol to use for the output. Elemental MediaConnect no longer supports the Fujitsu QoS
        # protocol. This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The remote ID for the Zixi-pull output stream.
        @[JSON::Field(key: "remoteId")]
        getter remote_id : String?

        # Indicates whether to enable or disable router integration when creating a new flow output.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        @[JSON::Field(key: "routerIntegrationTransitEncryption")]
        getter router_integration_transit_encryption : Types::FlowTransitEncryption?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "smoothingLatency")]
        getter smoothing_latency : Int32?

        # The stream ID that you want to use for this transport. This parameter applies only to Zixi and SRT
        # caller-based streams.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The name of the VPC interface attachment to use for this output.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @cidr_allow_list : Array(String)? = nil,
          @description : String? = nil,
          @destination : String? = nil,
          @encryption : Types::Encryption? = nil,
          @max_latency : Int32? = nil,
          @media_stream_output_configurations : Array(Types::MediaStreamOutputConfigurationRequest)? = nil,
          @min_latency : Int32? = nil,
          @name : String? = nil,
          @ndi_program_name : String? = nil,
          @ndi_speed_hq_quality : Int32? = nil,
          @output_status : String? = nil,
          @output_tags : Hash(String, String)? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @remote_id : String? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_encryption : Types::FlowTransitEncryption? = nil,
          @sender_control_port : Int32? = nil,
          @smoothing_latency : Int32? = nil,
          @stream_id : String? = nil,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # Specifies the configuration for audio stream metrics monitoring.
      struct AudioMonitoringSetting
        include JSON::Serializable

        # Detects periods of silence.
        @[JSON::Field(key: "silentAudio")]
        getter silent_audio : Types::SilentAudio?

        def initialize(
          @silent_audio : Types::SilentAudio? = nil
        )
        end
      end

      # Configuration settings for automatic encryption key management, where MediaConnect handles key
      # creation and rotation.
      struct AutomaticEncryptionKeyConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown if the request contains a semantic error. The precise meaning depends on
      # the API, and is documented in the error message.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An error that occurred when retrieving multiple router inputs in the BatchGetRouterInput operation,
      # including the ARN, error code, and error message.
      struct BatchGetRouterInputError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input for which the error occurred.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The error code associated with the error.
        @[JSON::Field(key: "code")]
        getter code : String

        # A message describing the error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @arn : String,
          @code : String,
          @message : String
        )
        end
      end

      struct BatchGetRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the router inputs you want to retrieve information about.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end

      struct BatchGetRouterInputResponse
        include JSON::Serializable

        # An array of errors that occurred when retrieving the requested router inputs.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetRouterInputError)

        # An array of router inputs that were successfully retrieved.
        @[JSON::Field(key: "routerInputs")]
        getter router_inputs : Array(Types::RouterInput)

        def initialize(
          @errors : Array(Types::BatchGetRouterInputError),
          @router_inputs : Array(Types::RouterInput)
        )
        end
      end

      # An error that occurred when retrieving multiple router network interfaces in the
      # BatchGetRouterNetworkInterface operation, including the ARN, error code, and error message.
      struct BatchGetRouterNetworkInterfaceError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface for which the error occurred.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The error code associated with the error.
        @[JSON::Field(key: "code")]
        getter code : String

        # A message describing the error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @arn : String,
          @code : String,
          @message : String
        )
        end
      end

      struct BatchGetRouterNetworkInterfaceRequest
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the router network interfaces you want to retrieve information
        # about.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end

      struct BatchGetRouterNetworkInterfaceResponse
        include JSON::Serializable

        # An array of errors that occurred when retrieving the requested router network interfaces.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetRouterNetworkInterfaceError)

        # An array of router network interfaces that were successfully retrieved.
        @[JSON::Field(key: "routerNetworkInterfaces")]
        getter router_network_interfaces : Array(Types::RouterNetworkInterface)

        def initialize(
          @errors : Array(Types::BatchGetRouterNetworkInterfaceError),
          @router_network_interfaces : Array(Types::RouterNetworkInterface)
        )
        end
      end

      # An error that occurred when retrieving multiple router outputs in the BatchGetRouterOutput
      # operation, including the ARN, error code, and error message.
      struct BatchGetRouterOutputError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output for which the error occurred.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The error code associated with the error.
        @[JSON::Field(key: "code")]
        getter code : String

        # A message describing the error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @arn : String,
          @code : String,
          @message : String
        )
        end
      end

      struct BatchGetRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the router outputs you want to retrieve information about.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end

      struct BatchGetRouterOutputResponse
        include JSON::Serializable

        # An array of errors that occurred when retrieving the requested router outputs.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetRouterOutputError)

        # An array of router outputs that were successfully retrieved.
        @[JSON::Field(key: "routerOutputs")]
        getter router_outputs : Array(Types::RouterOutput)

        def initialize(
          @errors : Array(Types::BatchGetRouterOutputError),
          @router_outputs : Array(Types::RouterOutput)
        )
        end
      end

      # Configures settings for the BlackFrames metric.
      struct BlackFrames
        include JSON::Serializable

        # Indicates whether the BlackFrames metric is enabled or disabled..
        @[JSON::Field(key: "state")]
        getter state : String?

        # Specifies the number of consecutive seconds of black frames that triggers an event or alert.
        @[JSON::Field(key: "thresholdSeconds")]
        getter threshold_seconds : Int32?

        def initialize(
          @state : String? = nil,
          @threshold_seconds : Int32? = nil
        )
        end
      end

      # A Bridge is the connection between your data center's Instances and the Amazon Web Services cloud. A
      # bridge can be used to send video from the Amazon Web Services cloud to your data center or from your
      # data center to the Amazon Web Services cloud.
      struct Bridge
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the bridge.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String

        # The state of the bridge.
        @[JSON::Field(key: "bridgeState")]
        getter bridge_state : String

        # The name of the bridge.
        @[JSON::Field(key: "name")]
        getter name : String

        # The placement Amazon Resource Number (ARN) of the bridge.
        @[JSON::Field(key: "placementArn")]
        getter placement_arn : String

        # Messages with details about the bridge.
        @[JSON::Field(key: "bridgeMessages")]
        getter bridge_messages : Array(Types::MessageDetail)?

        # An egress bridge is a cloud-to-ground bridge. The content comes from an existing MediaConnect flow
        # and is delivered to your premises.
        @[JSON::Field(key: "egressGatewayBridge")]
        getter egress_gateway_bridge : Types::EgressGatewayBridge?

        # An ingress bridge is a ground-to-cloud bridge. The content originates at your premises and is
        # delivered to the cloud.
        @[JSON::Field(key: "ingressGatewayBridge")]
        getter ingress_gateway_bridge : Types::IngressGatewayBridge?

        # The outputs on this bridge.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::BridgeOutput)?

        # The settings for source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::FailoverConfig?

        # The sources on this bridge.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::BridgeSource)?

        def initialize(
          @bridge_arn : String,
          @bridge_state : String,
          @name : String,
          @placement_arn : String,
          @bridge_messages : Array(Types::MessageDetail)? = nil,
          @egress_gateway_bridge : Types::EgressGatewayBridge? = nil,
          @ingress_gateway_bridge : Types::IngressGatewayBridge? = nil,
          @outputs : Array(Types::BridgeOutput)? = nil,
          @source_failover_config : Types::FailoverConfig? = nil,
          @sources : Array(Types::BridgeSource)? = nil
        )
        end
      end

      # The output of the bridge. A flow output is delivered to the Amazon Web Services cloud.
      struct BridgeFlowOutput
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the cloud flow.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # The Amazon Resource Number (ARN) of the flow source.
        @[JSON::Field(key: "flowSourceArn")]
        getter flow_source_arn : String

        # The name of the bridge's output.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @flow_arn : String,
          @flow_source_arn : String,
          @name : String
        )
        end
      end

      # The source of the bridge. A flow source originates in MediaConnect as an existing cloud flow.
      struct BridgeFlowSource
        include JSON::Serializable

        # The ARN of the cloud flow used as a source of this bridge.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # The name of the flow source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the VPC interface attachment to use for this source.
        @[JSON::Field(key: "flowVpcInterfaceAttachment")]
        getter flow_vpc_interface_attachment : Types::VpcInterfaceAttachment?

        # The Amazon Resource Number (ARN) of the output.
        @[JSON::Field(key: "outputArn")]
        getter output_arn : String?

        def initialize(
          @flow_arn : String,
          @name : String,
          @flow_vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil,
          @output_arn : String? = nil
        )
        end
      end

      # The output of the bridge. A network output is delivered to your premises.
      struct BridgeNetworkOutput
        include JSON::Serializable

        # The network output IP address.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String

        # The network output name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network output's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The network output's port.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The network output protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The network output TTL.
        @[JSON::Field(key: "ttl")]
        getter ttl : Int32

        def initialize(
          @ip_address : String,
          @name : String,
          @network_name : String,
          @port : Int32,
          @protocol : String,
          @ttl : Int32
        )
        end
      end

      # The source of the bridge. A network source originates at your premises.
      struct BridgeNetworkSource
        include JSON::Serializable

        # The network source multicast IP.
        @[JSON::Field(key: "multicastIp")]
        getter multicast_ip : String

        # The name of the network source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network source's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The network source port.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The network source protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The settings related to the multicast source.
        @[JSON::Field(key: "multicastSourceSettings")]
        getter multicast_source_settings : Types::MulticastSourceSettings?

        def initialize(
          @multicast_ip : String,
          @name : String,
          @network_name : String,
          @port : Int32,
          @protocol : String,
          @multicast_source_settings : Types::MulticastSourceSettings? = nil
        )
        end
      end

      # The output of the bridge.
      struct BridgeOutput
        include JSON::Serializable

        # The output of the associated flow.
        @[JSON::Field(key: "flowOutput")]
        getter flow_output : Types::BridgeFlowOutput?

        # The network output for the bridge.
        @[JSON::Field(key: "networkOutput")]
        getter network_output : Types::BridgeNetworkOutput?

        def initialize(
          @flow_output : Types::BridgeFlowOutput? = nil,
          @network_output : Types::BridgeNetworkOutput? = nil
        )
        end
      end

      # The bridge's source.
      struct BridgeSource
        include JSON::Serializable

        # The source of the associated flow.
        @[JSON::Field(key: "flowSource")]
        getter flow_source : Types::BridgeFlowSource?

        # The network source for the bridge.
        @[JSON::Field(key: "networkSource")]
        getter network_source : Types::BridgeNetworkSource?

        def initialize(
          @flow_source : Types::BridgeFlowSource? = nil,
          @network_source : Types::BridgeNetworkSource? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Exception raised by Elemental MediaConnect when creating the bridge. See the error message for the
      # operation for more information on the cause of this exception.
      struct CreateBridge420Exception
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateBridgeRequest
        include JSON::Serializable

        # The name of the bridge. This name can not be modified after the bridge is created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The bridge placement Amazon Resource Number (ARN).
        @[JSON::Field(key: "placementArn")]
        getter placement_arn : String

        # The sources that you want to add to this bridge.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::AddBridgeSourceRequest)

        # An egress bridge is a cloud-to-ground bridge. The content comes from an existing MediaConnect flow
        # and is delivered to your premises.
        @[JSON::Field(key: "egressGatewayBridge")]
        getter egress_gateway_bridge : Types::AddEgressGatewayBridgeRequest?

        # An ingress bridge is a ground-to-cloud bridge. The content originates at your premises and is
        # delivered to the cloud.
        @[JSON::Field(key: "ingressGatewayBridge")]
        getter ingress_gateway_bridge : Types::AddIngressGatewayBridgeRequest?

        # The outputs that you want to add to this bridge.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::AddBridgeOutputRequest)?

        # The settings for source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::FailoverConfig?

        def initialize(
          @name : String,
          @placement_arn : String,
          @sources : Array(Types::AddBridgeSourceRequest),
          @egress_gateway_bridge : Types::AddEgressGatewayBridgeRequest? = nil,
          @ingress_gateway_bridge : Types::AddIngressGatewayBridgeRequest? = nil,
          @outputs : Array(Types::AddBridgeOutputRequest)? = nil,
          @source_failover_config : Types::FailoverConfig? = nil
        )
        end
      end

      struct CreateBridgeResponse
        include JSON::Serializable

        # The name of the bridge that was created.
        @[JSON::Field(key: "bridge")]
        getter bridge : Types::Bridge?

        def initialize(
          @bridge : Types::Bridge? = nil
        )
        end
      end

      # Exception raised by Elemental MediaConnect when creating the flow. See the error message for the
      # operation for more information on the cause of this exception.
      struct CreateFlow420Exception
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateFlowRequest
        include JSON::Serializable

        # The name of the flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Availability Zone that you want to create the flow in. These options are limited to the
        # Availability Zones within the current Amazon Web Services Region.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The entitlements that you want to grant on a flow.
        @[JSON::Field(key: "entitlements")]
        getter entitlements : Array(Types::GrantEntitlementRequest)?

        # Determines the processing capacity and feature set of the flow. Set this optional parameter to LARGE
        # if you want to enable NDI outputs on the flow.
        @[JSON::Field(key: "flowSize")]
        getter flow_size : String?

        # The key-value pairs that can be used to tag and organize the flow.
        @[JSON::Field(key: "flowTags")]
        getter flow_tags : Hash(String, String)?

        # The maintenance settings you want to use for the flow.
        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::AddMaintenance?

        # The media streams that you want to add to the flow. You can associate these media streams with
        # sources and outputs on the flow.
        @[JSON::Field(key: "mediaStreams")]
        getter media_streams : Array(Types::AddMediaStreamRequest)?

        # Specifies the configuration settings for NDI outputs. Required when the flow includes NDI outputs.
        @[JSON::Field(key: "ndiConfig")]
        getter ndi_config : Types::NdiConfig?

        # The outputs that you want to add to this flow.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::AddOutputRequest)?

        # The settings for the source that you want to use for the new flow.
        @[JSON::Field(key: "source")]
        getter source : Types::SetSourceRequest?

        # The settings for source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::FailoverConfig?

        # The settings for source monitoring.
        @[JSON::Field(key: "sourceMonitoringConfig")]
        getter source_monitoring_config : Types::MonitoringConfig?

        # The sources that are assigned to the flow.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::SetSourceRequest)?

        # The VPC interfaces you want on the flow.
        @[JSON::Field(key: "vpcInterfaces")]
        getter vpc_interfaces : Array(Types::VpcInterfaceRequest)?

        def initialize(
          @name : String,
          @availability_zone : String? = nil,
          @entitlements : Array(Types::GrantEntitlementRequest)? = nil,
          @flow_size : String? = nil,
          @flow_tags : Hash(String, String)? = nil,
          @maintenance : Types::AddMaintenance? = nil,
          @media_streams : Array(Types::AddMediaStreamRequest)? = nil,
          @ndi_config : Types::NdiConfig? = nil,
          @outputs : Array(Types::AddOutputRequest)? = nil,
          @source : Types::SetSourceRequest? = nil,
          @source_failover_config : Types::FailoverConfig? = nil,
          @source_monitoring_config : Types::MonitoringConfig? = nil,
          @sources : Array(Types::SetSourceRequest)? = nil,
          @vpc_interfaces : Array(Types::VpcInterfaceRequest)? = nil
        )
        end
      end

      struct CreateFlowResponse
        include JSON::Serializable

        # The flow that you created.
        @[JSON::Field(key: "flow")]
        getter flow : Types::Flow?

        def initialize(
          @flow : Types::Flow? = nil
        )
        end
      end

      # Exception raised by Elemental MediaConnect when creating the gateway. See the error message for the
      # operation for more information on the cause of this exception.
      struct CreateGateway420Exception
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateGatewayRequest
        include JSON::Serializable

        # The range of IP addresses that are allowed to contribute content or initiate output requests for
        # flows communicating with this gateway. These IP addresses should be in the form of a Classless
        # Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
        @[JSON::Field(key: "egressCidrBlocks")]
        getter egress_cidr_blocks : Array(String)

        # The name of the gateway. This name can not be modified after the gateway is created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The list of networks that you want to add to the gateway.
        @[JSON::Field(key: "networks")]
        getter networks : Array(Types::GatewayNetwork)

        def initialize(
          @egress_cidr_blocks : Array(String),
          @name : String,
          @networks : Array(Types::GatewayNetwork)
        )
        end
      end

      struct CreateGatewayResponse
        include JSON::Serializable

        # The gateway that you created.
        @[JSON::Field(key: "gateway")]
        getter gateway : Types::Gateway?

        def initialize(
          @gateway : Types::Gateway? = nil
        )
        end
      end

      struct CreateRouterInputRequest
        include JSON::Serializable

        # The configuration settings for the router input, which can include the protocol, network interface,
        # and other details.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterInputConfiguration

        # The maximum bitrate for the router input.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The name of the router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether the router input can be assigned to outputs in different Regions. REGIONAL
        # (default) - connects only to outputs in same Region. GLOBAL - connects to outputs in any Region.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The tier level for the router input.
        @[JSON::Field(key: "tier")]
        getter tier : String

        # The Availability Zone where you want to create the router input. This must be a valid Availability
        # Zone for the region specified by regionName , or the current region if no regionName is provided.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # A unique identifier for the request to ensure idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The maintenance configuration settings for the router input, including preferred maintenance windows
        # and schedules.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration?

        # The AWS Region for the router input. Defaults to the current region if not specified.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # Key-value pairs that can be used to tag and organize this router input.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The transit encryption settings for the router input.
        @[JSON::Field(key: "transitEncryption")]
        getter transit_encryption : Types::RouterInputTransitEncryption?

        def initialize(
          @configuration : Types::RouterInputConfiguration,
          @maximum_bitrate : Int64,
          @name : String,
          @routing_scope : String,
          @tier : String,
          @availability_zone : String? = nil,
          @client_token : String? = nil,
          @maintenance_configuration : Types::MaintenanceConfiguration? = nil,
          @region_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transit_encryption : Types::RouterInputTransitEncryption? = nil
        )
        end
      end

      struct CreateRouterInputResponse
        include JSON::Serializable

        # The newly-created router input.
        @[JSON::Field(key: "routerInput")]
        getter router_input : Types::RouterInput

        def initialize(
          @router_input : Types::RouterInput
        )
        end
      end

      struct CreateRouterNetworkInterfaceRequest
        include JSON::Serializable

        # The configuration settings for the router network interface.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterNetworkInterfaceConfiguration

        # The name of the router network interface.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique identifier for the request to ensure idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The AWS Region for the router network interface. Defaults to the current region if not specified.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # Key-value pairs that can be used to tag and organize this router network interface.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::RouterNetworkInterfaceConfiguration,
          @name : String,
          @client_token : String? = nil,
          @region_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRouterNetworkInterfaceResponse
        include JSON::Serializable

        # The newly-created router network interface.
        @[JSON::Field(key: "routerNetworkInterface")]
        getter router_network_interface : Types::RouterNetworkInterface

        def initialize(
          @router_network_interface : Types::RouterNetworkInterface
        )
        end
      end

      struct CreateRouterOutputRequest
        include JSON::Serializable

        # The configuration settings for the router output.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterOutputConfiguration

        # The maximum bitrate for the router output.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The name of the router output.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether the router output can take inputs that are in different Regions. REGIONAL
        # (default) - can only take inputs from same Region. GLOBAL - can take inputs from any Region.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The tier level for the router output.
        @[JSON::Field(key: "tier")]
        getter tier : String

        # The Availability Zone where you want to create the router output. This must be a valid Availability
        # Zone for the region specified by regionName , or the current region if no regionName is provided.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # A unique identifier for the request to ensure idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The maintenance configuration settings for the router output, including preferred maintenance
        # windows and schedules.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration?

        # The AWS Region for the router output. Defaults to the current region if not specified.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # Key-value pairs that can be used to tag this router output.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::RouterOutputConfiguration,
          @maximum_bitrate : Int64,
          @name : String,
          @routing_scope : String,
          @tier : String,
          @availability_zone : String? = nil,
          @client_token : String? = nil,
          @maintenance_configuration : Types::MaintenanceConfiguration? = nil,
          @region_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRouterOutputResponse
        include JSON::Serializable

        # The newly-created router output.
        @[JSON::Field(key: "routerOutput")]
        getter router_output : Types::RouterOutput

        def initialize(
          @router_output : Types::RouterOutput
        )
        end
      end

      # Configuration settings for default maintenance scheduling.
      struct DefaultMaintenanceConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteBridgeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to delete.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        def initialize(
          @bridge_arn : String
        )
        end
      end

      struct DeleteBridgeResponse
        include JSON::Serializable

        # The ARN of the deleted bridge.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        def initialize(
          @bridge_arn : String? = nil
        )
        end
      end

      struct DeleteFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to delete.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct DeleteFlowResponse
        include JSON::Serializable

        # The ARN of the flow that was deleted.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The status of the flow when the DeleteFlow process begins.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @flow_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteGatewayRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway that you want to delete.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct DeleteGatewayResponse
        include JSON::Serializable

        # The ARN of the gateway that was deleted.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct DeleteRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to delete.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteRouterInputResponse
        include JSON::Serializable

        # The ARN of the deleted router input.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the deleted router input, indicating where it is in the deletion process.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct DeleteRouterNetworkInterfaceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface that you want to delete.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteRouterNetworkInterfaceResponse
        include JSON::Serializable

        # The ARN of the deleted router network interface.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted router network interface.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the deleted router network interface, indicating where it is in the deletion
        # process.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct DeleteRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to delete.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteRouterOutputResponse
        include JSON::Serializable

        # The ARN of the deleted router output.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted router output.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the deleted router output, indicating where it is in the deletion process.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct DeregisterGatewayInstanceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway that contains the instance that you want to
        # deregister.
        @[JSON::Field(key: "GatewayInstanceArn")]
        getter gateway_instance_arn : String

        # Force the deregistration of an instance. Force will deregister an instance, even if there are
        # bridges running on it.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @gateway_instance_arn : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeregisterGatewayInstanceResponse
        include JSON::Serializable

        # The ARN of the instance.
        @[JSON::Field(key: "gatewayInstanceArn")]
        getter gateway_instance_arn : String?

        # The status of the instance.
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String?

        def initialize(
          @gateway_instance_arn : String? = nil,
          @instance_state : String? = nil
        )
        end
      end

      struct DescribeBridgeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to describe.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        def initialize(
          @bridge_arn : String
        )
        end
      end

      struct DescribeBridgeResponse
        include JSON::Serializable

        # The bridge that you requested a description of.
        @[JSON::Field(key: "bridge")]
        getter bridge : Types::Bridge?

        def initialize(
          @bridge : Types::Bridge? = nil
        )
        end
      end

      struct DescribeFlowRequest
        include JSON::Serializable

        # The ARN of the flow that you want to describe.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct DescribeFlowResponse
        include JSON::Serializable

        # The flow that you requested a description of.
        @[JSON::Field(key: "flow")]
        getter flow : Types::Flow?

        # Any errors that apply currently to the flow. If there are no errors, MediaConnect will not include
        # this field in the response.
        @[JSON::Field(key: "messages")]
        getter messages : Types::Messages?

        def initialize(
          @flow : Types::Flow? = nil,
          @messages : Types::Messages? = nil
        )
        end
      end

      struct DescribeFlowSourceMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct DescribeFlowSourceMetadataResponse
        include JSON::Serializable

        # The ARN of the flow that DescribeFlowSourceMetadata was performed on.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # Provides a status code and message regarding issues found with the flow source metadata.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::MessageDetail)?

        # The timestamp of the most recent change in metadata for this flow’s source.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        # Information about the flow's transport media.
        @[JSON::Field(key: "transportMediaInfo")]
        getter transport_media_info : Types::TransportMediaInfo?

        def initialize(
          @flow_arn : String? = nil,
          @messages : Array(Types::MessageDetail)? = nil,
          @timestamp : Time? = nil,
          @transport_media_info : Types::TransportMediaInfo? = nil
        )
        end
      end

      struct DescribeFlowSourceThumbnailRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct DescribeFlowSourceThumbnailResponse
        include JSON::Serializable

        # The details of the thumbnail, including thumbnail base64 string, timecode and the time when
        # thumbnail was generated.
        @[JSON::Field(key: "thumbnailDetails")]
        getter thumbnail_details : Types::ThumbnailDetails?

        def initialize(
          @thumbnail_details : Types::ThumbnailDetails? = nil
        )
        end
      end

      struct DescribeGatewayInstanceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway instance that you want to describe.
        @[JSON::Field(key: "GatewayInstanceArn")]
        getter gateway_instance_arn : String

        def initialize(
          @gateway_instance_arn : String
        )
        end
      end

      struct DescribeGatewayInstanceResponse
        include JSON::Serializable

        # The gateway instance that you requested a description of.
        @[JSON::Field(key: "gatewayInstance")]
        getter gateway_instance : Types::GatewayInstance?

        def initialize(
          @gateway_instance : Types::GatewayInstance? = nil
        )
        end
      end

      struct DescribeGatewayRequest
        include JSON::Serializable

        # The ARN of the gateway that you want to describe.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct DescribeGatewayResponse
        include JSON::Serializable

        # The gateway that you wanted to describe.
        @[JSON::Field(key: "gateway")]
        getter gateway : Types::Gateway?

        def initialize(
          @gateway : Types::Gateway? = nil
        )
        end
      end

      struct DescribeOfferingRequest
        include JSON::Serializable

        # The ARN of the offering.
        @[JSON::Field(key: "OfferingArn")]
        getter offering_arn : String

        def initialize(
          @offering_arn : String
        )
        end
      end

      struct DescribeOfferingResponse
        include JSON::Serializable

        # The offering that you requested a description of.
        @[JSON::Field(key: "offering")]
        getter offering : Types::Offering?

        def initialize(
          @offering : Types::Offering? = nil
        )
        end
      end

      struct DescribeReservationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the offering.
        @[JSON::Field(key: "ReservationArn")]
        getter reservation_arn : String

        def initialize(
          @reservation_arn : String
        )
        end
      end

      struct DescribeReservationResponse
        include JSON::Serializable

        # A pricing agreement for a discounted rate for a specific outbound bandwidth that your MediaConnect
        # account will use each month over a specific time period. The discounted rate in the reservation
        # applies to outbound bandwidth for all flows from your account until your account reaches the amount
        # of bandwidth in your reservation. If you use more outbound bandwidth than the agreed upon amount in
        # a single month, the overage is charged at the on-demand rate.
        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      # The transport parameters that you want to associate with an outbound media stream.
      struct DestinationConfiguration
        include JSON::Serializable

        # The IP address where you want MediaConnect to send contents of the media stream.
        @[JSON::Field(key: "destinationIp")]
        getter destination_ip : String

        # The port that you want MediaConnect to use when it distributes the media stream to the output.
        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32

        # The VPC interface that you want to use for the media stream associated with the output.
        @[JSON::Field(key: "interface")]
        getter interface : Types::Interface

        # The IP address that the receiver requires in order to establish a connection with the flow. This
        # value is represented by the elastic network interface IP address of the VPC. This field applies only
        # to outputs that use the CDI or ST 2110 JPEG XS or protocol.
        @[JSON::Field(key: "outboundIp")]
        getter outbound_ip : String

        def initialize(
          @destination_ip : String,
          @destination_port : Int32,
          @interface : Types::Interface,
          @outbound_ip : String
        )
        end
      end

      # The definition of a media stream that you want to associate with the output.
      struct DestinationConfigurationRequest
        include JSON::Serializable

        # The IP address where you want MediaConnect to send contents of the media stream.
        @[JSON::Field(key: "destinationIp")]
        getter destination_ip : String

        # The port that you want MediaConnect to use when it distributes the media stream to the output.
        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32

        # The VPC interface that you want to use for the media stream associated with the output.
        @[JSON::Field(key: "interface")]
        getter interface : Types::InterfaceRequest

        def initialize(
          @destination_ip : String,
          @destination_port : Int32,
          @interface : Types::InterfaceRequest
        )
        end
      end

      # Create a bridge with the egress bridge type. An egress bridge is a cloud-to-ground bridge. The
      # content comes from an existing MediaConnect flow and is delivered to your premises.
      struct EgressGatewayBridge
        include JSON::Serializable

        # The maximum expected bitrate (in bps) of the egress bridge.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32

        # The ID of the instance running this bridge.
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        def initialize(
          @max_bitrate : Int32,
          @instance_id : String? = nil
        )
        end
      end

      # A collection of parameters that determine how MediaConnect will convert the content. These fields
      # only apply to outputs on flows that have a CDI source.
      struct EncodingParameters
        include JSON::Serializable

        # A value that is used to calculate compression for an output. The bitrate of the output is calculated
        # as follows: Output bitrate = (1 / compressionFactor) * (source bitrate) This property only applies
        # to outputs that use the ST 2110 JPEG XS protocol, with a flow source that uses the CDI protocol.
        # Valid values are floating point numbers in the range of 3.0 to 10.0, inclusive.
        @[JSON::Field(key: "compressionFactor")]
        getter compression_factor : Float64

        # A setting on the encoder that drives compression settings. This property only applies to video media
        # streams associated with outputs that use the ST 2110 JPEG XS protocol, with a flow source that uses
        # the CDI protocol.
        @[JSON::Field(key: "encoderProfile")]
        getter encoder_profile : String

        def initialize(
          @compression_factor : Float64,
          @encoder_profile : String
        )
        end
      end

      # A collection of parameters that determine how MediaConnect will convert the content. These fields
      # only apply to outputs on flows that have a CDI source.
      struct EncodingParametersRequest
        include JSON::Serializable

        # A value that is used to calculate compression for an output. The bitrate of the output is calculated
        # as follows: Output bitrate = (1 / compressionFactor) * (source bitrate) This property only applies
        # to outputs that use the ST 2110 JPEG XS protocol, with a flow source that uses the CDI protocol.
        # Valid values are floating point numbers in the range of 3.0 to 10.0, inclusive.
        @[JSON::Field(key: "compressionFactor")]
        getter compression_factor : Float64

        # A setting on the encoder that drives compression settings. This property only applies to video media
        # streams associated with outputs that use the ST 2110 JPEG XS protocol, if at least one source on the
        # flow uses the CDI protocol.
        @[JSON::Field(key: "encoderProfile")]
        getter encoder_profile : String

        def initialize(
          @compression_factor : Float64,
          @encoder_profile : String
        )
        end
      end

      # Information about the encryption of the flow.
      struct Encryption
        include JSON::Serializable

        # The ARN of the role that you created during setup (when you set up MediaConnect as a trusted
        # entity).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The type of algorithm that is used for the encryption (such as aes128, aes192, or aes256).
        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # A 128-bit, 16-byte hex value represented by a 32-character string, to be used with the key for
        # encrypting content. This parameter is not valid for static key encryption.
        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        # The value of one of the devices that you configured with your digital rights management (DRM)
        # platform key provider. This parameter is required for SPEKE encryption and is not valid for static
        # key encryption.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String?

        # The type of key that is used for the encryption. If no keyType is provided, the service will use the
        # default setting (static-key).
        @[JSON::Field(key: "keyType")]
        getter key_type : String?

        # The Amazon Web Services Region that the API Gateway proxy endpoint was created in. This parameter is
        # required for SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "region")]
        getter region : String?

        # An identifier for the content. The service sends this value to the key server to identify the
        # current endpoint. The resource ID is also known as the content ID. This parameter is required for
        # SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The ARN of the secret that you created in Secrets Manager to store the encryption key. This
        # parameter is required for static key encryption and is not valid for SPEKE encryption.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        # The URL from the API Gateway proxy that you set up to talk to your key server. This parameter is
        # required for SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @role_arn : String,
          @algorithm : String? = nil,
          @constant_initialization_vector : String? = nil,
          @device_id : String? = nil,
          @key_type : String? = nil,
          @region : String? = nil,
          @resource_id : String? = nil,
          @secret_arn : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The settings for a flow entitlement.
      struct Entitlement
        include JSON::Serializable

        # The ARN of the entitlement.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String

        # The name of the entitlement.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account IDs that you want to share your content with. The receiving accounts
        # (subscribers) will be allowed to create their own flow using your content as the source.
        @[JSON::Field(key: "subscribers")]
        getter subscribers : Array(String)

        # Percentage from 0-100 of the data transfer cost to be billed to the subscriber.
        @[JSON::Field(key: "dataTransferSubscriberFeePercent")]
        getter data_transfer_subscriber_fee_percent : Int32?

        # A description of the entitlement.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of encryption that will be used on the output that is associated with this entitlement.
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::Encryption?

        # An indication of whether the entitlement is enabled.
        @[JSON::Field(key: "entitlementStatus")]
        getter entitlement_status : String?

        def initialize(
          @entitlement_arn : String,
          @name : String,
          @subscribers : Array(String),
          @data_transfer_subscriber_fee_percent : Int32? = nil,
          @description : String? = nil,
          @encryption : Types::Encryption? = nil,
          @entitlement_status : String? = nil
        )
        end
      end

      # The settings for source failover.
      struct FailoverConfig
        include JSON::Serializable

        # The type of failover you choose for this flow. MERGE combines the source streams into a single
        # stream, allowing graceful recovery from any single-source loss. FAILOVER allows switching between
        # different streams.
        @[JSON::Field(key: "failoverMode")]
        getter failover_mode : String?

        # Search window time to look for dash-7 packets.
        @[JSON::Field(key: "recoveryWindow")]
        getter recovery_window : Int32?

        # The priority you want to assign to a source. You can have a primary stream and a backup stream or
        # two equally prioritized streams.
        @[JSON::Field(key: "sourcePriority")]
        getter source_priority : Types::SourcePriority?

        # The state of source failover on the flow. If the state is inactive, the flow can have only one
        # source. If the state is active, the flow can have one or two sources.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @failover_mode : String? = nil,
          @recovery_window : Int32? = nil,
          @source_priority : Types::SourcePriority? = nil,
          @state : String? = nil
        )
        end
      end

      # Configuration settings for a failover router input that allows switching between two input sources.
      struct FailoverRouterInputConfiguration
        include JSON::Serializable

        # The ARN of the network interface to use for this failover router input.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String

        # A list of exactly two protocol configurations for the failover input sources. Both must use the same
        # protocol type.
        @[JSON::Field(key: "protocolConfigurations")]
        getter protocol_configurations : Array(Types::FailoverRouterInputProtocolConfiguration)

        # The mode for determining source priority in failover configurations.
        @[JSON::Field(key: "sourcePriorityMode")]
        getter source_priority_mode : String

        # The index (0 or 1) that specifies which source in the protocol configurations list is currently
        # active. Used to control which of the two failover sources is currently selected. This field is
        # ignored when sourcePriorityMode is set to NO_PRIORITY
        @[JSON::Field(key: "primarySourceIndex")]
        getter primary_source_index : Int32?

        def initialize(
          @network_interface_arn : String,
          @protocol_configurations : Array(Types::FailoverRouterInputProtocolConfiguration),
          @source_priority_mode : String,
          @primary_source_index : Int32? = nil
        )
        end
      end

      # Configuration details for an indexed stream in a failover router input setup.
      struct FailoverRouterInputIndexedStreamDetails
        include JSON::Serializable

        # The index number (0 or 1) assigned to this source in the failover configuration.
        @[JSON::Field(key: "sourceIndex")]
        getter source_index : Int32

        # The IP address of the source for this indexed stream.
        @[JSON::Field(key: "sourceIpAddress")]
        getter source_ip_address : String?

        def initialize(
          @source_index : Int32,
          @source_ip_address : String? = nil
        )
        end
      end

      # Protocol configuration settings for failover router inputs.
      struct FailoverRouterInputProtocolConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "rist")]
        getter rist : Types::RistRouterInputConfiguration?

        @[JSON::Field(key: "rtp")]
        getter rtp : Types::RtpRouterInputConfiguration?

        @[JSON::Field(key: "srtCaller")]
        getter srt_caller : Types::SrtCallerRouterInputConfiguration?

        @[JSON::Field(key: "srtListener")]
        getter srt_listener : Types::SrtListenerRouterInputConfiguration?

        def initialize(
          @rist : Types::RistRouterInputConfiguration? = nil,
          @rtp : Types::RtpRouterInputConfiguration? = nil,
          @srt_caller : Types::SrtCallerRouterInputConfiguration? = nil,
          @srt_listener : Types::SrtListenerRouterInputConfiguration? = nil
        )
        end
      end

      # Configuration details for a failover router input that can automatically switch between two sources.
      struct FailoverRouterInputStreamDetails
        include JSON::Serializable

        # Configuration details for the secondary source (index 1) in the failover setup.
        @[JSON::Field(key: "sourceIndexOneStreamDetails")]
        getter source_index_one_stream_details : Types::FailoverRouterInputIndexedStreamDetails

        # Configuration details for the primary source (index 0) in the failover setup.
        @[JSON::Field(key: "sourceIndexZeroStreamDetails")]
        getter source_index_zero_stream_details : Types::FailoverRouterInputIndexedStreamDetails

        def initialize(
          @source_index_one_stream_details : Types::FailoverRouterInputIndexedStreamDetails,
          @source_index_zero_stream_details : Types::FailoverRouterInputIndexedStreamDetails
        )
        end
      end

      # The settings for a flow, including its source, outputs, and entitlements.
      struct Flow
        include JSON::Serializable

        # The Availability Zone that you want to create the flow in. These options are limited to the
        # Availability Zones within the current Amazon Web Services Region.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The entitlements in this flow.
        @[JSON::Field(key: "entitlements")]
        getter entitlements : Array(Types::Entitlement)

        # The Amazon Resource Name (ARN) of the flow.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # The name of the flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The outputs in this flow.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # The source for the flow.
        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # The current status of the flow.
        @[JSON::Field(key: "status")]
        getter status : String

        # A description of the flow. This value is not used or seen outside of the current MediaConnect
        # account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The IP address from which video will be sent to output destinations.
        @[JSON::Field(key: "egressIp")]
        getter egress_ip : String?

        # Determines the processing capacity and feature set of the flow. Set this optional parameter to LARGE
        # if you want to enable NDI outputs on the flow.
        @[JSON::Field(key: "flowSize")]
        getter flow_size : String?

        # The maintenance settings for the flow.
        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::Maintenance?

        # The media streams that are associated with the flow. After you associate a media stream with a
        # source, you can also associate it with outputs on the flow.
        @[JSON::Field(key: "mediaStreams")]
        getter media_streams : Array(Types::MediaStream)?

        # Specifies the configuration settings for NDI outputs. Required when the flow includes NDI outputs.
        @[JSON::Field(key: "ndiConfig")]
        getter ndi_config : Types::NdiConfig?

        # The settings for the source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::FailoverConfig?

        # The settings for source monitoring.
        @[JSON::Field(key: "sourceMonitoringConfig")]
        getter source_monitoring_config : Types::MonitoringConfig?

        # The settings for the sources that are assigned to the flow.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::Source)?

        # The VPC Interfaces for this flow.
        @[JSON::Field(key: "vpcInterfaces")]
        getter vpc_interfaces : Array(Types::VpcInterface)?

        def initialize(
          @availability_zone : String,
          @entitlements : Array(Types::Entitlement),
          @flow_arn : String,
          @name : String,
          @outputs : Array(Types::Output),
          @source : Types::Source,
          @status : String,
          @description : String? = nil,
          @egress_ip : String? = nil,
          @flow_size : String? = nil,
          @maintenance : Types::Maintenance? = nil,
          @media_streams : Array(Types::MediaStream)? = nil,
          @ndi_config : Types::NdiConfig? = nil,
          @source_failover_config : Types::FailoverConfig? = nil,
          @source_monitoring_config : Types::MonitoringConfig? = nil,
          @sources : Array(Types::Source)? = nil,
          @vpc_interfaces : Array(Types::VpcInterface)? = nil
        )
        end
      end

      # The configuration that defines how content is encrypted during transit between the MediaConnect
      # router and a MediaConnect flow.
      struct FlowTransitEncryption
        include JSON::Serializable

        # The configuration details for the encryption key.
        @[JSON::Field(key: "encryptionKeyConfiguration")]
        getter encryption_key_configuration : Types::FlowTransitEncryptionKeyConfiguration

        # The type of encryption key to use for flow transit encryption.
        @[JSON::Field(key: "encryptionKeyType")]
        getter encryption_key_type : String?

        def initialize(
          @encryption_key_configuration : Types::FlowTransitEncryptionKeyConfiguration,
          @encryption_key_type : String? = nil
        )
        end
      end

      # Configuration settings for flow transit encryption keys.
      struct FlowTransitEncryptionKeyConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "automatic")]
        getter automatic : Types::AutomaticEncryptionKeyConfiguration?

        @[JSON::Field(key: "secretsManager")]
        getter secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration?

        def initialize(
          @automatic : Types::AutomaticEncryptionKeyConfiguration? = nil,
          @secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration? = nil
        )
        end
      end

      # A set of parameters that define the media stream.
      struct Fmtp
        include JSON::Serializable

        # The format of the audio channel.
        @[JSON::Field(key: "channelOrder")]
        getter channel_order : String?

        # The format used for the representation of color.
        @[JSON::Field(key: "colorimetry")]
        getter colorimetry : String?

        # The frame rate for the video stream, in frames/second. For example: 60000/1001.
        @[JSON::Field(key: "exactFramerate")]
        getter exact_framerate : String?

        # The pixel aspect ratio (PAR) of the video.
        @[JSON::Field(key: "par")]
        getter par : String?

        # The encoding range of the video.
        @[JSON::Field(key: "range")]
        getter range : String?

        # The type of compression that was used to smooth the video’s appearance.
        @[JSON::Field(key: "scanMode")]
        getter scan_mode : String?

        # The transfer characteristic system (TCS) that is used in the video.
        @[JSON::Field(key: "tcs")]
        getter tcs : String?

        def initialize(
          @channel_order : String? = nil,
          @colorimetry : String? = nil,
          @exact_framerate : String? = nil,
          @par : String? = nil,
          @range : String? = nil,
          @scan_mode : String? = nil,
          @tcs : String? = nil
        )
        end
      end

      # The settings that you want to use to define the media stream.
      struct FmtpRequest
        include JSON::Serializable

        # The format of the audio channel.
        @[JSON::Field(key: "channelOrder")]
        getter channel_order : String?

        # The format that is used for the representation of color.
        @[JSON::Field(key: "colorimetry")]
        getter colorimetry : String?

        # The frame rate for the video stream, in frames/second. For example: 60000/1001. If you specify a
        # whole number, MediaConnect uses a ratio of N/1. For example, if you specify 60, MediaConnect uses
        # 60/1 as the exactFramerate .
        @[JSON::Field(key: "exactFramerate")]
        getter exact_framerate : String?

        # The pixel aspect ratio (PAR) of the video.
        @[JSON::Field(key: "par")]
        getter par : String?

        # The encoding range of the video.
        @[JSON::Field(key: "range")]
        getter range : String?

        # The type of compression that was used to smooth the video’s appearance.
        @[JSON::Field(key: "scanMode")]
        getter scan_mode : String?

        # The transfer characteristic system (TCS) that is used in the video.
        @[JSON::Field(key: "tcs")]
        getter tcs : String?

        def initialize(
          @channel_order : String? = nil,
          @colorimetry : String? = nil,
          @exact_framerate : String? = nil,
          @par : String? = nil,
          @range : String? = nil,
          @scan_mode : String? = nil,
          @tcs : String? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.
      struct ForbiddenException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The frame resolution used by the video stream.
      struct FrameResolution
        include JSON::Serializable

        # The number of pixels in the height of the video frame.
        @[JSON::Field(key: "frameHeight")]
        getter frame_height : Int32

        # The number of pixels in the width of the video frame.
        @[JSON::Field(key: "frameWidth")]
        getter frame_width : Int32

        def initialize(
          @frame_height : Int32,
          @frame_width : Int32
        )
        end
      end

      # Configures settings for the FrozenFrames metric.
      struct FrozenFrames
        include JSON::Serializable

        # Indicates whether the FrozenFrames metric is enabled or disabled.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Specifies the number of consecutive seconds of a static image that triggers an event or alert.
        @[JSON::Field(key: "thresholdSeconds")]
        getter threshold_seconds : Int32?

        def initialize(
          @state : String? = nil,
          @threshold_seconds : Int32? = nil
        )
        end
      end

      # The settings for a gateway, including its networks.
      struct Gateway
        include JSON::Serializable

        # The range of IP addresses that contribute content or initiate output requests for flows
        # communicating with this gateway. These IP addresses should be in the form of a Classless
        # Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
        @[JSON::Field(key: "egressCidrBlocks")]
        getter egress_cidr_blocks : Array(String)

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The name of the gateway. This name can not be modified after the gateway is created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The list of networks in the gateway.
        @[JSON::Field(key: "networks")]
        getter networks : Array(Types::GatewayNetwork)

        # Messages with information about the gateway.
        @[JSON::Field(key: "gatewayMessages")]
        getter gateway_messages : Array(Types::MessageDetail)?

        # The current status of the gateway.
        @[JSON::Field(key: "gatewayState")]
        getter gateway_state : String?

        def initialize(
          @egress_cidr_blocks : Array(String),
          @gateway_arn : String,
          @name : String,
          @networks : Array(Types::GatewayNetwork),
          @gateway_messages : Array(Types::MessageDetail)? = nil,
          @gateway_state : String? = nil
        )
        end
      end

      # The source configuration for cloud flows receiving a stream from a bridge.
      struct GatewayBridgeSource
        include JSON::Serializable

        # The ARN of the bridge feeding this flow.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String

        # The name of the VPC interface attachment to use for this bridge source.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @bridge_arn : String,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # The settings for an instance in a gateway.
      struct GatewayInstance
        include JSON::Serializable

        # The availability of the instance to host new bridges. The bridgePlacement property can be LOCKED or
        # AVAILABLE. If it is LOCKED, no new bridges can be deployed to this instance. If it is AVAILABLE, new
        # bridges can be deployed to this instance.
        @[JSON::Field(key: "bridgePlacement")]
        getter bridge_placement : String

        # The connection state of the instance.
        @[JSON::Field(key: "connectionStatus")]
        getter connection_status : String

        # The Amazon Resource Name (ARN) of the instance.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The ARN of the gateway.
        @[JSON::Field(key: "gatewayInstanceArn")]
        getter gateway_instance_arn : String

        # The instance ID generated by the SSM install. This will begin with "mi-".
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The status of the instance.
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String

        # The running bridge count.
        @[JSON::Field(key: "runningBridgeCount")]
        getter running_bridge_count : Int32

        # Messages with information about the gateway.
        @[JSON::Field(key: "instanceMessages")]
        getter instance_messages : Array(Types::MessageDetail)?

        def initialize(
          @bridge_placement : String,
          @connection_status : String,
          @gateway_arn : String,
          @gateway_instance_arn : String,
          @instance_id : String,
          @instance_state : String,
          @running_bridge_count : Int32,
          @instance_messages : Array(Types::MessageDetail)? = nil
        )
        end
      end

      # The network settings for a gateway.
      struct GatewayNetwork
        include JSON::Serializable

        # A unique IP address range to use for this network. These IP addresses should be in the form of a
        # Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
        @[JSON::Field(key: "cidrBlock")]
        getter cidr_block : String

        # The name of the network. This name is used to reference the network and must be unique among
        # networks in this gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @cidr_block : String,
          @name : String
        )
        end
      end

      struct GetRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input to retrieve information about.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRouterInputResponse
        include JSON::Serializable

        # The details of the requested router input, including its configuration, state, and other attributes.
        @[JSON::Field(key: "routerInput")]
        getter router_input : Types::RouterInput

        def initialize(
          @router_input : Types::RouterInput
        )
        end
      end

      struct GetRouterInputSourceMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input to retrieve metadata for.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRouterInputSourceMetadataResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # Detailed metadata information about the router input source, including connection state, timestamps,
        # and stream configuration.
        @[JSON::Field(key: "sourceMetadataDetails")]
        getter source_metadata_details : Types::RouterInputSourceMetadataDetails

        def initialize(
          @arn : String,
          @name : String,
          @source_metadata_details : Types::RouterInputSourceMetadataDetails
        )
        end
      end

      struct GetRouterInputThumbnailRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to see a thumbnail of.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRouterInputThumbnailResponse
        include JSON::Serializable

        # The ARN of the router input.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # The details of the thumbnail associated with the router input, including the thumbnail image,
        # timecode, timestamp, and any associated error messages.
        @[JSON::Field(key: "thumbnailDetails")]
        getter thumbnail_details : Types::RouterInputThumbnailDetails

        def initialize(
          @arn : String,
          @name : String,
          @thumbnail_details : Types::RouterInputThumbnailDetails
        )
        end
      end

      struct GetRouterNetworkInterfaceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface that you want to retrieve information
        # about.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRouterNetworkInterfaceResponse
        include JSON::Serializable

        # The details of the requested router network interface, including its configuration and other
        # attributes.
        @[JSON::Field(key: "routerNetworkInterface")]
        getter router_network_interface : Types::RouterNetworkInterface

        def initialize(
          @router_network_interface : Types::RouterNetworkInterface
        )
        end
      end

      struct GetRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to retrieve information about.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRouterOutputResponse
        include JSON::Serializable

        # The details of the requested router output, including its configuration, state, and other
        # attributes.
        @[JSON::Field(key: "routerOutput")]
        getter router_output : Types::RouterOutput

        def initialize(
          @router_output : Types::RouterOutput
        )
        end
      end

      # The entitlements that you want to grant on a flow.
      struct GrantEntitlementRequest
        include JSON::Serializable

        # The Amazon Web Services account IDs that you want to share your content with. The receiving accounts
        # (subscribers) will be allowed to create their own flows using your content as the source.
        @[JSON::Field(key: "subscribers")]
        getter subscribers : Array(String)

        # Percentage from 0-100 of the data transfer cost to be billed to the subscriber.
        @[JSON::Field(key: "dataTransferSubscriberFeePercent")]
        getter data_transfer_subscriber_fee_percent : Int32?

        # A description of the entitlement. This description appears only on the MediaConnect console and will
        # not be seen by the subscriber or end user.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of encryption that will be used on the output that is associated with this entitlement.
        # Allowable encryption types: static-key, speke.
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::Encryption?

        # An indication of whether the new entitlement should be enabled or disabled as soon as it is created.
        # If you don’t specify the entitlementStatus field in your request, MediaConnect sets it to ENABLED.
        @[JSON::Field(key: "entitlementStatus")]
        getter entitlement_status : String?

        # The key-value pairs that can be used to tag and organize the entitlement.
        @[JSON::Field(key: "entitlementTags")]
        getter entitlement_tags : Hash(String, String)?

        # The name of the entitlement. This value must be unique within the current flow.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @subscribers : Array(String),
          @data_transfer_subscriber_fee_percent : Int32? = nil,
          @description : String? = nil,
          @encryption : Types::Encryption? = nil,
          @entitlement_status : String? = nil,
          @entitlement_tags : Hash(String, String)? = nil,
          @name : String? = nil
        )
        end
      end

      # Exception raised by Elemental MediaConnect when granting the entitlement. See the error message for
      # the operation for more information on the cause of this exception.
      struct GrantFlowEntitlements420Exception
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct GrantFlowEntitlementsRequest
        include JSON::Serializable

        # The list of entitlements that you want to grant.
        @[JSON::Field(key: "entitlements")]
        getter entitlements : Array(Types::GrantEntitlementRequest)

        # The Amazon Resource Name (ARN) of the flow that you want to grant entitlements on.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @entitlements : Array(Types::GrantEntitlementRequest),
          @flow_arn : String
        )
        end
      end

      struct GrantFlowEntitlementsResponse
        include JSON::Serializable

        # The entitlements that were just granted.
        @[JSON::Field(key: "entitlements")]
        getter entitlements : Array(Types::Entitlement)?

        # The ARN of the flow that these entitlements were granted to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        def initialize(
          @entitlements : Array(Types::Entitlement)? = nil,
          @flow_arn : String? = nil
        )
        end
      end

      # Create a bridge with the ingress bridge type. An ingress bridge is a ground-to-cloud bridge. The
      # content originates at your premises and is delivered to the cloud.
      struct IngressGatewayBridge
        include JSON::Serializable

        # The maximum expected bitrate (in bps) of the ingress bridge.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32

        # The maximum number of outputs on the ingress bridge.
        @[JSON::Field(key: "maxOutputs")]
        getter max_outputs : Int32

        # The ID of the instance running this bridge.
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        def initialize(
          @max_bitrate : Int32,
          @max_outputs : Int32,
          @instance_id : String? = nil
        )
        end
      end

      # The transport parameters that are associated with an incoming media stream.
      struct InputConfiguration
        include JSON::Serializable

        # The IP address that the flow listens on for incoming content for a media stream.
        @[JSON::Field(key: "inputIp")]
        getter input_ip : String

        # The port that the flow listens on for an incoming media stream.
        @[JSON::Field(key: "inputPort")]
        getter input_port : Int32

        # The VPC interface where the media stream comes in from.
        @[JSON::Field(key: "interface")]
        getter interface : Types::Interface

        def initialize(
          @input_ip : String,
          @input_port : Int32,
          @interface : Types::Interface
        )
        end
      end

      # The transport parameters that you want to associate with an incoming media stream.
      struct InputConfigurationRequest
        include JSON::Serializable

        # The port that you want the flow to listen on for an incoming media stream.
        @[JSON::Field(key: "inputPort")]
        getter input_port : Int32

        # The VPC interface that you want to use for the incoming media stream.
        @[JSON::Field(key: "interface")]
        getter interface : Types::InterfaceRequest

        def initialize(
          @input_port : Int32,
          @interface : Types::InterfaceRequest
        )
        end
      end

      # The VPC interface that is used for the media stream associated with the source or output.
      struct Interface
        include JSON::Serializable

        # The name of the VPC interface.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The VPC interface that you want to designate where the media stream is coming from or going to.
      struct InterfaceRequest
        include JSON::Serializable

        # The name of the VPC interface.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.
      struct InternalServerErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListBridgesRequest
        include JSON::Serializable

        # Filter the list results to display only the bridges associated with the selected ARN.
        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The maximum number of results to return per API request. For example, you submit a ListBridges
        # request with MaxResults set at 5. Although 20 items match your request, the service returns no more
        # than the first 5 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of 10
        # results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListBridges request with MaxResults set at 5. The service returns the first batch of results (up to
        # 5) and a NextToken value. To see the next batch of results, you can submit the ListBridges request a
        # second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBridgesResponse
        include JSON::Serializable

        # A list of bridge summaries.
        @[JSON::Field(key: "bridges")]
        getter bridges : Array(Types::ListedBridge)?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListBridges request with MaxResults set at 5. The service returns the first batch of results (up to
        # 5) and a NextToken value. To see the next batch of results, you can submit the ListBridges request a
        # second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bridges : Array(Types::ListedBridge)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntitlementsRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListEntitlements
        # request with set at 5. Although 20 items match your request, the service returns no more than the
        # first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch
        # of results.) The service might return fewer results than the MaxResults value. If MaxResults is not
        # included in the request, the service defaults to pagination with a maximum of 20 results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListEntitlements request with MaxResults set at 5. The service returns the first batch of results
        # (up to 5) and a NextToken value. To see the next batch of results, you can submit the
        # ListEntitlements request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntitlementsResponse
        include JSON::Serializable

        # A list of entitlements that have been granted to you from other Amazon Web Services accounts.
        @[JSON::Field(key: "entitlements")]
        getter entitlements : Array(Types::ListedEntitlement)?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListEntitlements request with MaxResults set at 5. The service returns the first batch of results
        # (up to 5) and a NextToken value. To see the next batch of results, you can submit the
        # ListEntitlements request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entitlements : Array(Types::ListedEntitlement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowsRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListFlows request
        # with MaxResults set at 5. Although 20 items match your request, the service returns no more than the
        # first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch
        # of results.) The service might return fewer results than the MaxResults value. If MaxResults is not
        # included in the request, the service defaults to pagination with a maximum of 10 results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListFlows request with MaxResults set at 5. The service returns the first batch of results (up to 5)
        # and a NextToken value. To see the next batch of results, you can submit the ListFlows request a
        # second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowsResponse
        include JSON::Serializable

        # A list of flow summaries.
        @[JSON::Field(key: "flows")]
        getter flows : Array(Types::ListedFlow)?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListFlows request with MaxResults set at 5. The service returns the first batch of results (up to 5)
        # and a NextToken value. To see the next batch of results, you can submit the ListFlows request a
        # second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flows : Array(Types::ListedFlow)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewayInstancesRequest
        include JSON::Serializable

        # Filter the list results to display only the instances associated with the selected Gateway ARN.
        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The maximum number of results to return per API request. For example, you submit a ListInstances
        # request with MaxResults set at 5. Although 20 items match your request, the service returns no more
        # than the first 5 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of 10
        # results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListInstances request with MaxResults set at 5. The service returns the first batch of results (up
        # to 5) and a NextToken value. To see the next batch of results, you can submit the ListInstances
        # request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewayInstancesResponse
        include JSON::Serializable

        # A list of instance summaries.
        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::ListedGatewayInstance)?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListInstances request with MaxResults set at 5. The service returns the first batch of results (up
        # to 5) and a NextToken value. To see the next batch of results, you can submit the ListInstances
        # request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instances : Array(Types::ListedGatewayInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewaysRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListGateways
        # request with MaxResults set at 5. Although 20 items match your request, the service returns no more
        # than the first 5 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of 10
        # results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListGateways request with MaxResults set at 5. The service returns the first batch of results (up to
        # 5) and a NextToken value. To see the next batch of results, you can submit the ListGateways request
        # a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewaysResponse
        include JSON::Serializable

        # A list of gateway summaries.
        @[JSON::Field(key: "gateways")]
        getter gateways : Array(Types::ListedGateway)?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListGateways request with MaxResults set at 5. The service returns the first batch of results (up to
        # 5) and a NextToken value. To see the next batch of results, you can submit the ListGateways request
        # a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateways : Array(Types::ListedGateway)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOfferingsRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListOfferings
        # request with MaxResults set at 5. Although 20 items match your request, the service returns no more
        # than the first 5 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of 10
        # results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListOfferings request with MaxResults set at 5. The service returns the first batch of results (up
        # to 5) and a NextToken value. To see the next batch of results, you can submit the ListOfferings
        # request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOfferingsResponse
        include JSON::Serializable

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListOfferings request with MaxResults set at 5. The service returns the first batch of results (up
        # to 5) and a NextToken value. To see the next batch of results, you can submit the ListOfferings
        # request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of offerings that are available to this account in the current Amazon Web Services Region.
        @[JSON::Field(key: "offerings")]
        getter offerings : Array(Types::Offering)?

        def initialize(
          @next_token : String? = nil,
          @offerings : Array(Types::Offering)? = nil
        )
        end
      end

      struct ListReservationsRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListReservations
        # request with MaxResults set at 5. Although 20 items match your request, the service returns no more
        # than the first 5 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of 10
        # results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListReservations request with MaxResults set at 5. The service returns the first batch of results
        # (up to 5) and a NextToken value. To see the next batch of results, you can submit the ListOfferings
        # request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReservationsResponse
        include JSON::Serializable

        # The token that identifies the batch of results that you want to see. For example, you submit a
        # ListReservations request with MaxResults set at 5. The service returns the first batch of results
        # (up to 5) and a NextToken value. To see the next batch of results, you can submit the
        # ListReservations request a second time and specify the NextToken value.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all reservations that have been purchased by this account in the current Amazon Web
        # Services Region.
        @[JSON::Field(key: "reservations")]
        getter reservations : Array(Types::Reservation)?

        def initialize(
          @next_token : String? = nil,
          @reservations : Array(Types::Reservation)? = nil
        )
        end
      end

      struct ListRouterInputsRequest
        include JSON::Serializable

        # The filters to apply when retrieving the list of router inputs.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RouterInputFilter)?

        # The maximum number of router inputs to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::RouterInputFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRouterInputsResponse
        include JSON::Serializable

        # The summary information for the retrieved router inputs.
        @[JSON::Field(key: "routerInputs")]
        getter router_inputs : Array(Types::ListedRouterInput)

        # The token to use to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @router_inputs : Array(Types::ListedRouterInput),
          @next_token : String? = nil
        )
        end
      end

      struct ListRouterNetworkInterfacesRequest
        include JSON::Serializable

        # The filters to apply when retrieving the list of router network interfaces.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RouterNetworkInterfaceFilter)?

        # The maximum number of router network interfaces to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::RouterNetworkInterfaceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRouterNetworkInterfacesResponse
        include JSON::Serializable

        # The summary information for the retrieved router network interfaces.
        @[JSON::Field(key: "routerNetworkInterfaces")]
        getter router_network_interfaces : Array(Types::ListedRouterNetworkInterface)

        # The token to use to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @router_network_interfaces : Array(Types::ListedRouterNetworkInterface),
          @next_token : String? = nil
        )
        end
      end

      struct ListRouterOutputsRequest
        include JSON::Serializable

        # The filters to apply when retrieving the list of router outputs.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RouterOutputFilter)?

        # The maximum number of router outputs to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::RouterOutputFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRouterOutputsResponse
        include JSON::Serializable

        # The summary information for the retrieved router outputs.
        @[JSON::Field(key: "routerOutputs")]
        getter router_outputs : Array(Types::ListedRouterOutput)

        # The token to use to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @router_outputs : Array(Types::ListedRouterOutput),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForGlobalResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the global resource whose tags you want to list.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForGlobalResourceResponse
        include JSON::Serializable

        # A map of tag keys and values associated with the global resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the MediaConnect resource for which to list the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map from tag keys to values. Tag keys can have a maximum character length of 128 characters, and
        # tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Displays details of the selected bridge.
      struct ListedBridge
        include JSON::Serializable

        # The ARN of the bridge.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String

        # The state of the bridge.
        @[JSON::Field(key: "bridgeState")]
        getter bridge_state : String

        # The type of the bridge.
        @[JSON::Field(key: "bridgeType")]
        getter bridge_type : String

        # The name of the bridge.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the gateway associated with the bridge.
        @[JSON::Field(key: "placementArn")]
        getter placement_arn : String

        def initialize(
          @bridge_arn : String,
          @bridge_state : String,
          @bridge_type : String,
          @name : String,
          @placement_arn : String
        )
        end
      end

      # An entitlement that has been granted to you from other Amazon Web Services accounts.
      struct ListedEntitlement
        include JSON::Serializable

        # The ARN of the entitlement.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String

        # The name of the entitlement.
        @[JSON::Field(key: "entitlementName")]
        getter entitlement_name : String

        # Percentage from 0-100 of the data transfer cost to be billed to the subscriber.
        @[JSON::Field(key: "dataTransferSubscriberFeePercent")]
        getter data_transfer_subscriber_fee_percent : Int32?

        def initialize(
          @entitlement_arn : String,
          @entitlement_name : String,
          @data_transfer_subscriber_fee_percent : Int32? = nil
        )
        end
      end

      # A summary of a flow, including its ARN, Availability Zone, and source type.
      struct ListedFlow
        include JSON::Serializable

        # The Availability Zone that the flow was created in.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # A description of the flow.
        @[JSON::Field(key: "description")]
        getter description : String

        # The ARN of the flow.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # The name of the flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of source. This value is either owned (originated somewhere other than an MediaConnect flow
        # owned by another Amazon Web Services account) or entitled (originated at a MediaConnect flow owned
        # by another Amazon Web Services account).
        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The current status of the flow.
        @[JSON::Field(key: "status")]
        getter status : String

        # The maintenance settings for the flow.
        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::Maintenance?

        def initialize(
          @availability_zone : String,
          @description : String,
          @flow_arn : String,
          @name : String,
          @source_type : String,
          @status : String,
          @maintenance : Types::Maintenance? = nil
        )
        end
      end

      # A summary of a gateway, including its name, ARN, and status.
      struct ListedGateway
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The status of the gateway.
        @[JSON::Field(key: "gatewayState")]
        getter gateway_state : String

        # The name of the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @gateway_arn : String,
          @gateway_state : String,
          @name : String
        )
        end
      end

      # A summary of an instance.
      struct ListedGatewayInstance
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the instance.
        @[JSON::Field(key: "gatewayInstanceArn")]
        getter gateway_instance_arn : String

        # The managed instance ID generated by the SSM install. This will begin with "mi-".
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The status of the instance.
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String?

        def initialize(
          @gateway_arn : String,
          @gateway_instance_arn : String,
          @instance_id : String,
          @instance_state : String? = nil
        )
        end
      end

      # A summary of a router input, including its name, type, ARN, ID, state, and other key details. This
      # structure is used in the response of the ListRouterInputs operation.
      struct ListedRouterInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Availability Zone of the router input.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The timestamp when the router input was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router input.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the router input.
        @[JSON::Field(key: "inputType")]
        getter input_type : String

        # The maximum bitrate of the router input.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The number of messages associated with the router input.
        @[JSON::Field(key: "messageCount")]
        getter message_count : Int32

        # The name of the router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Region where the router input is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The number of router outputs that are associated with this router input.
        @[JSON::Field(key: "routedOutputs")]
        getter routed_outputs : Int32

        # Indicates whether the router input is configured for Regional or global routing.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The overall state of the router input.
        @[JSON::Field(key: "state")]
        getter state : String

        # The timestamp when the router input was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The details of the maintenance schedule for the listed router input.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule?

        # The type of maintenance schedule currently associated with the listed router input.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String?

        # The ARN of the network interface associated with the router input.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String?

        def initialize(
          @arn : String,
          @availability_zone : String,
          @created_at : Time,
          @id : String,
          @input_type : String,
          @maximum_bitrate : Int64,
          @message_count : Int32,
          @name : String,
          @region_name : String,
          @routed_outputs : Int32,
          @routing_scope : String,
          @state : String,
          @updated_at : Time,
          @maintenance_schedule : Types::MaintenanceSchedule? = nil,
          @maintenance_schedule_type : String? = nil,
          @network_interface_arn : String? = nil
        )
        end
      end

      # A summary of a router network interface, including its name, type, ARN, ID, associated input/output
      # counts, state, and other key details. This structure is used in the response of the
      # ListRouterNetworkInterfaces operation.
      struct ListedRouterNetworkInterface
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The number of router inputs associated with the network interface.
        @[JSON::Field(key: "associatedInputCount")]
        getter associated_input_count : Int32

        # The number of router outputs associated with the network interface.
        @[JSON::Field(key: "associatedOutputCount")]
        getter associated_output_count : Int32

        # The timestamp when the network interface was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router network interface.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the router network interface.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the router network interface.
        @[JSON::Field(key: "networkInterfaceType")]
        getter network_interface_type : String

        # The AWS Region where the router network interface is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The current state of the router network interface.
        @[JSON::Field(key: "state")]
        getter state : String

        # The timestamp when the router network interface was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @associated_input_count : Int32,
          @associated_output_count : Int32,
          @created_at : Time,
          @id : String,
          @name : String,
          @network_interface_type : String,
          @region_name : String,
          @state : String,
          @updated_at : Time
        )
        end
      end

      # A summary of a router output, including its name, type, ARN, ID, state, routed state, and other key
      # details. This structure is used in the response of the ListRouterOutputs operation.
      struct ListedRouterOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Availability Zone of the router output.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The timestamp when the router output was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router output.
        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum bitrate of the router output.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The number of messages associated with the router output.
        @[JSON::Field(key: "messageCount")]
        getter message_count : Int32

        # The name of the router output.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the router output.
        @[JSON::Field(key: "outputType")]
        getter output_type : String

        # The AWS Region where the router output is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The current state of the association between the router output and its input.
        @[JSON::Field(key: "routedState")]
        getter routed_state : String

        # Indicates whether the router output is configured for Regional or global routing.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The overall state of the router output.
        @[JSON::Field(key: "state")]
        getter state : String

        # The timestamp when the router output was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The details of the maintenance schedule for the listed router output.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule?

        # The type of maintenance schedule currently associated with the listed router output.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String?

        # The ARN of the network interface associated with the router output.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String?

        # The ARN of the router input associated with the output.
        @[JSON::Field(key: "routedInputArn")]
        getter routed_input_arn : String?

        def initialize(
          @arn : String,
          @availability_zone : String,
          @created_at : Time,
          @id : String,
          @maximum_bitrate : Int64,
          @message_count : Int32,
          @name : String,
          @output_type : String,
          @region_name : String,
          @routed_state : String,
          @routing_scope : String,
          @state : String,
          @updated_at : Time,
          @maintenance_schedule : Types::MaintenanceSchedule? = nil,
          @maintenance_schedule_type : String? = nil,
          @network_interface_arn : String? = nil,
          @routed_input_arn : String? = nil
        )
        end
      end

      # The maintenance setting of a flow.
      struct Maintenance
        include JSON::Serializable

        # A day of a week when the maintenance will happen. Use
        # Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday.
        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String?

        # The Maintenance has to be performed before this deadline in ISO UTC format. Example:
        # 2021-01-30T08:30:00Z.
        @[JSON::Field(key: "maintenanceDeadline")]
        getter maintenance_deadline : String?

        # A scheduled date in ISO UTC format when the maintenance will happen. Use YYYY-MM-DD format. Example:
        # 2021-01-30.
        @[JSON::Field(key: "maintenanceScheduledDate")]
        getter maintenance_scheduled_date : String?

        # UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes must be 00. Example:
        # 13:00. The default value is 02:00.
        @[JSON::Field(key: "maintenanceStartHour")]
        getter maintenance_start_hour : String?

        def initialize(
          @maintenance_day : String? = nil,
          @maintenance_deadline : String? = nil,
          @maintenance_scheduled_date : String? = nil,
          @maintenance_start_hour : String? = nil
        )
        end
      end

      # The configuration settings for maintenance operations, including preferred maintenance windows and
      # schedules.
      struct MaintenanceConfiguration
        include JSON::Serializable

        # Default maintenance configuration settings.
        @[JSON::Field(key: "default")]
        getter default : Types::DefaultMaintenanceConfiguration?

        # Preferred day and time maintenance configuration settings.
        @[JSON::Field(key: "preferredDayTime")]
        getter preferred_day_time : Types::PreferredDayTimeMaintenanceConfiguration?

        def initialize(
          @default : Types::DefaultMaintenanceConfiguration? = nil,
          @preferred_day_time : Types::PreferredDayTimeMaintenanceConfiguration? = nil
        )
        end
      end

      # The details of the maintenance schedule.
      struct MaintenanceSchedule
        include JSON::Serializable

        @[JSON::Field(key: "window")]
        getter window : Types::WindowMaintenanceSchedule?

        def initialize(
          @window : Types::WindowMaintenanceSchedule? = nil
        )
        end
      end

      # Configuration settings for connecting a router input to a flow output.
      struct MediaConnectFlowRouterInputConfiguration
        include JSON::Serializable

        # The decryption configuration for the flow source when connected to this router input.
        @[JSON::Field(key: "sourceTransitDecryption")]
        getter source_transit_decryption : Types::FlowTransitEncryption

        # The ARN of the flow to connect to.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN of the flow output to connect to this router input.
        @[JSON::Field(key: "flowOutputArn")]
        getter flow_output_arn : String?

        def initialize(
          @source_transit_decryption : Types::FlowTransitEncryption,
          @flow_arn : String? = nil,
          @flow_output_arn : String? = nil
        )
        end
      end

      # Configuration details for a MediaConnect flow when used as a router input source.
      struct MediaConnectFlowRouterInputStreamDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration settings for connecting a router output to a MediaConnect flow source.
      struct MediaConnectFlowRouterOutputConfiguration
        include JSON::Serializable

        # The encryption configuration for the flow destination when connected to this router output.
        @[JSON::Field(key: "destinationTransitEncryption")]
        getter destination_transit_encryption : Types::FlowTransitEncryption

        # The ARN of the flow to connect to this router output.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN of the flow source to connect to this router output.
        @[JSON::Field(key: "flowSourceArn")]
        getter flow_source_arn : String?

        def initialize(
          @destination_transit_encryption : Types::FlowTransitEncryption,
          @flow_arn : String? = nil,
          @flow_source_arn : String? = nil
        )
        end
      end

      # Configuration details for a MediaConnect flow when used as a router output destination.
      struct MediaConnectFlowRouterOutputStreamDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration settings for connecting a router output to a MediaLive input.
      struct MediaLiveInputRouterOutputConfiguration
        include JSON::Serializable

        # The encryption configuration for the MediaLive input when connected to this router output.
        @[JSON::Field(key: "destinationTransitEncryption")]
        getter destination_transit_encryption : Types::MediaLiveTransitEncryption

        # The ARN of the MediaLive input to connect to this router output.
        @[JSON::Field(key: "mediaLiveInputArn")]
        getter media_live_input_arn : String?

        # The index of the MediaLive pipeline to connect to this router output.
        @[JSON::Field(key: "mediaLivePipelineId")]
        getter media_live_pipeline_id : String?

        def initialize(
          @destination_transit_encryption : Types::MediaLiveTransitEncryption,
          @media_live_input_arn : String? = nil,
          @media_live_pipeline_id : String? = nil
        )
        end
      end

      # Configuration details for a MediaLive input when used as a router output destination.
      struct MediaLiveInputRouterOutputStreamDetails
        include JSON::Serializable

        def initialize
        end
      end

      # The encryption configuration that defines how content is encrypted during transit between
      # MediaConnect Router and MediaLive. This configuration determines whether encryption keys are
      # automatically managed by the service or manually managed through AWS Secrets Manager.
      struct MediaLiveTransitEncryption
        include JSON::Serializable

        # The configuration details for the MediaLive encryption key.
        @[JSON::Field(key: "encryptionKeyConfiguration")]
        getter encryption_key_configuration : Types::MediaLiveTransitEncryptionKeyConfiguration

        # The type of encryption key to use for MediaLive transit encryption.
        @[JSON::Field(key: "encryptionKeyType")]
        getter encryption_key_type : String?

        def initialize(
          @encryption_key_configuration : Types::MediaLiveTransitEncryptionKeyConfiguration,
          @encryption_key_type : String? = nil
        )
        end
      end

      # Configuration settings for the MediaLive transit encryption key.
      struct MediaLiveTransitEncryptionKeyConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "automatic")]
        getter automatic : Types::AutomaticEncryptionKeyConfiguration?

        @[JSON::Field(key: "secretsManager")]
        getter secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration?

        def initialize(
          @automatic : Types::AutomaticEncryptionKeyConfiguration? = nil,
          @secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration? = nil
        )
        end
      end

      # A media stream represents one component of your content, such as video, audio, or ancillary data.
      # After you add a media stream to your flow, you can associate it with sources and outputs that use
      # the ST 2110 JPEG XS or CDI protocol.
      struct MediaStream
        include JSON::Serializable

        # The format type number (sometimes referred to as RTP payload type) of the media stream. MediaConnect
        # assigns this value to the media stream. For ST 2110 JPEG XS outputs, you need to provide this value
        # to the receiver.
        @[JSON::Field(key: "fmt")]
        getter fmt : Int32

        # A unique identifier for the media stream.
        @[JSON::Field(key: "mediaStreamId")]
        getter media_stream_id : Int32

        # A name that helps you distinguish one media stream from another.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The type of media stream.
        @[JSON::Field(key: "mediaStreamType")]
        getter media_stream_type : String

        # Attributes that are related to the media stream.
        @[JSON::Field(key: "attributes")]
        getter attributes : Types::MediaStreamAttributes?

        # The sample rate for the stream. This value is measured in Hz.
        @[JSON::Field(key: "clockRate")]
        getter clock_rate : Int32?

        # A description that can help you quickly identify what your media stream is used for.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The resolution of the video.
        @[JSON::Field(key: "videoFormat")]
        getter video_format : String?

        def initialize(
          @fmt : Int32,
          @media_stream_id : Int32,
          @media_stream_name : String,
          @media_stream_type : String,
          @attributes : Types::MediaStreamAttributes? = nil,
          @clock_rate : Int32? = nil,
          @description : String? = nil,
          @video_format : String? = nil
        )
        end
      end

      # Attributes that are related to the media stream.
      struct MediaStreamAttributes
        include JSON::Serializable

        # The settings that you want to use to define the media stream.
        @[JSON::Field(key: "fmtp")]
        getter fmtp : Types::Fmtp

        # The audio language, in a format that is recognized by the receiver.
        @[JSON::Field(key: "lang")]
        getter lang : String?

        def initialize(
          @fmtp : Types::Fmtp,
          @lang : String? = nil
        )
        end
      end

      # Attributes that are related to the media stream.
      struct MediaStreamAttributesRequest
        include JSON::Serializable

        # The settings that you want to use to define the media stream.
        @[JSON::Field(key: "fmtp")]
        getter fmtp : Types::FmtpRequest?

        # The audio language, in a format that is recognized by the receiver.
        @[JSON::Field(key: "lang")]
        getter lang : String?

        def initialize(
          @fmtp : Types::FmtpRequest? = nil,
          @lang : String? = nil
        )
        end
      end

      # The media stream that is associated with the output, and the parameters for that association.
      struct MediaStreamOutputConfiguration
        include JSON::Serializable

        # The format that was used to encode the data. For ancillary data streams, set the encoding name to
        # smpte291. For audio streams, set the encoding name to pcm. For video, 2110 streams, set the encoding
        # name to raw. For video, JPEG XS streams, set the encoding name to jxsv.
        @[JSON::Field(key: "encodingName")]
        getter encoding_name : String

        # The name of the media stream.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The transport parameters that are associated with each outbound media stream.
        @[JSON::Field(key: "destinationConfigurations")]
        getter destination_configurations : Array(Types::DestinationConfiguration)?

        # A collection of parameters that determine how MediaConnect will convert the content. These fields
        # only apply to outputs on flows that have a CDI source.
        @[JSON::Field(key: "encodingParameters")]
        getter encoding_parameters : Types::EncodingParameters?

        def initialize(
          @encoding_name : String,
          @media_stream_name : String,
          @destination_configurations : Array(Types::DestinationConfiguration)? = nil,
          @encoding_parameters : Types::EncodingParameters? = nil
        )
        end
      end

      # The media stream that you want to associate with the output, and the parameters for that
      # association.
      struct MediaStreamOutputConfigurationRequest
        include JSON::Serializable

        # The format that will be used to encode the data. For ancillary data streams, set the encoding name
        # to smpte291. For audio streams, set the encoding name to pcm. For video, 2110 streams, set the
        # encoding name to raw. For video, JPEG XS streams, set the encoding name to jxsv.
        @[JSON::Field(key: "encodingName")]
        getter encoding_name : String

        # The name of the media stream that is associated with the output.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The media streams that you want to associate with the output.
        @[JSON::Field(key: "destinationConfigurations")]
        getter destination_configurations : Array(Types::DestinationConfigurationRequest)?

        # A collection of parameters that determine how MediaConnect will convert the content. These fields
        # only apply to outputs on flows that have a CDI source.
        @[JSON::Field(key: "encodingParameters")]
        getter encoding_parameters : Types::EncodingParametersRequest?

        def initialize(
          @encoding_name : String,
          @media_stream_name : String,
          @destination_configurations : Array(Types::DestinationConfigurationRequest)? = nil,
          @encoding_parameters : Types::EncodingParametersRequest? = nil
        )
        end
      end

      # The media stream that is associated with the source, and the parameters for that association.
      struct MediaStreamSourceConfiguration
        include JSON::Serializable

        # The format that was used to encode the data. For ancillary data streams, set the encoding name to
        # smpte291. For audio streams, set the encoding name to pcm. For video, 2110 streams, set the encoding
        # name to raw. For video, JPEG XS streams, set the encoding name to jxsv.
        @[JSON::Field(key: "encodingName")]
        getter encoding_name : String

        # A name that helps you distinguish one media stream from another.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The media streams that you want to associate with the source.
        @[JSON::Field(key: "inputConfigurations")]
        getter input_configurations : Array(Types::InputConfiguration)?

        def initialize(
          @encoding_name : String,
          @media_stream_name : String,
          @input_configurations : Array(Types::InputConfiguration)? = nil
        )
        end
      end

      # The media stream that you want to associate with the source, and the parameters for that
      # association.
      struct MediaStreamSourceConfigurationRequest
        include JSON::Serializable

        # The format that was used to encode the data. For ancillary data streams, set the encoding name to
        # smpte291. For audio streams, set the encoding name to pcm. For video, 2110 streams, set the encoding
        # name to raw. For video, JPEG XS streams, set the encoding name to jxsv.
        @[JSON::Field(key: "encodingName")]
        getter encoding_name : String

        # The name of the media stream.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String

        # The media streams that you want to associate with the source.
        @[JSON::Field(key: "inputConfigurations")]
        getter input_configurations : Array(Types::InputConfigurationRequest)?

        def initialize(
          @encoding_name : String,
          @media_stream_name : String,
          @input_configurations : Array(Types::InputConfigurationRequest)? = nil
        )
        end
      end

      # Configuration settings for a merge router input that combines two input sources.
      struct MergeRouterInputConfiguration
        include JSON::Serializable

        # The time window in milliseconds for merging the two input sources.
        @[JSON::Field(key: "mergeRecoveryWindowMilliseconds")]
        getter merge_recovery_window_milliseconds : Int64

        # The ARN of the network interface to use for this merge router input.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String

        # A list of exactly two protocol configurations for the merge input sources. Both must use the same
        # protocol type.
        @[JSON::Field(key: "protocolConfigurations")]
        getter protocol_configurations : Array(Types::MergeRouterInputProtocolConfiguration)

        def initialize(
          @merge_recovery_window_milliseconds : Int64,
          @network_interface_arn : String,
          @protocol_configurations : Array(Types::MergeRouterInputProtocolConfiguration)
        )
        end
      end

      # Configuration details for an indexed stream in a merge router input setup.
      struct MergeRouterInputIndexedStreamDetails
        include JSON::Serializable

        # The index number (0 or 1) assigned to this source in the merge configuration.
        @[JSON::Field(key: "sourceIndex")]
        getter source_index : Int32

        # The IP address of the source for this indexed stream in the merge setup.
        @[JSON::Field(key: "sourceIpAddress")]
        getter source_ip_address : String?

        def initialize(
          @source_index : Int32,
          @source_ip_address : String? = nil
        )
        end
      end

      # Protocol configuration settings for merge router inputs.
      struct MergeRouterInputProtocolConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "rist")]
        getter rist : Types::RistRouterInputConfiguration?

        @[JSON::Field(key: "rtp")]
        getter rtp : Types::RtpRouterInputConfiguration?

        def initialize(
          @rist : Types::RistRouterInputConfiguration? = nil,
          @rtp : Types::RtpRouterInputConfiguration? = nil
        )
        end
      end

      # Configuration details for a merge router input that combines two input sources.
      struct MergeRouterInputStreamDetails
        include JSON::Serializable

        # Configuration details for the second source (index 1) in the merge setup.
        @[JSON::Field(key: "sourceIndexOneStreamDetails")]
        getter source_index_one_stream_details : Types::MergeRouterInputIndexedStreamDetails

        # Configuration details for the first source (index 0) in the merge setup.
        @[JSON::Field(key: "sourceIndexZeroStreamDetails")]
        getter source_index_zero_stream_details : Types::MergeRouterInputIndexedStreamDetails

        def initialize(
          @source_index_one_stream_details : Types::MergeRouterInputIndexedStreamDetails,
          @source_index_zero_stream_details : Types::MergeRouterInputIndexedStreamDetails
        )
        end
      end

      # The details of an error message.
      struct MessageDetail
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The specific error message that MediaConnect returns to help you understand the reason that the
        # request did not succeed.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @code : String,
          @message : String,
          @resource_name : String? = nil
        )
        end
      end

      # Messages that provide the state of the flow.
      struct Messages
        include JSON::Serializable

        # A list of errors that might have been generated from processes on this flow.
        @[JSON::Field(key: "errors")]
        getter errors : Array(String)

        def initialize(
          @errors : Array(String)
        )
        end
      end

      # The settings for source monitoring.
      struct MonitoringConfig
        include JSON::Serializable

        # Contains the settings for audio stream metrics monitoring.
        @[JSON::Field(key: "audioMonitoringSettings")]
        getter audio_monitoring_settings : Array(Types::AudioMonitoringSetting)?

        # Indicates whether content quality analysis is enabled or disabled.
        @[JSON::Field(key: "contentQualityAnalysisState")]
        getter content_quality_analysis_state : String?

        # Indicates whether thumbnails are enabled or disabled.
        @[JSON::Field(key: "thumbnailState")]
        getter thumbnail_state : String?

        # Contains the settings for video stream metrics monitoring.
        @[JSON::Field(key: "videoMonitoringSettings")]
        getter video_monitoring_settings : Array(Types::VideoMonitoringSetting)?

        def initialize(
          @audio_monitoring_settings : Array(Types::AudioMonitoringSetting)? = nil,
          @content_quality_analysis_state : String? = nil,
          @thumbnail_state : String? = nil,
          @video_monitoring_settings : Array(Types::VideoMonitoringSetting)? = nil
        )
        end
      end

      # The settings related to the multicast source.
      struct MulticastSourceSettings
        include JSON::Serializable

        # The IP address of the source for source-specific multicast (SSM).
        @[JSON::Field(key: "multicastSourceIp")]
        getter multicast_source_ip : String?

        def initialize(
          @multicast_source_ip : String? = nil
        )
        end
      end

      # Specifies the configuration settings for NDI outputs. Required when the flow includes NDI outputs.
      struct NdiConfig
        include JSON::Serializable

        # A prefix for the names of the NDI sources that the flow creates. If a custom name isn't specified,
        # MediaConnect generates a unique 12-character ID as the prefix.
        @[JSON::Field(key: "machineName")]
        getter machine_name : String?

        # A list of up to three NDI discovery server configurations. While not required by the API, this
        # configuration is necessary for NDI functionality to work properly.
        @[JSON::Field(key: "ndiDiscoveryServers")]
        getter ndi_discovery_servers : Array(Types::NdiDiscoveryServerConfig)?

        # A setting that controls whether NDI outputs can be used in the flow. Must be ENABLED to add NDI
        # outputs. Default is DISABLED.
        @[JSON::Field(key: "ndiState")]
        getter ndi_state : String?

        def initialize(
          @machine_name : String? = nil,
          @ndi_discovery_servers : Array(Types::NdiDiscoveryServerConfig)? = nil,
          @ndi_state : String? = nil
        )
        end
      end

      # Specifies the configuration settings for individual NDI discovery servers. A maximum of 3 servers is
      # allowed.
      struct NdiDiscoveryServerConfig
        include JSON::Serializable

        # The unique network address of the NDI discovery server.
        @[JSON::Field(key: "discoveryServerAddress")]
        getter discovery_server_address : String

        # The identifier for the Virtual Private Cloud (VPC) network interface used by the flow.
        @[JSON::Field(key: "vpcInterfaceAdapter")]
        getter vpc_interface_adapter : String

        # The port for the NDI discovery server. Defaults to 5959 if a custom port isn't specified.
        @[JSON::Field(key: "discoveryServerPort")]
        getter discovery_server_port : Int32?

        def initialize(
          @discovery_server_address : String,
          @vpc_interface_adapter : String,
          @discovery_server_port : Int32? = nil
        )
        end
      end

      # One or more of the resources in the request does not exist in the system.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A savings plan that reserves a certain amount of outbound bandwidth usage at a discounted rate each
      # month over a period of time.
      struct Offering
        include JSON::Serializable

        # The type of currency that is used for billing. The currencyCode used for all reservations is US
        # dollars.
        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String

        # The length of time that your reservation would be active.
        @[JSON::Field(key: "duration")]
        getter duration : Int32

        # The unit of measurement for the duration of the offering.
        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String

        # The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
        @[JSON::Field(key: "offeringArn")]
        getter offering_arn : String

        # A description of the offering.
        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String

        # The cost of a single unit. This value, in combination with priceUnits, makes up the rate.
        @[JSON::Field(key: "pricePerUnit")]
        getter price_per_unit : String

        # The unit of measurement that is used for billing. This value, in combination with pricePerUnit,
        # makes up the rate.
        @[JSON::Field(key: "priceUnits")]
        getter price_units : String

        # A definition of the amount of outbound bandwidth that you would be reserving if you purchase the
        # offering.
        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ResourceSpecification

        def initialize(
          @currency_code : String,
          @duration : Int32,
          @duration_units : String,
          @offering_arn : String,
          @offering_description : String,
          @price_per_unit : String,
          @price_units : String,
          @resource_specification : Types::ResourceSpecification
        )
        end
      end

      # The settings for an output.
      struct Output
        include JSON::Serializable

        # The name of the output. This value must be unique within the current flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the output.
        @[JSON::Field(key: "outputArn")]
        getter output_arn : String

        # The ARN of the bridge added to this output.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The bridge output ports currently in use.
        @[JSON::Field(key: "bridgePorts")]
        getter bridge_ports : Array(Int32)?

        # The ARN of the router input that's connected to this flow output.
        @[JSON::Field(key: "connectedRouterInputArn")]
        getter connected_router_input_arn : String?

        # Percentage from 0-100 of the data transfer cost to be billed to the subscriber.
        @[JSON::Field(key: "dataTransferSubscriberFeePercent")]
        getter data_transfer_subscriber_fee_percent : Int32?

        # A description of the output.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The address where you want to send the output.
        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The type of key used for the encryption. If no keyType is provided, the service will use the default
        # setting (static-key).
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::Encryption?

        # The ARN of the entitlement on the originator''s flow. This value is relevant only on entitled flows.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        # The IP address that the receiver requires in order to establish a connection with the flow. For
        # public networking, the ListenerAddress is represented by the elastic IP address of the flow. For
        # private networking, the ListenerAddress is represented by the elastic network interface IP address
        # of the VPC. This field applies only to outputs that use the Zixi pull or SRT listener protocol.
        @[JSON::Field(key: "listenerAddress")]
        getter listener_address : String?

        # The input ARN of the MediaLive channel. This parameter is relevant only for outputs that were added
        # by creating a MediaLive input.
        @[JSON::Field(key: "mediaLiveInputArn")]
        getter media_live_input_arn : String?

        # The configuration for each media stream that is associated with the output.
        @[JSON::Field(key: "mediaStreamOutputConfigurations")]
        getter media_stream_output_configurations : Array(Types::MediaStreamOutputConfiguration)?

        # An indication of whether the output is transmitting data or not.
        @[JSON::Field(key: "outputStatus")]
        getter output_status : String?

        # The IP address of the device that is currently receiving content from this output. For outputs that
        # use protocols where you specify the destination (such as SRT Caller or Zixi Push), this value
        # matches the configured destination address. For outputs that use listener protocols (such as SRT
        # Listener), this value shows the address of the connected receiver. Peer IP addresses aren't
        # available for entitlements, managed MediaLive outputs, NDI outputs, and CDI/ST2110 outputs. The peer
        # IP address might not be visible for flows that haven't been started yet, or flows that were started
        # before May 2025. In these cases, restart your flow to see the peer IP address.
        @[JSON::Field(key: "peerIpAddress")]
        getter peer_ip_address : String?

        # The port to use when content is distributed to this output.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if router integration is enabled or disabled on the flow output.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        # The encryption configuration for the output when router integration is enabled.
        @[JSON::Field(key: "routerIntegrationTransitEncryption")]
        getter router_integration_transit_encryption : Types::FlowTransitEncryption?

        # Attributes related to the transport stream that are used in the output.
        @[JSON::Field(key: "transport")]
        getter transport : Types::Transport?

        # The name of the VPC interface attachment to use for this output.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @name : String,
          @output_arn : String,
          @bridge_arn : String? = nil,
          @bridge_ports : Array(Int32)? = nil,
          @connected_router_input_arn : String? = nil,
          @data_transfer_subscriber_fee_percent : Int32? = nil,
          @description : String? = nil,
          @destination : String? = nil,
          @encryption : Types::Encryption? = nil,
          @entitlement_arn : String? = nil,
          @listener_address : String? = nil,
          @media_live_input_arn : String? = nil,
          @media_stream_output_configurations : Array(Types::MediaStreamOutputConfiguration)? = nil,
          @output_status : String? = nil,
          @peer_ip_address : String? = nil,
          @port : Int32? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_encryption : Types::FlowTransitEncryption? = nil,
          @transport : Types::Transport? = nil,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # Configuration for preferred day and time maintenance settings.
      struct PreferredDayTimeMaintenanceConfiguration
        include JSON::Serializable

        # The preferred day for maintenance operations.
        @[JSON::Field(key: "day")]
        getter day : String

        # The preferred time for maintenance operations.
        @[JSON::Field(key: "time")]
        getter time : String

        def initialize(
          @day : String,
          @time : String
        )
        end
      end

      # The configuration settings for a public router network interface, including the list of allowed CIDR
      # blocks.
      struct PublicRouterNetworkInterfaceConfiguration
        include JSON::Serializable

        # The list of allowed CIDR blocks for the public router network interface.
        @[JSON::Field(key: "allowRules")]
        getter allow_rules : Array(Types::PublicRouterNetworkInterfaceRule)

        def initialize(
          @allow_rules : Array(Types::PublicRouterNetworkInterfaceRule)
        )
        end
      end

      # A rule that allows a specific CIDR block to access the public router network interface.
      struct PublicRouterNetworkInterfaceRule
        include JSON::Serializable

        # The CIDR block that is allowed to access the public router network interface.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        def initialize(
          @cidr : String
        )
        end
      end

      struct PurchaseOfferingRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the offering.
        @[JSON::Field(key: "OfferingArn")]
        getter offering_arn : String

        # The name that you want to use for the reservation.
        @[JSON::Field(key: "reservationName")]
        getter reservation_name : String

        # The date and time that you want the reservation to begin, in Coordinated Universal Time (UTC). You
        # can specify any date and time between 12:00am on the first day of the current month to the current
        # time on today's date, inclusive. Specify the start in a 24-hour notation. Use the following format:
        # YYYY-MM-DDTHH:mm:SSZ , where T and Z are literal characters. For example, to specify 11:30pm on
        # March 5, 2020, enter 2020-03-05T23:30:00Z .
        @[JSON::Field(key: "start")]
        getter start : String

        def initialize(
          @offering_arn : String,
          @reservation_name : String,
          @start : String
        )
        end
      end

      struct PurchaseOfferingResponse
        include JSON::Serializable

        # The details of the reservation that you just created when you purchased the offering.
        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      struct RemoveBridgeOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The name of the bridge output that you want to remove.
        @[JSON::Field(key: "OutputName")]
        getter output_name : String

        def initialize(
          @bridge_arn : String,
          @output_name : String
        )
        end
      end

      struct RemoveBridgeOutputResponse
        include JSON::Serializable

        # The ARN of the bridge from which the output was removed.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The name of the bridge output that was removed.
        @[JSON::Field(key: "outputName")]
        getter output_name : String?

        def initialize(
          @bridge_arn : String? = nil,
          @output_name : String? = nil
        )
        end
      end

      struct RemoveBridgeSourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The name of the bridge source that you want to remove.
        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        def initialize(
          @bridge_arn : String,
          @source_name : String
        )
        end
      end

      struct RemoveBridgeSourceResponse
        include JSON::Serializable

        # The ARN of the bridge from which the source was removed.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The name of the bridge source that was removed.
        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        def initialize(
          @bridge_arn : String? = nil,
          @source_name : String? = nil
        )
        end
      end

      struct RemoveFlowMediaStreamRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The name of the media stream that you want to remove.
        @[JSON::Field(key: "MediaStreamName")]
        getter media_stream_name : String

        def initialize(
          @flow_arn : String,
          @media_stream_name : String
        )
        end
      end

      struct RemoveFlowMediaStreamResponse
        include JSON::Serializable

        # The ARN of the flow that was updated.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The name of the media stream that was removed.
        @[JSON::Field(key: "mediaStreamName")]
        getter media_stream_name : String?

        def initialize(
          @flow_arn : String? = nil,
          @media_stream_name : String? = nil
        )
        end
      end

      struct RemoveFlowOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to remove an output from.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The ARN of the output that you want to remove.
        @[JSON::Field(key: "OutputArn")]
        getter output_arn : String

        def initialize(
          @flow_arn : String,
          @output_arn : String
        )
        end
      end

      struct RemoveFlowOutputResponse
        include JSON::Serializable

        # The ARN of the flow that the output was removed from.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN of the output that was removed.
        @[JSON::Field(key: "outputArn")]
        getter output_arn : String?

        def initialize(
          @flow_arn : String? = nil,
          @output_arn : String? = nil
        )
        end
      end

      struct RemoveFlowSourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to remove a source from.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The ARN of the source that you want to remove.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        def initialize(
          @flow_arn : String,
          @source_arn : String
        )
        end
      end

      struct RemoveFlowSourceResponse
        include JSON::Serializable

        # The ARN of the flow that the source was removed from.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN of the source that was removed.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        def initialize(
          @flow_arn : String? = nil,
          @source_arn : String? = nil
        )
        end
      end

      struct RemoveFlowVpcInterfaceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to remove a VPC interface from.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The name of the VPC interface that you want to remove.
        @[JSON::Field(key: "VpcInterfaceName")]
        getter vpc_interface_name : String

        def initialize(
          @flow_arn : String,
          @vpc_interface_name : String
        )
        end
      end

      struct RemoveFlowVpcInterfaceResponse
        include JSON::Serializable

        # The ARN of the flow that is associated with the VPC interface you removed.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # IDs of network interfaces associated with the removed VPC interface that MediaConnect was unable to
        # remove.
        @[JSON::Field(key: "nonDeletedNetworkInterfaceIds")]
        getter non_deleted_network_interface_ids : Array(String)?

        # The name of the VPC interface that was removed.
        @[JSON::Field(key: "vpcInterfaceName")]
        getter vpc_interface_name : String?

        def initialize(
          @flow_arn : String? = nil,
          @non_deleted_network_interface_ids : Array(String)? = nil,
          @vpc_interface_name : String? = nil
        )
        end
      end

      # A pricing agreement for a discounted rate for a specific outbound bandwidth that your MediaConnect
      # account will use each month over a specific time period. The discounted rate in the reservation
      # applies to outbound bandwidth for all flows from your account until your account reaches the amount
      # of bandwidth in your reservation. If you use more outbound bandwidth than the agreed upon amount in
      # a single month, the overage is charged at the on-demand rate.
      struct Reservation
        include JSON::Serializable

        # The type of currency that is used for billing. The currencyCode used for your reservation is US
        # dollars.
        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String

        # The length of time that this reservation is active. MediaConnect defines this value in the offering.
        @[JSON::Field(key: "duration")]
        getter duration : Int32

        # The unit of measurement for the duration of the reservation. MediaConnect defines this value in the
        # offering.
        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String

        # The day and time that this reservation expires. This value is calculated based on the start date and
        # time that you set and the offering's duration.
        @[JSON::Field(key: "end")]
        getter end : String

        # The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
        @[JSON::Field(key: "offeringArn")]
        getter offering_arn : String

        # A description of the offering. MediaConnect defines this value in the offering.
        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String

        # The cost of a single unit. This value, in combination with priceUnits, makes up the rate.
        # MediaConnect defines this value in the offering.
        @[JSON::Field(key: "pricePerUnit")]
        getter price_per_unit : String

        # The unit of measurement that is used for billing. This value, in combination with pricePerUnit,
        # makes up the rate. MediaConnect defines this value in the offering.
        @[JSON::Field(key: "priceUnits")]
        getter price_units : String

        # The Amazon Resource Name (ARN) that MediaConnect assigns to the reservation when you purchase an
        # offering.
        @[JSON::Field(key: "reservationArn")]
        getter reservation_arn : String

        # The name that you assigned to the reservation when you purchased the offering.
        @[JSON::Field(key: "reservationName")]
        getter reservation_name : String

        # The status of your reservation.
        @[JSON::Field(key: "reservationState")]
        getter reservation_state : String

        # A definition of the amount of outbound bandwidth that you would be reserving if you purchase the
        # offering. MediaConnect defines the values that make up the resourceSpecification in the offering.
        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ResourceSpecification

        # The day and time that the reservation becomes active. You set this value when you purchase the
        # offering.
        @[JSON::Field(key: "start")]
        getter start : String

        def initialize(
          @currency_code : String,
          @duration : Int32,
          @duration_units : String,
          @end : String,
          @offering_arn : String,
          @offering_description : String,
          @price_per_unit : String,
          @price_units : String,
          @reservation_arn : String,
          @reservation_name : String,
          @reservation_state : String,
          @resource_specification : Types::ResourceSpecification,
          @start : String
        )
        end
      end

      # A definition of what is being billed for, including the type and amount.
      struct ResourceSpecification
        include JSON::Serializable

        # The type of resource and the unit that is being billed for.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The amount of outbound bandwidth that is discounted in the offering.
        @[JSON::Field(key: "reservedBitrate")]
        getter reserved_bitrate : Int32?

        def initialize(
          @resource_type : String,
          @reserved_bitrate : Int32? = nil
        )
        end
      end

      struct RestartRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to restart.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct RestartRouterInputResponse
        include JSON::Serializable

        # The ARN of the router input that was restarted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router input that was restarted.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router input after the restart operation.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct RestartRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to restart.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct RestartRouterOutputResponse
        include JSON::Serializable

        # The ARN of the router output that was restarted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router output that was restarted.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router output after the restart operation.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct RevokeFlowEntitlementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entitlement that you want to revoke.
        @[JSON::Field(key: "EntitlementArn")]
        getter entitlement_arn : String

        # The flow that you want to revoke an entitlement from.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @entitlement_arn : String,
          @flow_arn : String
        )
        end
      end

      struct RevokeFlowEntitlementResponse
        include JSON::Serializable

        # The ARN of the entitlement that was revoked.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        # The ARN of the flow that the entitlement was revoked from.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        def initialize(
          @entitlement_arn : String? = nil,
          @flow_arn : String? = nil
        )
        end
      end

      # The configuration settings for a router input using the RIST (Reliable Internet Stream Transport)
      # protocol, including the port and recovery latency.
      struct RistRouterInputConfiguration
        include JSON::Serializable

        # The port number used for the RIST protocol in the router input configuration.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The recovery latency in milliseconds for the RIST protocol in the router input configuration.
        @[JSON::Field(key: "recoveryLatencyMilliseconds")]
        getter recovery_latency_milliseconds : Int64

        def initialize(
          @port : Int32,
          @recovery_latency_milliseconds : Int64
        )
        end
      end

      # The configuration settings for a router output using the RIST (Reliable Internet Stream Transport)
      # protocol, including the destination address and port.
      struct RistRouterOutputConfiguration
        include JSON::Serializable

        # The destination IP address for the RIST protocol in the router output configuration.
        @[JSON::Field(key: "destinationAddress")]
        getter destination_address : String

        # The destination port number for the RIST protocol in the router output configuration.
        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32

        def initialize(
          @destination_address : String,
          @destination_port : Int32
        )
        end
      end

      # A router input in AWS Elemental MediaConnect. A router input is a source of media content that can
      # be routed to one or more router outputs.
      struct RouterInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Availability Zone of the router input.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterInputConfiguration

        # The timestamp when the router input was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router input.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the router input.
        @[JSON::Field(key: "inputType")]
        getter input_type : String

        # The maintenance configuration settings applied to this router input.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration

        # The type of maintenance configuration applied to this router input.
        @[JSON::Field(key: "maintenanceType")]
        getter maintenance_type : String

        # The maximum bitrate for the router input.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The messages associated with the router input.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::RouterInputMessage)

        # The name of the router input.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Region where the router input is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The number of router outputs associated with the router input.
        @[JSON::Field(key: "routedOutputs")]
        getter routed_outputs : Int32

        # Indicates whether the router input is configured for Regional or global routing.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The current state of the router input.
        @[JSON::Field(key: "state")]
        getter state : String

        @[JSON::Field(key: "streamDetails")]
        getter stream_details : Types::RouterInputStreamDetails

        # Key-value pairs that can be used to tag and organize this router input.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # The tier level of the router input.
        @[JSON::Field(key: "tier")]
        getter tier : String

        @[JSON::Field(key: "transitEncryption")]
        getter transit_encryption : Types::RouterInputTransitEncryption

        # The timestamp when the router input was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The IP address of the router input.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The current maintenance schedule details for this router input.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule?

        # The type of maintenance schedule currently in effect for this router input.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String?

        # The maximum number of outputs that can be simultaneously routed to this input.
        @[JSON::Field(key: "maximumRoutedOutputs")]
        getter maximum_routed_outputs : Int32?

        def initialize(
          @arn : String,
          @availability_zone : String,
          @configuration : Types::RouterInputConfiguration,
          @created_at : Time,
          @id : String,
          @input_type : String,
          @maintenance_configuration : Types::MaintenanceConfiguration,
          @maintenance_type : String,
          @maximum_bitrate : Int64,
          @messages : Array(Types::RouterInputMessage),
          @name : String,
          @region_name : String,
          @routed_outputs : Int32,
          @routing_scope : String,
          @state : String,
          @stream_details : Types::RouterInputStreamDetails,
          @tags : Hash(String, String),
          @tier : String,
          @transit_encryption : Types::RouterInputTransitEncryption,
          @updated_at : Time,
          @ip_address : String? = nil,
          @maintenance_schedule : Types::MaintenanceSchedule? = nil,
          @maintenance_schedule_type : String? = nil,
          @maximum_routed_outputs : Int32? = nil
        )
        end
      end

      # The configuration settings for a router input.
      struct RouterInputConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "failover")]
        getter failover : Types::FailoverRouterInputConfiguration?

        @[JSON::Field(key: "mediaConnectFlow")]
        getter media_connect_flow : Types::MediaConnectFlowRouterInputConfiguration?

        @[JSON::Field(key: "merge")]
        getter merge : Types::MergeRouterInputConfiguration?

        @[JSON::Field(key: "standard")]
        getter standard : Types::StandardRouterInputConfiguration?

        def initialize(
          @failover : Types::FailoverRouterInputConfiguration? = nil,
          @media_connect_flow : Types::MediaConnectFlowRouterInputConfiguration? = nil,
          @merge : Types::MergeRouterInputConfiguration? = nil,
          @standard : Types::StandardRouterInputConfiguration? = nil
        )
        end
      end

      # A filter that can be used to retrieve a list of router inputs.
      struct RouterInputFilter
        include JSON::Serializable

        # The types of router inputs to include in the filter.
        @[JSON::Field(key: "inputTypes")]
        getter input_types : Array(String)?

        # The names of the router inputs to include in the filter.
        @[JSON::Field(key: "nameContains")]
        getter name_contains : Array(String)?

        # The Amazon Resource Names (ARNs) of the network interfaces associated with the router inputs to
        # include in the filter.
        @[JSON::Field(key: "networkInterfaceArns")]
        getter network_interface_arns : Array(String)?

        # The AWS Regions of the router inputs to include in the filter.
        @[JSON::Field(key: "regionNames")]
        getter region_names : Array(String)?

        # Filter criteria to list router inputs based on their routing scope (REGIONAL or GLOBAL).
        @[JSON::Field(key: "routingScopes")]
        getter routing_scopes : Array(String)?

        def initialize(
          @input_types : Array(String)? = nil,
          @name_contains : Array(String)? = nil,
          @network_interface_arns : Array(String)? = nil,
          @region_names : Array(String)? = nil,
          @routing_scopes : Array(String)? = nil
        )
        end
      end

      # A message associated with a router input, including a code and a message.
      struct RouterInputMessage
        include JSON::Serializable

        # The code associated with the router input message.
        @[JSON::Field(key: "code")]
        getter code : String

        # The message text associated with the router input message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # Metadata information associated with the router input, including stream details and connection
      # state.
      struct RouterInputMetadata
        include JSON::Serializable

        @[JSON::Field(key: "transportStreamMediaInfo")]
        getter transport_stream_media_info : Types::TransportMediaInfo?

        def initialize(
          @transport_stream_media_info : Types::TransportMediaInfo? = nil
        )
        end
      end

      # The protocol configuration settings for a router input.
      struct RouterInputProtocolConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "rist")]
        getter rist : Types::RistRouterInputConfiguration?

        @[JSON::Field(key: "rtp")]
        getter rtp : Types::RtpRouterInputConfiguration?

        @[JSON::Field(key: "srtCaller")]
        getter srt_caller : Types::SrtCallerRouterInputConfiguration?

        @[JSON::Field(key: "srtListener")]
        getter srt_listener : Types::SrtListenerRouterInputConfiguration?

        def initialize(
          @rist : Types::RistRouterInputConfiguration? = nil,
          @rtp : Types::RtpRouterInputConfiguration? = nil,
          @srt_caller : Types::SrtCallerRouterInputConfiguration? = nil,
          @srt_listener : Types::SrtListenerRouterInputConfiguration? = nil
        )
        end
      end

      # The request to create a new router input would exceed the service quotas for the account.
      struct RouterInputServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Detailed metadata information about a router input source.
      struct RouterInputSourceMetadataDetails
        include JSON::Serializable

        # Collection of metadata messages associated with the router input source.
        @[JSON::Field(key: "sourceMetadataMessages")]
        getter source_metadata_messages : Array(Types::RouterInputMessage)

        # The timestamp when the metadata was last updated.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # Metadata information specific to the router input configuration and state.
        @[JSON::Field(key: "routerInputMetadata")]
        getter router_input_metadata : Types::RouterInputMetadata?

        def initialize(
          @source_metadata_messages : Array(Types::RouterInputMessage),
          @timestamp : Time,
          @router_input_metadata : Types::RouterInputMetadata? = nil
        )
        end
      end

      # Configuration details for the router input stream.
      struct RouterInputStreamDetails
        include JSON::Serializable

        @[JSON::Field(key: "failover")]
        getter failover : Types::FailoverRouterInputStreamDetails?

        @[JSON::Field(key: "mediaConnectFlow")]
        getter media_connect_flow : Types::MediaConnectFlowRouterInputStreamDetails?

        @[JSON::Field(key: "merge")]
        getter merge : Types::MergeRouterInputStreamDetails?

        @[JSON::Field(key: "standard")]
        getter standard : Types::StandardRouterInputStreamDetails?

        def initialize(
          @failover : Types::FailoverRouterInputStreamDetails? = nil,
          @media_connect_flow : Types::MediaConnectFlowRouterInputStreamDetails? = nil,
          @merge : Types::MergeRouterInputStreamDetails? = nil,
          @standard : Types::StandardRouterInputStreamDetails? = nil
        )
        end
      end

      # The details of a thumbnail associated with a router input, including the thumbnail messages, the
      # thumbnail image, the timecode, and the timestamp.
      struct RouterInputThumbnailDetails
        include JSON::Serializable

        # The messages associated with the router input thumbnail.
        @[JSON::Field(key: "thumbnailMessages")]
        getter thumbnail_messages : Array(Types::RouterInputMessage)

        # The thumbnail image, encoded as a Base64-encoded binary data object.
        @[JSON::Field(key: "thumbnail")]
        getter thumbnail : Bytes?

        # The timecode associated with the thumbnail.
        @[JSON::Field(key: "timecode")]
        getter timecode : String?

        # The timestamp associated with the thumbnail.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @thumbnail_messages : Array(Types::RouterInputMessage),
          @thumbnail : Bytes? = nil,
          @timecode : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # The transit encryption settings for a router input.
      struct RouterInputTransitEncryption
        include JSON::Serializable

        # Contains the configuration details for the encryption key used in transit encryption, including the
        # key source and associated parameters.
        @[JSON::Field(key: "encryptionKeyConfiguration")]
        getter encryption_key_configuration : Types::RouterInputTransitEncryptionKeyConfiguration

        # Specifies the type of encryption key to use for transit encryption.
        @[JSON::Field(key: "encryptionKeyType")]
        getter encryption_key_type : String?

        def initialize(
          @encryption_key_configuration : Types::RouterInputTransitEncryptionKeyConfiguration,
          @encryption_key_type : String? = nil
        )
        end
      end

      # Defines the configuration settings for transit encryption keys.
      struct RouterInputTransitEncryptionKeyConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "automatic")]
        getter automatic : Types::AutomaticEncryptionKeyConfiguration?

        @[JSON::Field(key: "secretsManager")]
        getter secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration?

        def initialize(
          @automatic : Types::AutomaticEncryptionKeyConfiguration? = nil,
          @secrets_manager : Types::SecretsManagerEncryptionKeyConfiguration? = nil
        )
        end
      end

      # A router network interface in AWS Elemental MediaConnect. A router network interface is a network
      # interface that can be associated with one or more router inputs and outputs.
      struct RouterNetworkInterface
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The number of router inputs associated with the network interface.
        @[JSON::Field(key: "associatedInputCount")]
        getter associated_input_count : Int32

        # The number of router outputs associated with the network interface.
        @[JSON::Field(key: "associatedOutputCount")]
        getter associated_output_count : Int32

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterNetworkInterfaceConfiguration

        # The timestamp when the router network interface was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router network interface.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the router network interface.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the router network interface.
        @[JSON::Field(key: "networkInterfaceType")]
        getter network_interface_type : String

        # The AWS Region where the router network interface is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The current state of the router network interface.
        @[JSON::Field(key: "state")]
        getter state : String

        # Key-value pairs that can be used to tag and organize this router network interface.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # The timestamp when the router network interface was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @associated_input_count : Int32,
          @associated_output_count : Int32,
          @configuration : Types::RouterNetworkInterfaceConfiguration,
          @created_at : Time,
          @id : String,
          @name : String,
          @network_interface_type : String,
          @region_name : String,
          @state : String,
          @tags : Hash(String, String),
          @updated_at : Time
        )
        end
      end

      # The configuration settings for a router network interface.
      struct RouterNetworkInterfaceConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "public")]
        getter public : Types::PublicRouterNetworkInterfaceConfiguration?

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcRouterNetworkInterfaceConfiguration?

        def initialize(
          @public : Types::PublicRouterNetworkInterfaceConfiguration? = nil,
          @vpc : Types::VpcRouterNetworkInterfaceConfiguration? = nil
        )
        end
      end

      # A filter that can be used to retrieve a list of router network interfaces.
      struct RouterNetworkInterfaceFilter
        include JSON::Serializable

        # The names of the router network interfaces to include in the filter.
        @[JSON::Field(key: "nameContains")]
        getter name_contains : Array(String)?

        # The types of router network interfaces to include in the filter.
        @[JSON::Field(key: "networkInterfaceTypes")]
        getter network_interface_types : Array(String)?

        # The AWS Regions of the router network interfaces to include in the filter.
        @[JSON::Field(key: "regionNames")]
        getter region_names : Array(String)?

        def initialize(
          @name_contains : Array(String)? = nil,
          @network_interface_types : Array(String)? = nil,
          @region_names : Array(String)? = nil
        )
        end
      end

      # The request to create a new router network interface would exceed the service quotas (limits) set
      # for the account.
      struct RouterNetworkInterfaceServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A router output in AWS Elemental MediaConnect. A router output is a destination for media content
      # that can receive input from one or more router inputs.
      struct RouterOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Availability Zone of the router output.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterOutputConfiguration

        # The timestamp when the router output was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the router output.
        @[JSON::Field(key: "id")]
        getter id : String

        # The maintenance configuration settings applied to this router output.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration

        # The type of maintenance configuration applied to this router output.
        @[JSON::Field(key: "maintenanceType")]
        getter maintenance_type : String

        # The maximum bitrate for the router output.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64

        # The messages associated with the router output.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::RouterOutputMessage)

        # The name of the router output.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the router output.
        @[JSON::Field(key: "outputType")]
        getter output_type : String

        # The AWS Region where the router output is located.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The current state of the association between the router output and its input.
        @[JSON::Field(key: "routedState")]
        getter routed_state : String

        # Indicates whether the router output is configured for Regional or global routing.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String

        # The overall state of the router output.
        @[JSON::Field(key: "state")]
        getter state : String

        @[JSON::Field(key: "streamDetails")]
        getter stream_details : Types::RouterOutputStreamDetails

        # Key-value pairs that can be used to tag and organize this router output.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # The tier level of the router output.
        @[JSON::Field(key: "tier")]
        getter tier : String

        # The timestamp when the router output was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The IP address of the router output.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The current maintenance schedule details for this router output.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule?

        # The type of maintenance schedule currently in effect for this router output.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String?

        # The Amazon Resource Name (ARN) of the router input associated with the output.
        @[JSON::Field(key: "routedInputArn")]
        getter routed_input_arn : String?

        def initialize(
          @arn : String,
          @availability_zone : String,
          @configuration : Types::RouterOutputConfiguration,
          @created_at : Time,
          @id : String,
          @maintenance_configuration : Types::MaintenanceConfiguration,
          @maintenance_type : String,
          @maximum_bitrate : Int64,
          @messages : Array(Types::RouterOutputMessage),
          @name : String,
          @output_type : String,
          @region_name : String,
          @routed_state : String,
          @routing_scope : String,
          @state : String,
          @stream_details : Types::RouterOutputStreamDetails,
          @tags : Hash(String, String),
          @tier : String,
          @updated_at : Time,
          @ip_address : String? = nil,
          @maintenance_schedule : Types::MaintenanceSchedule? = nil,
          @maintenance_schedule_type : String? = nil,
          @routed_input_arn : String? = nil
        )
        end
      end

      # The configuration settings for a router output.
      struct RouterOutputConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "mediaConnectFlow")]
        getter media_connect_flow : Types::MediaConnectFlowRouterOutputConfiguration?

        @[JSON::Field(key: "mediaLiveInput")]
        getter media_live_input : Types::MediaLiveInputRouterOutputConfiguration?

        @[JSON::Field(key: "standard")]
        getter standard : Types::StandardRouterOutputConfiguration?

        def initialize(
          @media_connect_flow : Types::MediaConnectFlowRouterOutputConfiguration? = nil,
          @media_live_input : Types::MediaLiveInputRouterOutputConfiguration? = nil,
          @standard : Types::StandardRouterOutputConfiguration? = nil
        )
        end
      end

      # A filter that can be used to retrieve a list of router outputs.
      struct RouterOutputFilter
        include JSON::Serializable

        # The names of the router outputs to include in the filter.
        @[JSON::Field(key: "nameContains")]
        getter name_contains : Array(String)?

        # The Amazon Resource Names (ARNs) of the network interfaces associated with the router outputs to
        # include in the filter.
        @[JSON::Field(key: "networkInterfaceArns")]
        getter network_interface_arns : Array(String)?

        # The types of router outputs to include in the filter.
        @[JSON::Field(key: "outputTypes")]
        getter output_types : Array(String)?

        # The AWS Regions of the router outputs to include in the filter.
        @[JSON::Field(key: "regionNames")]
        getter region_names : Array(String)?

        # The ARNs of the router inputs associated with the router outputs to include in the filter.
        @[JSON::Field(key: "routedInputArns")]
        getter routed_input_arns : Array(String)?

        # Filter criteria to list router outputs based on their routing scope.
        @[JSON::Field(key: "routingScopes")]
        getter routing_scopes : Array(String)?

        def initialize(
          @name_contains : Array(String)? = nil,
          @network_interface_arns : Array(String)? = nil,
          @output_types : Array(String)? = nil,
          @region_names : Array(String)? = nil,
          @routed_input_arns : Array(String)? = nil,
          @routing_scopes : Array(String)? = nil
        )
        end
      end

      # A message associated with a router output.
      struct RouterOutputMessage
        include JSON::Serializable

        # The code associated with the router output message.
        @[JSON::Field(key: "code")]
        getter code : String

        # The message text associated with the router output message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # The protocol configuration settings for a router output.
      struct RouterOutputProtocolConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "rist")]
        getter rist : Types::RistRouterOutputConfiguration?

        @[JSON::Field(key: "rtp")]
        getter rtp : Types::RtpRouterOutputConfiguration?

        @[JSON::Field(key: "srtCaller")]
        getter srt_caller : Types::SrtCallerRouterOutputConfiguration?

        @[JSON::Field(key: "srtListener")]
        getter srt_listener : Types::SrtListenerRouterOutputConfiguration?

        def initialize(
          @rist : Types::RistRouterOutputConfiguration? = nil,
          @rtp : Types::RtpRouterOutputConfiguration? = nil,
          @srt_caller : Types::SrtCallerRouterOutputConfiguration? = nil,
          @srt_listener : Types::SrtListenerRouterOutputConfiguration? = nil
        )
        end
      end

      # The request to create a new router output would exceed the service quotas (limits) set for the
      # account.
      struct RouterOutputServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about the router output's stream, including connection state and destination details.
      # The specific details provided vary based on the router output type.
      struct RouterOutputStreamDetails
        include JSON::Serializable

        @[JSON::Field(key: "mediaConnectFlow")]
        getter media_connect_flow : Types::MediaConnectFlowRouterOutputStreamDetails?

        @[JSON::Field(key: "mediaLiveInput")]
        getter media_live_input : Types::MediaLiveInputRouterOutputStreamDetails?

        @[JSON::Field(key: "standard")]
        getter standard : Types::StandardRouterOutputStreamDetails?

        def initialize(
          @media_connect_flow : Types::MediaConnectFlowRouterOutputStreamDetails? = nil,
          @media_live_input : Types::MediaLiveInputRouterOutputStreamDetails? = nil,
          @standard : Types::StandardRouterOutputStreamDetails? = nil
        )
        end
      end

      # The configuration settings for a Router Input using the RTP (Real-Time Transport Protocol) protocol,
      # including the port and forward error correction state.
      struct RtpRouterInputConfiguration
        include JSON::Serializable

        # The port number used for the RTP protocol in the router input configuration.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The state of forward error correction for the RTP protocol in the router input configuration.
        @[JSON::Field(key: "forwardErrorCorrection")]
        getter forward_error_correction : String?

        def initialize(
          @port : Int32,
          @forward_error_correction : String? = nil
        )
        end
      end

      # The configuration settings for a router output using the RTP (Real-Time Transport Protocol)
      # protocol, including the destination address and port, and forward error correction state.
      struct RtpRouterOutputConfiguration
        include JSON::Serializable

        # The destination IP address for the RTP protocol in the router output configuration.
        @[JSON::Field(key: "destinationAddress")]
        getter destination_address : String

        # The destination port number for the RTP protocol in the router output configuration.
        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32

        # The state of forward error correction for the RTP protocol in the router output configuration.
        @[JSON::Field(key: "forwardErrorCorrection")]
        getter forward_error_correction : String?

        def initialize(
          @destination_address : String,
          @destination_port : Int32,
          @forward_error_correction : String? = nil
        )
        end
      end

      # The configuration settings for transit encryption using AWS Secrets Manager, including the secret
      # ARN and role ARN.
      struct SecretsManagerEncryptionKeyConfiguration
        include JSON::Serializable

        # The ARN of the IAM role assumed by MediaConnect to access the AWS Secrets Manager secret.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN of the AWS Secrets Manager secret used for transit encryption.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        def initialize(
          @role_arn : String,
          @secret_arn : String
        )
        end
      end

      # The service is currently unavailable or busy.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The source configuration for cloud flows receiving a stream from a bridge.
      struct SetGatewayBridgeSourceRequest
        include JSON::Serializable

        # The ARN of the bridge feeding this flow.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String

        # The name of the VPC interface attachment to use for this bridge source.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @bridge_arn : String,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # The settings for the source of the flow.
      struct SetSourceRequest
        include JSON::Serializable

        # The type of encryption that is used on the content ingested from this source. Allowable encryption
        # types: static-key.
        @[JSON::Field(key: "decryption")]
        getter decryption : Types::Encryption?

        # A description for the source. This value is not used or seen outside of the current MediaConnect
        # account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the entitlement that allows you to subscribe to this flow. The entitlement is set by the
        # flow originator, and the ARN is generated as part of the originator's flow.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        # The source configuration for cloud flows receiving a stream from a bridge.
        @[JSON::Field(key: "gatewayBridgeSource")]
        getter gateway_bridge_source : Types::SetGatewayBridgeSourceRequest?

        # The port that the flow will be listening on for incoming content.
        @[JSON::Field(key: "ingestPort")]
        getter ingest_port : Int32?

        # The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based
        # streams.
        @[JSON::Field(key: "maxLatency")]
        getter max_latency : Int32?

        # The size of the buffer (in milliseconds) to use to sync incoming source data.
        @[JSON::Field(key: "maxSyncBuffer")]
        getter max_sync_buffer : Int32?

        # The media streams that are associated with the source, and the parameters for those associations.
        @[JSON::Field(key: "mediaStreamSourceConfigurations")]
        getter media_stream_source_configurations : Array(Types::MediaStreamSourceConfigurationRequest)?

        # The minimum latency in milliseconds for SRT-based streams. In streams that use the SRT protocol,
        # this value that you set on your MediaConnect source or output represents the minimal potential
        # latency of that connection. The latency of the stream is set to the highest number between the
        # sender’s minimum latency and the receiver’s minimum latency.
        @[JSON::Field(key: "minLatency")]
        getter min_latency : Int32?

        # The name of the source.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol that is used by the source. Elemental MediaConnect no longer supports the Fujitsu QoS
        # protocol. This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Indicates whether to enable or disable router integration when setting a flow source.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        # The decryption configuration for the flow source when router integration is enabled. Specifies how
        # the source content should be decrypted when router integration is used.
        @[JSON::Field(key: "routerIntegrationTransitDecryption")]
        getter router_integration_transit_decryption : Types::FlowTransitEncryption?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The IP address that the flow communicates with to initiate connection with the sender.
        @[JSON::Field(key: "senderIpAddress")]
        getter sender_ip_address : String?

        # Source IP or domain name for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerAddress")]
        getter source_listener_address : String?

        # Source port for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerPort")]
        getter source_listener_port : Int32?

        # The key-value pairs that can be used to tag and organize the source.
        @[JSON::Field(key: "sourceTags")]
        getter source_tags : Hash(String, String)?

        # The stream ID that you want to use for this transport. This parameter applies only to Zixi and SRT
        # caller-based streams.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The name of the VPC interface to use for this source.
        @[JSON::Field(key: "vpcInterfaceName")]
        getter vpc_interface_name : String?

        # The range of IP addresses that should be allowed to contribute content to your source. These IP
        # addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example,
        # 10.0.0.0/16.
        @[JSON::Field(key: "whitelistCidr")]
        getter whitelist_cidr : String?

        def initialize(
          @decryption : Types::Encryption? = nil,
          @description : String? = nil,
          @entitlement_arn : String? = nil,
          @gateway_bridge_source : Types::SetGatewayBridgeSourceRequest? = nil,
          @ingest_port : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @max_latency : Int32? = nil,
          @max_sync_buffer : Int32? = nil,
          @media_stream_source_configurations : Array(Types::MediaStreamSourceConfigurationRequest)? = nil,
          @min_latency : Int32? = nil,
          @name : String? = nil,
          @protocol : String? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_decryption : Types::FlowTransitEncryption? = nil,
          @sender_control_port : Int32? = nil,
          @sender_ip_address : String? = nil,
          @source_listener_address : String? = nil,
          @source_listener_port : Int32? = nil,
          @source_tags : Hash(String, String)? = nil,
          @stream_id : String? = nil,
          @vpc_interface_name : String? = nil,
          @whitelist_cidr : String? = nil
        )
        end
      end

      # Configures settings for the SilentAudio metric.
      struct SilentAudio
        include JSON::Serializable

        # Indicates whether the SilentAudio metric is enabled or disabled.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Specifies the number of consecutive seconds of silence that triggers an event or alert.
        @[JSON::Field(key: "thresholdSeconds")]
        getter threshold_seconds : Int32?

        def initialize(
          @state : String? = nil,
          @threshold_seconds : Int32? = nil
        )
        end
      end

      # The settings for the source of the flow.
      struct Source
        include JSON::Serializable

        # The name of the source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the source.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The ARN of the router output that's currently connected to this source.
        @[JSON::Field(key: "connectedRouterOutputArn")]
        getter connected_router_output_arn : String?

        # Percentage from 0-100 of the data transfer cost to be billed to the subscriber.
        @[JSON::Field(key: "dataTransferSubscriberFeePercent")]
        getter data_transfer_subscriber_fee_percent : Int32?

        # The type of encryption that is used on the content ingested from this source.
        @[JSON::Field(key: "decryption")]
        getter decryption : Types::Encryption?

        # A description for the source. This value is not used or seen outside of the current MediaConnect
        # account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the entitlement that allows you to subscribe to content that comes from another Amazon
        # Web Services account. The entitlement is set by the content originator and the ARN is generated as
        # part of the originator's flow.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        # The source configuration for cloud flows receiving a stream from a bridge.
        @[JSON::Field(key: "gatewayBridgeSource")]
        getter gateway_bridge_source : Types::GatewayBridgeSource?

        # The IP address that the flow will be listening on for incoming content.
        @[JSON::Field(key: "ingestIp")]
        getter ingest_ip : String?

        # The port that the flow will be listening on for incoming content.
        @[JSON::Field(key: "ingestPort")]
        getter ingest_port : Int32?

        # The media streams that are associated with the source, and the parameters for those associations.
        @[JSON::Field(key: "mediaStreamSourceConfigurations")]
        getter media_stream_source_configurations : Array(Types::MediaStreamSourceConfiguration)?

        # The IP address of the device that is currently sending content to this source. For sources that use
        # protocols where you specify the origin (such as SRT Caller), this value matches the configured
        # origin address. For sources that use listener protocols (such as SRT Listener or RTP), this value
        # shows the address of the connected sender. Peer IP addresses aren't available for entitlements and
        # CDI/ST2110 sources. The peer IP address might not be visible for flows that haven't been started
        # yet, or flows that were started before May 2025. In these cases, restart your flow to see the peer
        # IP address.
        @[JSON::Field(key: "peerIpAddress")]
        getter peer_ip_address : String?

        # Indicates if router integration is enabled or disabled on the flow source.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        # The decryption configuration for the flow source when router integration is enabled.
        @[JSON::Field(key: "routerIntegrationTransitDecryption")]
        getter router_integration_transit_decryption : Types::FlowTransitEncryption?

        # The IP address that the flow communicates with to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderIpAddress")]
        getter sender_ip_address : String?

        # Attributes related to the transport stream that are used in the source.
        @[JSON::Field(key: "transport")]
        getter transport : Types::Transport?

        # The name of the VPC interface that is used for this source.
        @[JSON::Field(key: "vpcInterfaceName")]
        getter vpc_interface_name : String?

        # The range of IP addresses that should be allowed to contribute content to your source. These IP
        # addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example,
        # 10.0.0.0/16.
        @[JSON::Field(key: "whitelistCidr")]
        getter whitelist_cidr : String?

        def initialize(
          @name : String,
          @source_arn : String,
          @connected_router_output_arn : String? = nil,
          @data_transfer_subscriber_fee_percent : Int32? = nil,
          @decryption : Types::Encryption? = nil,
          @description : String? = nil,
          @entitlement_arn : String? = nil,
          @gateway_bridge_source : Types::GatewayBridgeSource? = nil,
          @ingest_ip : String? = nil,
          @ingest_port : Int32? = nil,
          @media_stream_source_configurations : Array(Types::MediaStreamSourceConfiguration)? = nil,
          @peer_ip_address : String? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_decryption : Types::FlowTransitEncryption? = nil,
          @sender_control_port : Int32? = nil,
          @sender_ip_address : String? = nil,
          @transport : Types::Transport? = nil,
          @vpc_interface_name : String? = nil,
          @whitelist_cidr : String? = nil
        )
        end
      end

      # The priority you want to assign to a source. You can have a primary stream and a backup stream or
      # two equally prioritized streams.
      struct SourcePriority
        include JSON::Serializable

        # The name of the source you choose as the primary source for this flow.
        @[JSON::Field(key: "primarySource")]
        getter primary_source : String?

        def initialize(
          @primary_source : String? = nil
        )
        end
      end

      # The configuration settings for a router input using the SRT (Secure Reliable Transport) protocol in
      # caller mode, including the source address and port, minimum latency, stream ID, and decryption key
      # configuration.
      struct SrtCallerRouterInputConfiguration
        include JSON::Serializable

        # The minimum latency in milliseconds for the SRT protocol in caller mode.
        @[JSON::Field(key: "minimumLatencyMilliseconds")]
        getter minimum_latency_milliseconds : Int64

        # The source IP address for the SRT protocol in caller mode.
        @[JSON::Field(key: "sourceAddress")]
        getter source_address : String

        # The source port number for the SRT protocol in caller mode.
        @[JSON::Field(key: "sourcePort")]
        getter source_port : Int32

        # Specifies the decryption settings for an SRT caller input, including the encryption key
        # configuration and associated parameters.
        @[JSON::Field(key: "decryptionConfiguration")]
        getter decryption_configuration : Types::SrtDecryptionConfiguration?

        # The stream ID for the SRT protocol in caller mode.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @minimum_latency_milliseconds : Int64,
          @source_address : String,
          @source_port : Int32,
          @decryption_configuration : Types::SrtDecryptionConfiguration? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # The configuration settings for a router output using the SRT (Secure Reliable Transport) protocol in
      # caller mode, including the destination address and port, minimum latency, stream ID, and encryption
      # key configuration.
      struct SrtCallerRouterOutputConfiguration
        include JSON::Serializable

        # The destination IP address for the SRT protocol in caller mode.
        @[JSON::Field(key: "destinationAddress")]
        getter destination_address : String

        # The destination port number for the SRT protocol in caller mode.
        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32

        # The minimum latency in milliseconds for the SRT protocol in caller mode.
        @[JSON::Field(key: "minimumLatencyMilliseconds")]
        getter minimum_latency_milliseconds : Int64

        # Defines the encryption settings for an SRT caller output, including the encryption key configuration
        # and associated parameters.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::SrtEncryptionConfiguration?

        # The stream ID for the SRT protocol in caller mode.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @destination_address : String,
          @destination_port : Int32,
          @minimum_latency_milliseconds : Int64,
          @encryption_configuration : Types::SrtEncryptionConfiguration? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # Contains the configuration settings for decrypting SRT streams, including the encryption key details
      # and decryption parameters.
      struct SrtDecryptionConfiguration
        include JSON::Serializable

        # Specifies the encryption key configuration used for decrypting SRT streams, including the key source
        # and associated credentials.
        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : Types::SecretsManagerEncryptionKeyConfiguration

        def initialize(
          @encryption_key : Types::SecretsManagerEncryptionKeyConfiguration
        )
        end
      end

      # Contains the configuration settings for encrypting SRT streams, including the encryption key details
      # and encryption parameters.
      struct SrtEncryptionConfiguration
        include JSON::Serializable

        # Specifies the encryption key configuration used for encrypting SRT streams, including the key source
        # and associated credentials.
        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : Types::SecretsManagerEncryptionKeyConfiguration

        def initialize(
          @encryption_key : Types::SecretsManagerEncryptionKeyConfiguration
        )
        end
      end

      # The configuration settings for a router input using the SRT (Secure Reliable Transport) protocol in
      # listener mode, including the port, minimum latency, and decryption key configuration.
      struct SrtListenerRouterInputConfiguration
        include JSON::Serializable

        # The minimum latency in milliseconds for the SRT protocol in listener mode.
        @[JSON::Field(key: "minimumLatencyMilliseconds")]
        getter minimum_latency_milliseconds : Int64

        # The port number for the SRT protocol in listener mode.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # Specifies the decryption settings for an SRT listener input, including the encryption key
        # configuration and associated parameters.
        @[JSON::Field(key: "decryptionConfiguration")]
        getter decryption_configuration : Types::SrtDecryptionConfiguration?

        def initialize(
          @minimum_latency_milliseconds : Int64,
          @port : Int32,
          @decryption_configuration : Types::SrtDecryptionConfiguration? = nil
        )
        end
      end

      # The configuration settings for a router output using the SRT (Secure Reliable Transport) protocol in
      # listener mode, including the port, minimum latency, and encryption key configuration.
      struct SrtListenerRouterOutputConfiguration
        include JSON::Serializable

        # The minimum latency in milliseconds for the SRT protocol in listener mode.
        @[JSON::Field(key: "minimumLatencyMilliseconds")]
        getter minimum_latency_milliseconds : Int64

        # The port number for the SRT protocol in listener mode.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # Defines the encryption settings for an SRT listener output, including the encryption key
        # configuration and associated parameters.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::SrtEncryptionConfiguration?

        def initialize(
          @minimum_latency_milliseconds : Int64,
          @port : Int32,
          @encryption_configuration : Types::SrtEncryptionConfiguration? = nil
        )
        end
      end

      # The configuration settings for a standard router input, including the protocol, protocol-specific
      # configuration, network interface, and availability zone.
      struct StandardRouterInputConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the network interface associated with the standard router input.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String

        # The configuration settings for the protocol used by the standard router input.
        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::RouterInputProtocolConfiguration

        # The protocol used by the standard router input.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @network_interface_arn : String,
          @protocol_configuration : Types::RouterInputProtocolConfiguration,
          @protocol : String? = nil
        )
        end
      end

      # Configuration details for a standard router input stream type.
      struct StandardRouterInputStreamDetails
        include JSON::Serializable

        # The source IP address for the standard router input stream.
        @[JSON::Field(key: "sourceIpAddress")]
        getter source_ip_address : String?

        def initialize(
          @source_ip_address : String? = nil
        )
        end
      end

      # The configuration settings for a standard router output, including the protocol, protocol-specific
      # configuration, network interface, and availability zone.
      struct StandardRouterOutputConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the network interface associated with the standard router output.
        @[JSON::Field(key: "networkInterfaceArn")]
        getter network_interface_arn : String

        # The configuration settings for the protocol used by the standard router output.
        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::RouterOutputProtocolConfiguration

        # The protocol used by the standard router output.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @network_interface_arn : String,
          @protocol_configuration : Types::RouterOutputProtocolConfiguration,
          @protocol : String? = nil
        )
        end
      end

      # Configuration details for a standard router output stream type. Contains information about the
      # destination IP address and connection state for basic output routing.
      struct StandardRouterOutputStreamDetails
        include JSON::Serializable

        # The IP address where the output stream will be sent. This is the destination address that will
        # receive the routed media content.
        @[JSON::Field(key: "destinationIpAddress")]
        getter destination_ip_address : String?

        def initialize(
          @destination_ip_address : String? = nil
        )
        end
      end

      struct StartFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to start.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct StartFlowResponse
        include JSON::Serializable

        # The ARN of the flow that you started.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The status of the flow when the StartFlow process begins.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @flow_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StartRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to start.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StartRouterInputResponse
        include JSON::Serializable

        # The ARN of the router input that was started.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The details of the maintenance schedule for the router input.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule

        # The type of maintenance schedule associated with the router input.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String

        # The name of the router input that was started.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router input after being started.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @maintenance_schedule : Types::MaintenanceSchedule,
          @maintenance_schedule_type : String,
          @name : String,
          @state : String
        )
        end
      end

      struct StartRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to start.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StartRouterOutputResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that was started.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The details of the maintenance schedule for the router output.
        @[JSON::Field(key: "maintenanceSchedule")]
        getter maintenance_schedule : Types::MaintenanceSchedule

        # The type of maintenance schedule associated with the router output.
        @[JSON::Field(key: "maintenanceScheduleType")]
        getter maintenance_schedule_type : String

        # The name of the router output that was started.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router output after being started.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @maintenance_schedule : Types::MaintenanceSchedule,
          @maintenance_schedule_type : String,
          @name : String,
          @state : String
        )
        end
      end

      struct StopFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to stop.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        def initialize(
          @flow_arn : String
        )
        end
      end

      struct StopFlowResponse
        include JSON::Serializable

        # The ARN of the flow that you stopped.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The status of the flow when the StopFlow process begins.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @flow_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StopRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to stop.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StopRouterInputResponse
        include JSON::Serializable

        # The ARN of the router input that was stopped.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router input that was stopped.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router input after being stopped.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct StopRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to stop.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StopRouterOutputResponse
        include JSON::Serializable

        # The ARN of the router output that was stopped.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the router output that was stopped.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the router output after being stopped.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @name : String,
          @state : String
        )
        end
      end

      struct TagGlobalResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the global resource to tag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A map of tag keys and values to add to the global resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the MediaConnect resource to which to add tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A map from tag keys to values. Tag keys can have a maximum character length of 128 characters, and
        # tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TakeRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to associate with a router input.
        @[JSON::Field(key: "RouterOutputArn")]
        getter router_output_arn : String

        # The Amazon Resource Name (ARN) of the router input that you want to associate with a router output.
        @[JSON::Field(key: "routerInputArn")]
        getter router_input_arn : String?

        def initialize(
          @router_output_arn : String,
          @router_input_arn : String? = nil
        )
        end
      end

      struct TakeRouterInputResponse
        include JSON::Serializable

        # The state of the association between the router input and output.
        @[JSON::Field(key: "routedState")]
        getter routed_state : String

        # The ARN of the associated router output.
        @[JSON::Field(key: "routerOutputArn")]
        getter router_output_arn : String

        # The name of the associated router output.
        @[JSON::Field(key: "routerOutputName")]
        getter router_output_name : String

        # The ARN of the associated router input.
        @[JSON::Field(key: "routerInputArn")]
        getter router_input_arn : String?

        # The name of the associated router input.
        @[JSON::Field(key: "routerInputName")]
        getter router_input_name : String?

        def initialize(
          @routed_state : String,
          @router_output_arn : String,
          @router_output_name : String,
          @router_input_arn : String? = nil,
          @router_input_name : String? = nil
        )
        end
      end

      # The details of the thumbnail, including thumbnail base64 string, timecode and the time when
      # thumbnail was generated.
      struct ThumbnailDetails
        include JSON::Serializable

        # The ARN of the flow that DescribeFlowSourceThumbnail was performed on.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String

        # Status code and messages about the flow source thumbnail.
        @[JSON::Field(key: "thumbnailMessages")]
        getter thumbnail_messages : Array(Types::MessageDetail)

        # Thumbnail Base64 string.
        @[JSON::Field(key: "thumbnail")]
        getter thumbnail : String?

        # Timecode of thumbnail.
        @[JSON::Field(key: "timecode")]
        getter timecode : String?

        # The timestamp of when thumbnail was generated.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @flow_arn : String,
          @thumbnail_messages : Array(Types::MessageDetail),
          @thumbnail : String? = nil,
          @timecode : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Attributes related to the transport stream that are used in a source or output.
      struct Transport
        include JSON::Serializable

        # The protocol that is used by the source or output. Elemental MediaConnect no longer supports the
        # Fujitsu QoS protocol. This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The range of IP addresses that should be allowed to initiate output requests to this flow. These IP
        # addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example,
        # 10.0.0.0/16
        @[JSON::Field(key: "cidrAllowList")]
        getter cidr_allow_list : Array(String)?

        # The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based
        # streams.
        @[JSON::Field(key: "maxLatency")]
        getter max_latency : Int32?

        # The size of the buffer (in milliseconds) to use to sync incoming source data.
        @[JSON::Field(key: "maxSyncBuffer")]
        getter max_sync_buffer : Int32?

        # The minimum latency in milliseconds for SRT-based streams. In streams that use the SRT protocol,
        # this value that you set on your MediaConnect source or output represents the minimal potential
        # latency of that connection. The latency of the stream is set to the highest number between the
        # sender’s minimum latency and the receiver’s minimum latency.
        @[JSON::Field(key: "minLatency")]
        getter min_latency : Int32?

        # A suffix for the names of the NDI sources that the flow creates. If a custom name isn't specified,
        # MediaConnect uses the output name.
        @[JSON::Field(key: "ndiProgramName")]
        getter ndi_program_name : String?

        # A quality setting for the NDI Speed HQ encoder.
        @[JSON::Field(key: "ndiSpeedHqQuality")]
        getter ndi_speed_hq_quality : Int32?

        # The remote ID for the Zixi-pull stream.
        @[JSON::Field(key: "remoteId")]
        getter remote_id : String?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The IP address that the flow communicates with to initiate connection with the sender.
        @[JSON::Field(key: "senderIpAddress")]
        getter sender_ip_address : String?

        # The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "smoothingLatency")]
        getter smoothing_latency : Int32?

        # Source IP or domain name for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerAddress")]
        getter source_listener_address : String?

        # Source port for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerPort")]
        getter source_listener_port : Int32?

        # The stream ID that you want to use for this transport. This parameter applies only to Zixi and SRT
        # caller-based streams.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @protocol : String,
          @cidr_allow_list : Array(String)? = nil,
          @max_bitrate : Int32? = nil,
          @max_latency : Int32? = nil,
          @max_sync_buffer : Int32? = nil,
          @min_latency : Int32? = nil,
          @ndi_program_name : String? = nil,
          @ndi_speed_hq_quality : Int32? = nil,
          @remote_id : String? = nil,
          @sender_control_port : Int32? = nil,
          @sender_ip_address : String? = nil,
          @smoothing_latency : Int32? = nil,
          @source_listener_address : String? = nil,
          @source_listener_port : Int32? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # The metadata of the transport stream in the current flow's source.
      struct TransportMediaInfo
        include JSON::Serializable

        # The list of transport stream programs in the current flow's source.
        @[JSON::Field(key: "programs")]
        getter programs : Array(Types::TransportStreamProgram)

        def initialize(
          @programs : Array(Types::TransportStreamProgram)
        )
        end
      end

      # The metadata of an elementary transport stream.
      struct TransportStream
        include JSON::Serializable

        # The Packet ID (PID) as it is reported in the Program Map Table.
        @[JSON::Field(key: "pid")]
        getter pid : Int32

        # The Stream Type as it is reported in the Program Map Table.
        @[JSON::Field(key: "streamType")]
        getter stream_type : String

        # The number of channels in the audio stream.
        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # The codec used by the stream.
        @[JSON::Field(key: "codec")]
        getter codec : String?

        # The frame rate used by the video stream.
        @[JSON::Field(key: "frameRate")]
        getter frame_rate : String?

        # The frame resolution used by the video stream.
        @[JSON::Field(key: "frameResolution")]
        getter frame_resolution : Types::FrameResolution?

        # The sample rate used by the audio stream.
        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # The sample bit size used by the audio stream.
        @[JSON::Field(key: "sampleSize")]
        getter sample_size : Int32?

        def initialize(
          @pid : Int32,
          @stream_type : String,
          @channels : Int32? = nil,
          @codec : String? = nil,
          @frame_rate : String? = nil,
          @frame_resolution : Types::FrameResolution? = nil,
          @sample_rate : Int32? = nil,
          @sample_size : Int32? = nil
        )
        end
      end

      # The metadata of a single transport stream program.
      struct TransportStreamProgram
        include JSON::Serializable

        # The Program Clock Reference (PCR) Packet ID (PID) as it is reported in the Program Association
        # Table.
        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : Int32

        # The program number as it is reported in the Program Association Table.
        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32

        # The program Packet ID (PID) as it is reported in the Program Association Table.
        @[JSON::Field(key: "programPid")]
        getter program_pid : Int32

        # The list of elementary transport streams in the program. The list includes video, audio, and data
        # streams.
        @[JSON::Field(key: "streams")]
        getter streams : Array(Types::TransportStream)

        # The program name as it is reported in the Program Association Table.
        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @pcr_pid : Int32,
          @program_number : Int32,
          @program_pid : Int32,
          @streams : Array(Types::TransportStream),
          @program_name : String? = nil
        )
        end
      end

      struct UntagGlobalResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the global resource to remove tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove from the global resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Update the flow source of the bridge.
      struct UpdateBridgeFlowSourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the MediaConnect resource from which to delete tags.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The name of the VPC interface attachment to use for this source.
        @[JSON::Field(key: "flowVpcInterfaceAttachment")]
        getter flow_vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @flow_arn : String? = nil,
          @flow_vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      # Update an existing network output.
      struct UpdateBridgeNetworkOutputRequest
        include JSON::Serializable

        # The network output IP Address.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The network output's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String?

        # The network output port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The network output protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The network output TTL.
        @[JSON::Field(key: "ttl")]
        getter ttl : Int32?

        def initialize(
          @ip_address : String? = nil,
          @network_name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @ttl : Int32? = nil
        )
        end
      end

      # Update the network source of the bridge.
      struct UpdateBridgeNetworkSourceRequest
        include JSON::Serializable

        # The network source multicast IP.
        @[JSON::Field(key: "multicastIp")]
        getter multicast_ip : String?

        # The settings related to the multicast source.
        @[JSON::Field(key: "multicastSourceSettings")]
        getter multicast_source_settings : Types::MulticastSourceSettings?

        # The network source's gateway network name.
        @[JSON::Field(key: "networkName")]
        getter network_name : String?

        # The network source port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The network source protocol. Elemental MediaConnect no longer supports the Fujitsu QoS protocol.
        # This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @multicast_ip : String? = nil,
          @multicast_source_settings : Types::MulticastSourceSettings? = nil,
          @network_name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil
        )
        end
      end

      struct UpdateBridgeOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # Tname of the output that you want to update.
        @[JSON::Field(key: "OutputName")]
        getter output_name : String

        # The network of the bridge output.
        @[JSON::Field(key: "networkOutput")]
        getter network_output : Types::UpdateBridgeNetworkOutputRequest?

        def initialize(
          @bridge_arn : String,
          @output_name : String,
          @network_output : Types::UpdateBridgeNetworkOutputRequest? = nil
        )
        end
      end

      struct UpdateBridgeOutputResponse
        include JSON::Serializable

        # The ARN of the bridge that was updated.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The bridge output that was updated.
        @[JSON::Field(key: "output")]
        getter output : Types::BridgeOutput?

        def initialize(
          @bridge_arn : String? = nil,
          @output : Types::BridgeOutput? = nil
        )
        end
      end

      struct UpdateBridgeRequest
        include JSON::Serializable

        # TheAmazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # A cloud-to-ground bridge. The content comes from an existing MediaConnect flow and is delivered to
        # your premises.
        @[JSON::Field(key: "egressGatewayBridge")]
        getter egress_gateway_bridge : Types::UpdateEgressGatewayBridgeRequest?

        # A ground-to-cloud bridge. The content originates at your premises and is delivered to the cloud.
        @[JSON::Field(key: "ingressGatewayBridge")]
        getter ingress_gateway_bridge : Types::UpdateIngressGatewayBridgeRequest?

        # The settings for source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::UpdateFailoverConfig?

        def initialize(
          @bridge_arn : String,
          @egress_gateway_bridge : Types::UpdateEgressGatewayBridgeRequest? = nil,
          @ingress_gateway_bridge : Types::UpdateIngressGatewayBridgeRequest? = nil,
          @source_failover_config : Types::UpdateFailoverConfig? = nil
        )
        end
      end

      struct UpdateBridgeResponse
        include JSON::Serializable

        # The bridge that was updated.
        @[JSON::Field(key: "bridge")]
        getter bridge : Types::Bridge?

        def initialize(
          @bridge : Types::Bridge? = nil
        )
        end
      end

      struct UpdateBridgeSourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The name of the source that you want to update.
        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        # The name of the flow that you want to update.
        @[JSON::Field(key: "flowSource")]
        getter flow_source : Types::UpdateBridgeFlowSourceRequest?

        # The network for the bridge source.
        @[JSON::Field(key: "networkSource")]
        getter network_source : Types::UpdateBridgeNetworkSourceRequest?

        def initialize(
          @bridge_arn : String,
          @source_name : String,
          @flow_source : Types::UpdateBridgeFlowSourceRequest? = nil,
          @network_source : Types::UpdateBridgeNetworkSourceRequest? = nil
        )
        end
      end

      struct UpdateBridgeSourceResponse
        include JSON::Serializable

        # The ARN of the updated bridge source.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The updated bridge source.
        @[JSON::Field(key: "source")]
        getter source : Types::BridgeSource?

        def initialize(
          @bridge_arn : String? = nil,
          @source : Types::BridgeSource? = nil
        )
        end
      end

      struct UpdateBridgeStateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bridge that you want to update the state of.
        @[JSON::Field(key: "BridgeArn")]
        getter bridge_arn : String

        # The desired state for the bridge.
        @[JSON::Field(key: "desiredState")]
        getter desired_state : String

        def initialize(
          @bridge_arn : String,
          @desired_state : String
        )
        end
      end

      struct UpdateBridgeStateResponse
        include JSON::Serializable

        # The ARN of the updated bridge.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The new state of the bridge.
        @[JSON::Field(key: "desiredState")]
        getter desired_state : String?

        def initialize(
          @bridge_arn : String? = nil,
          @desired_state : String? = nil
        )
        end
      end

      # Update an existing egress-type bridge.
      struct UpdateEgressGatewayBridgeRequest
        include JSON::Serializable

        # The maximum expected bitrate (in bps).
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        def initialize(
          @max_bitrate : Int32? = nil
        )
        end
      end

      # Information about the encryption of the flow.
      struct UpdateEncryption
        include JSON::Serializable

        # The type of algorithm that is used for the encryption (such as aes128, aes192, or aes256).
        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # A 128-bit, 16-byte hex value represented by a 32-character string, to be used with the key for
        # encrypting content. This parameter is not valid for static key encryption.
        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        # The value of one of the devices that you configured with your digital rights management (DRM)
        # platform key provider. This parameter is required for SPEKE encryption and is not valid for static
        # key encryption.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String?

        # The type of key that is used for the encryption. If no keyType is provided, the service will use the
        # default setting (static-key).
        @[JSON::Field(key: "keyType")]
        getter key_type : String?

        # The Amazon Web Services Region that the API Gateway proxy endpoint was created in. This parameter is
        # required for SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "region")]
        getter region : String?

        # An identifier for the content. The service sends this value to the key server to identify the
        # current endpoint. The resource ID is also known as the content ID. This parameter is required for
        # SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The ARN of the role that you created during setup (when you set up MediaConnect as a trusted
        # entity).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ARN of the secret that you created in Secrets Manager to store the encryption key. This
        # parameter is required for static key encryption and is not valid for SPEKE encryption.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        # The URL from the API Gateway proxy that you set up to talk to your key server. This parameter is
        # required for SPEKE encryption and is not valid for static key encryption.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @algorithm : String? = nil,
          @constant_initialization_vector : String? = nil,
          @device_id : String? = nil,
          @key_type : String? = nil,
          @region : String? = nil,
          @resource_id : String? = nil,
          @role_arn : String? = nil,
          @secret_arn : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The settings for source failover.
      struct UpdateFailoverConfig
        include JSON::Serializable

        # The type of failover you choose for this flow. MERGE combines the source streams into a single
        # stream, allowing graceful recovery from any single-source loss. FAILOVER allows switching between
        # different streams.
        @[JSON::Field(key: "failoverMode")]
        getter failover_mode : String?

        # Recovery window time to look for dash-7 packets.
        @[JSON::Field(key: "recoveryWindow")]
        getter recovery_window : Int32?

        # The priority you want to assign to a source. You can have a primary stream and a backup stream or
        # two equally prioritized streams.
        @[JSON::Field(key: "sourcePriority")]
        getter source_priority : Types::SourcePriority?

        # The state of source failover on the flow. If the state is inactive, the flow can have only one
        # source. If the state is active, the flow can have one or two sources.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @failover_mode : String? = nil,
          @recovery_window : Int32? = nil,
          @source_priority : Types::SourcePriority? = nil,
          @state : String? = nil
        )
        end
      end

      struct UpdateFlowEntitlementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entitlement that you want to update.
        @[JSON::Field(key: "EntitlementArn")]
        getter entitlement_arn : String

        # The ARN of the flow that is associated with the entitlement that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # A description of the entitlement. This description appears only on the MediaConnect console and will
        # not be seen by the subscriber or end user.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of encryption that will be used on the output associated with this entitlement. Allowable
        # encryption types: static-key, speke.
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::UpdateEncryption?

        # An indication of whether you want to enable the entitlement to allow access, or disable it to stop
        # streaming content to the subscriber’s flow temporarily. If you don’t specify the entitlementStatus
        # field in your request, MediaConnect leaves the value unchanged.
        @[JSON::Field(key: "entitlementStatus")]
        getter entitlement_status : String?

        # The Amazon Web Services account IDs that you want to share your content with. The receiving accounts
        # (subscribers) will be allowed to create their own flow using your content as the source.
        @[JSON::Field(key: "subscribers")]
        getter subscribers : Array(String)?

        def initialize(
          @entitlement_arn : String,
          @flow_arn : String,
          @description : String? = nil,
          @encryption : Types::UpdateEncryption? = nil,
          @entitlement_status : String? = nil,
          @subscribers : Array(String)? = nil
        )
        end
      end

      struct UpdateFlowEntitlementResponse
        include JSON::Serializable

        # The new configuration of the entitlement that you updated.
        @[JSON::Field(key: "entitlement")]
        getter entitlement : Types::Entitlement?

        # The ARN of the flow that this entitlement was granted on.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        def initialize(
          @entitlement : Types::Entitlement? = nil,
          @flow_arn : String? = nil
        )
        end
      end

      struct UpdateFlowMediaStreamRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that is associated with the media stream that you
        # updated.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The media stream that you updated.
        @[JSON::Field(key: "MediaStreamName")]
        getter media_stream_name : String

        # The attributes that you want to assign to the media stream.
        @[JSON::Field(key: "attributes")]
        getter attributes : Types::MediaStreamAttributesRequest?

        # The sample rate for the stream. This value in measured in kHz.
        @[JSON::Field(key: "clockRate")]
        getter clock_rate : Int32?

        # A description that can help you quickly identify what your media stream is used for.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of media stream.
        @[JSON::Field(key: "mediaStreamType")]
        getter media_stream_type : String?

        # The resolution of the video.
        @[JSON::Field(key: "videoFormat")]
        getter video_format : String?

        def initialize(
          @flow_arn : String,
          @media_stream_name : String,
          @attributes : Types::MediaStreamAttributesRequest? = nil,
          @clock_rate : Int32? = nil,
          @description : String? = nil,
          @media_stream_type : String? = nil,
          @video_format : String? = nil
        )
        end
      end

      struct UpdateFlowMediaStreamResponse
        include JSON::Serializable

        # The ARN of the flow that is associated with the media stream that you updated.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The media stream that you updated.
        @[JSON::Field(key: "mediaStream")]
        getter media_stream : Types::MediaStream?

        def initialize(
          @flow_arn : String? = nil,
          @media_stream : Types::MediaStream? = nil
        )
        end
      end

      struct UpdateFlowOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that is associated with the output that you want to
        # update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The ARN of the output that you want to update.
        @[JSON::Field(key: "OutputArn")]
        getter output_arn : String

        # The range of IP addresses that should be allowed to initiate output requests to this flow. These IP
        # addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example,
        # 10.0.0.0/16.
        @[JSON::Field(key: "cidrAllowList")]
        getter cidr_allow_list : Array(String)?

        # A description of the output. This description appears only on the MediaConnect console and will not
        # be seen by the end user.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The IP address where you want to send the output.
        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The type of key used for the encryption. If no keyType is provided, the service will use the default
        # setting (static-key). Allowable encryption types: static-key.
        @[JSON::Field(key: "encryption")]
        getter encryption : Types::UpdateEncryption?

        # The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based
        # streams.
        @[JSON::Field(key: "maxLatency")]
        getter max_latency : Int32?

        # The media streams that are associated with the output, and the parameters for those associations.
        @[JSON::Field(key: "mediaStreamOutputConfigurations")]
        getter media_stream_output_configurations : Array(Types::MediaStreamOutputConfigurationRequest)?

        # The minimum latency in milliseconds for SRT-based streams. In streams that use the SRT protocol,
        # this value that you set on your MediaConnect source or output represents the minimal potential
        # latency of that connection. The latency of the stream is set to the highest number between the
        # sender’s minimum latency and the receiver’s minimum latency.
        @[JSON::Field(key: "minLatency")]
        getter min_latency : Int32?

        # A suffix for the names of the NDI sources that the flow creates. If a custom name isn't specified,
        # MediaConnect uses the output name.
        @[JSON::Field(key: "ndiProgramName")]
        getter ndi_program_name : String?

        # A quality setting for the NDI Speed HQ encoder.
        @[JSON::Field(key: "ndiSpeedHqQuality")]
        getter ndi_speed_hq_quality : Int32?

        # An indication of whether the output should transmit data or not. If you don't specify the
        # outputStatus field in your request, MediaConnect leaves the value unchanged.
        @[JSON::Field(key: "outputStatus")]
        getter output_status : String?

        # The port to use when content is distributed to this output.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol to use for the output. Elemental MediaConnect no longer supports the Fujitsu QoS
        # protocol. This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The remote ID for the Zixi-pull stream.
        @[JSON::Field(key: "remoteId")]
        getter remote_id : String?

        # Indicates whether to enable or disable router integration for this flow output.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        @[JSON::Field(key: "routerIntegrationTransitEncryption")]
        getter router_integration_transit_encryption : Types::FlowTransitEncryption?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The IP address that the flow communicates with to initiate connection with the sender.
        @[JSON::Field(key: "senderIpAddress")]
        getter sender_ip_address : String?

        # The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "smoothingLatency")]
        getter smoothing_latency : Int32?

        # The stream ID that you want to use for this transport. This parameter applies only to Zixi and SRT
        # caller-based streams.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The name of the VPC interface attachment to use for this output.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @flow_arn : String,
          @output_arn : String,
          @cidr_allow_list : Array(String)? = nil,
          @description : String? = nil,
          @destination : String? = nil,
          @encryption : Types::UpdateEncryption? = nil,
          @max_latency : Int32? = nil,
          @media_stream_output_configurations : Array(Types::MediaStreamOutputConfigurationRequest)? = nil,
          @min_latency : Int32? = nil,
          @ndi_program_name : String? = nil,
          @ndi_speed_hq_quality : Int32? = nil,
          @output_status : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @remote_id : String? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_encryption : Types::FlowTransitEncryption? = nil,
          @sender_control_port : Int32? = nil,
          @sender_ip_address : String? = nil,
          @smoothing_latency : Int32? = nil,
          @stream_id : String? = nil,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      struct UpdateFlowOutputResponse
        include JSON::Serializable

        # The ARN of the flow that is associated with the updated output.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The new settings of the output that you updated.
        @[JSON::Field(key: "output")]
        getter output : Types::Output?

        def initialize(
          @flow_arn : String? = nil,
          @output : Types::Output? = nil
        )
        end
      end

      struct UpdateFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # Determines the processing capacity and feature set of the flow.
        @[JSON::Field(key: "flowSize")]
        getter flow_size : String?

        # The maintenance setting of the flow.
        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::UpdateMaintenance?

        # Specifies the configuration settings for NDI outputs. Required when the flow includes NDI outputs.
        @[JSON::Field(key: "ndiConfig")]
        getter ndi_config : Types::NdiConfig?

        # The settings for source failover.
        @[JSON::Field(key: "sourceFailoverConfig")]
        getter source_failover_config : Types::UpdateFailoverConfig?

        # The settings for source monitoring.
        @[JSON::Field(key: "sourceMonitoringConfig")]
        getter source_monitoring_config : Types::MonitoringConfig?

        def initialize(
          @flow_arn : String,
          @flow_size : String? = nil,
          @maintenance : Types::UpdateMaintenance? = nil,
          @ndi_config : Types::NdiConfig? = nil,
          @source_failover_config : Types::UpdateFailoverConfig? = nil,
          @source_monitoring_config : Types::MonitoringConfig? = nil
        )
        end
      end

      struct UpdateFlowResponse
        include JSON::Serializable

        # The updated flow.
        @[JSON::Field(key: "flow")]
        getter flow : Types::Flow?

        def initialize(
          @flow : Types::Flow? = nil
        )
        end
      end

      struct UpdateFlowSourceRequest
        include JSON::Serializable

        # The ARN of the flow that you want to update.
        @[JSON::Field(key: "FlowArn")]
        getter flow_arn : String

        # The ARN of the source that you want to update.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The type of encryption that is used on the content ingested from the source.
        @[JSON::Field(key: "decryption")]
        getter decryption : Types::UpdateEncryption?

        # A description of the source. This description is not visible outside of the current Amazon Web
        # Services account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the entitlement that allows you to subscribe to the flow. The
        # entitlement is set by the content originator, and the ARN is generated as part of the originator's
        # flow.
        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        # The source configuration for cloud flows receiving a stream from a bridge.
        @[JSON::Field(key: "gatewayBridgeSource")]
        getter gateway_bridge_source : Types::UpdateGatewayBridgeSourceRequest?

        # The port that the flow listens on for incoming content. If the protocol of the source is Zixi, the
        # port must be set to 2088.
        @[JSON::Field(key: "ingestPort")]
        getter ingest_port : Int32?

        # The maximum bitrate for RIST, RTP, and RTP-FEC streams.
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based
        # streams.
        @[JSON::Field(key: "maxLatency")]
        getter max_latency : Int32?

        # The size of the buffer (in milliseconds) to use to sync incoming source data.
        @[JSON::Field(key: "maxSyncBuffer")]
        getter max_sync_buffer : Int32?

        # The media stream that is associated with the source, and the parameters for that association.
        @[JSON::Field(key: "mediaStreamSourceConfigurations")]
        getter media_stream_source_configurations : Array(Types::MediaStreamSourceConfigurationRequest)?

        # The minimum latency in milliseconds for SRT-based streams. In streams that use the SRT protocol,
        # this value that you set on your MediaConnect source or output represents the minimal potential
        # latency of that connection. The latency of the stream is set to the highest number between the
        # sender’s minimum latency and the receiver’s minimum latency.
        @[JSON::Field(key: "minLatency")]
        getter min_latency : Int32?

        # The protocol that the source uses to deliver the content to MediaConnect. Elemental MediaConnect no
        # longer supports the Fujitsu QoS protocol. This reference is maintained for legacy purposes only.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Indicates whether to enable or disable router integration for this flow source.
        @[JSON::Field(key: "routerIntegrationState")]
        getter router_integration_state : String?

        # The encryption configuration for the flow source when router integration is enabled.
        @[JSON::Field(key: "routerIntegrationTransitDecryption")]
        getter router_integration_transit_decryption : Types::FlowTransitEncryption?

        # The port that the flow uses to send outbound requests to initiate connection with the sender.
        @[JSON::Field(key: "senderControlPort")]
        getter sender_control_port : Int32?

        # The IP address that the flow communicates with to initiate connection with the sender.
        @[JSON::Field(key: "senderIpAddress")]
        getter sender_ip_address : String?

        # The source IP or domain name for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerAddress")]
        getter source_listener_address : String?

        # Source port for SRT-caller protocol.
        @[JSON::Field(key: "sourceListenerPort")]
        getter source_listener_port : Int32?

        # The stream ID that you want to use for this transport. This parameter applies only to Zixi and SRT
        # caller-based streams.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The name of the VPC interface that you want to send your output to.
        @[JSON::Field(key: "vpcInterfaceName")]
        getter vpc_interface_name : String?

        # The range of IP addresses that are allowed to contribute content to your source. Format the IP
        # addresses as a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
        @[JSON::Field(key: "whitelistCidr")]
        getter whitelist_cidr : String?

        def initialize(
          @flow_arn : String,
          @source_arn : String,
          @decryption : Types::UpdateEncryption? = nil,
          @description : String? = nil,
          @entitlement_arn : String? = nil,
          @gateway_bridge_source : Types::UpdateGatewayBridgeSourceRequest? = nil,
          @ingest_port : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @max_latency : Int32? = nil,
          @max_sync_buffer : Int32? = nil,
          @media_stream_source_configurations : Array(Types::MediaStreamSourceConfigurationRequest)? = nil,
          @min_latency : Int32? = nil,
          @protocol : String? = nil,
          @router_integration_state : String? = nil,
          @router_integration_transit_decryption : Types::FlowTransitEncryption? = nil,
          @sender_control_port : Int32? = nil,
          @sender_ip_address : String? = nil,
          @source_listener_address : String? = nil,
          @source_listener_port : Int32? = nil,
          @stream_id : String? = nil,
          @vpc_interface_name : String? = nil,
          @whitelist_cidr : String? = nil
        )
        end
      end

      struct UpdateFlowSourceResponse
        include JSON::Serializable

        # The ARN of the flow that you was updated.
        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The details of the sources that are assigned to the flow.
        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        def initialize(
          @flow_arn : String? = nil,
          @source : Types::Source? = nil
        )
        end
      end

      # The source configuration for cloud flows receiving a stream from a bridge.
      struct UpdateGatewayBridgeSourceRequest
        include JSON::Serializable

        # The ARN of the bridge feeding this flow.
        @[JSON::Field(key: "bridgeArn")]
        getter bridge_arn : String?

        # The name of the VPC interface attachment to use for this bridge source.
        @[JSON::Field(key: "vpcInterfaceAttachment")]
        getter vpc_interface_attachment : Types::VpcInterfaceAttachment?

        def initialize(
          @bridge_arn : String? = nil,
          @vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
        )
        end
      end

      struct UpdateGatewayInstanceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway instance that you want to update.
        @[JSON::Field(key: "GatewayInstanceArn")]
        getter gateway_instance_arn : String

        # The state of the instance. ACTIVE or INACTIVE .
        @[JSON::Field(key: "bridgePlacement")]
        getter bridge_placement : String?

        def initialize(
          @gateway_instance_arn : String,
          @bridge_placement : String? = nil
        )
        end
      end

      struct UpdateGatewayInstanceResponse
        include JSON::Serializable

        # The state of the instance. ACTIVE or INACTIVE .
        @[JSON::Field(key: "bridgePlacement")]
        getter bridge_placement : String?

        # The ARN of the instance that was updated.
        @[JSON::Field(key: "gatewayInstanceArn")]
        getter gateway_instance_arn : String?

        def initialize(
          @bridge_placement : String? = nil,
          @gateway_instance_arn : String? = nil
        )
        end
      end

      # Update an existing ingress-type bridge.
      struct UpdateIngressGatewayBridgeRequest
        include JSON::Serializable

        # The maximum expected bitrate (in bps).
        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # The maximum number of expected outputs.
        @[JSON::Field(key: "maxOutputs")]
        getter max_outputs : Int32?

        def initialize(
          @max_bitrate : Int32? = nil,
          @max_outputs : Int32? = nil
        )
        end
      end

      # Update maintenance setting for a flow.
      struct UpdateMaintenance
        include JSON::Serializable

        # A day of a week when the maintenance will happen.
        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String?

        # A scheduled date in ISO UTC format when the maintenance will happen. Use YYYY-MM-DD format. Example:
        # 2021-01-30.
        @[JSON::Field(key: "maintenanceScheduledDate")]
        getter maintenance_scheduled_date : String?

        # UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes must be 00. Example:
        # 13:00. The default value is 02:00.
        @[JSON::Field(key: "maintenanceStartHour")]
        getter maintenance_start_hour : String?

        def initialize(
          @maintenance_day : String? = nil,
          @maintenance_scheduled_date : String? = nil,
          @maintenance_start_hour : String? = nil
        )
        end
      end

      struct UpdateRouterInputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router input that you want to update.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The updated configuration settings for the router input. Changing the type of the configuration is
        # not supported.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterInputConfiguration?

        # The updated maintenance configuration settings for the router input, including any changes to
        # preferred maintenance windows and schedules.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration?

        # The updated maximum bitrate for the router input.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64?

        # The updated name for the router input.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies whether the router input can be assigned to outputs in different Regions. REGIONAL
        # (default) - can be assigned only to outputs in the same Region. GLOBAL - can be assigned to outputs
        # in any Region.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String?

        # The updated tier level for the router input.
        @[JSON::Field(key: "tier")]
        getter tier : String?

        # The updated transit encryption settings for the router input.
        @[JSON::Field(key: "transitEncryption")]
        getter transit_encryption : Types::RouterInputTransitEncryption?

        def initialize(
          @arn : String,
          @configuration : Types::RouterInputConfiguration? = nil,
          @maintenance_configuration : Types::MaintenanceConfiguration? = nil,
          @maximum_bitrate : Int64? = nil,
          @name : String? = nil,
          @routing_scope : String? = nil,
          @tier : String? = nil,
          @transit_encryption : Types::RouterInputTransitEncryption? = nil
        )
        end
      end

      struct UpdateRouterInputResponse
        include JSON::Serializable

        # The updated router input.
        @[JSON::Field(key: "routerInput")]
        getter router_input : Types::RouterInput

        def initialize(
          @router_input : Types::RouterInput
        )
        end
      end

      struct UpdateRouterNetworkInterfaceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router network interface that you want to update.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The updated configuration settings for the router network interface. Changing the type of the
        # configuration is not supported.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterNetworkInterfaceConfiguration?

        # The updated name for the router network interface.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @configuration : Types::RouterNetworkInterfaceConfiguration? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateRouterNetworkInterfaceResponse
        include JSON::Serializable

        # The updated router network interface.
        @[JSON::Field(key: "routerNetworkInterface")]
        getter router_network_interface : Types::RouterNetworkInterface

        def initialize(
          @router_network_interface : Types::RouterNetworkInterface
        )
        end
      end

      struct UpdateRouterOutputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the router output that you want to update.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The updated configuration settings for the router output. Changing the type of the configuration is
        # not supported.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RouterOutputConfiguration?

        # The updated maintenance configuration settings for the router output, including any changes to
        # preferred maintenance windows and schedules.
        @[JSON::Field(key: "maintenanceConfiguration")]
        getter maintenance_configuration : Types::MaintenanceConfiguration?

        # The updated maximum bitrate for the router output.
        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int64?

        # The updated name for the router output.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies whether the router output can take inputs that are in different Regions. REGIONAL
        # (default) - can only take inputs from same Region. GLOBAL - can take inputs from any Region.
        @[JSON::Field(key: "routingScope")]
        getter routing_scope : String?

        # The updated tier level for the router output.
        @[JSON::Field(key: "tier")]
        getter tier : String?

        def initialize(
          @arn : String,
          @configuration : Types::RouterOutputConfiguration? = nil,
          @maintenance_configuration : Types::MaintenanceConfiguration? = nil,
          @maximum_bitrate : Int64? = nil,
          @name : String? = nil,
          @routing_scope : String? = nil,
          @tier : String? = nil
        )
        end
      end

      struct UpdateRouterOutputResponse
        include JSON::Serializable

        # The updated router output.
        @[JSON::Field(key: "routerOutput")]
        getter router_output : Types::RouterOutput

        def initialize(
          @router_output : Types::RouterOutput
        )
        end
      end

      # Specifies the configuration for video stream metrics monitoring.
      struct VideoMonitoringSetting
        include JSON::Serializable

        # Detects video frames that are black.
        @[JSON::Field(key: "blackFrames")]
        getter black_frames : Types::BlackFrames?

        # Detects video frames that have not changed.
        @[JSON::Field(key: "frozenFrames")]
        getter frozen_frames : Types::FrozenFrames?

        def initialize(
          @black_frames : Types::BlackFrames? = nil,
          @frozen_frames : Types::FrozenFrames? = nil
        )
        end
      end

      # The settings for a VPC source.
      struct VpcInterface
        include JSON::Serializable

        # Immutable and has to be a unique against other VpcInterfaces in this Flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # IDs of the network interfaces created in customer's account by MediaConnect.
        @[JSON::Field(key: "networkInterfaceIds")]
        getter network_interface_ids : Array(String)

        # The type of network interface.
        @[JSON::Field(key: "networkInterfaceType")]
        getter network_interface_type : String

        # A role Arn MediaConnect can assume to create ENIs in your account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Security Group IDs to be used on ENI.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # Subnet must be in the AZ of the Flow.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String

        def initialize(
          @name : String,
          @network_interface_ids : Array(String),
          @network_interface_type : String,
          @role_arn : String,
          @security_group_ids : Array(String),
          @subnet_id : String
        )
        end
      end

      # The settings for attaching a VPC interface to an resource.
      struct VpcInterfaceAttachment
        include JSON::Serializable

        # The name of the VPC interface to use for this resource.
        @[JSON::Field(key: "vpcInterfaceName")]
        getter vpc_interface_name : String?

        def initialize(
          @vpc_interface_name : String? = nil
        )
        end
      end

      # The details of the VPC interfaces that you want to add to the flow.
      struct VpcInterfaceRequest
        include JSON::Serializable

        # The name for the VPC interface. This name must be unique within the flow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the role that you created when you set up MediaConnect as a
        # trusted service.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A virtual firewall to control inbound and outbound traffic.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The subnet IDs that you want to use for your VPC interface. A range of IP addresses in your VPC.
        # When you create your VPC, you specify a range of IPv4 addresses for the VPC in the form of a
        # Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16. This is the primary CIDR
        # block for your VPC. When you create a subnet for your VPC, you specify the CIDR block for the
        # subnet, which is a subset of the VPC CIDR block. The subnets that you use across all VPC interfaces
        # on the flow must be in the same Availability Zone as the flow.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String

        # The type of network interface.
        @[JSON::Field(key: "networkInterfaceType")]
        getter network_interface_type : String?

        # The key-value pairs that can be used to tag and organize the VPC network interface.
        @[JSON::Field(key: "vpcInterfaceTags")]
        getter vpc_interface_tags : Hash(String, String)?

        def initialize(
          @name : String,
          @role_arn : String,
          @security_group_ids : Array(String),
          @subnet_id : String,
          @network_interface_type : String? = nil,
          @vpc_interface_tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration settings for a router network interface within a VPC, including the security group
      # IDs and subnet ID.
      struct VpcRouterNetworkInterfaceConfiguration
        include JSON::Serializable

        # The IDs of the security groups to associate with the router network interface within the VPC.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The ID of the subnet within the VPC to associate the router network interface with.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String

        def initialize(
          @security_group_ids : Array(String),
          @subnet_id : String
        )
        end
      end

      # Defines a specific time window for maintenance operations.
      struct WindowMaintenanceSchedule
        include JSON::Serializable

        # The end time of the maintenance window.
        @[JSON::Field(key: "end")]
        getter end : Time

        # The date and time when the maintenance window is scheduled to occur.
        @[JSON::Field(key: "scheduledTime")]
        getter scheduled_time : Time

        # The start time of the maintenance window.
        @[JSON::Field(key: "start")]
        getter start : Time

        def initialize(
          @end : Time,
          @scheduled_time : Time,
          @start : Time
        )
        end
      end
    end
  end
end
