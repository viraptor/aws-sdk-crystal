require "json"
require "time"

module Aws
  module GroundStation
    module Types

      # Detailed information about the agent.

      struct AgentDetails
        include JSON::Serializable

        # Current agent version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # List of versions being used by agent components.

        @[JSON::Field(key: "componentVersions")]
        getter component_versions : Array(Types::ComponentVersion)

        # ID of EC2 instance agent is running on.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # Type of EC2 instance agent is running on.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # List of CPU cores reserved for the agent.

        @[JSON::Field(key: "agentCpuCores")]
        getter agent_cpu_cores : Array(Int32)?

        # This field should not be used. Use agentCpuCores instead. List of CPU cores reserved for processes
        # other than the agent running on the EC2 instance.

        @[JSON::Field(key: "reservedCpuCores")]
        getter reserved_cpu_cores : Array(Int32)?

        def initialize(
          @agent_version : String,
          @component_versions : Array(Types::ComponentVersion),
          @instance_id : String,
          @instance_type : String,
          @agent_cpu_cores : Array(Int32)? = nil,
          @reserved_cpu_cores : Array(Int32)? = nil
        )
        end
      end

      # Aggregate status of Agent components.

      struct AggregateStatus
        include JSON::Serializable

        # Aggregate status.

        @[JSON::Field(key: "status")]
        getter status : String

        # Sparse map of failure signatures.

        @[JSON::Field(key: "signatureMap")]
        getter signature_map : Hash(String, Bool)?

        def initialize(
          @status : String,
          @signature_map : Hash(String, Bool)? = nil
        )
        end
      end

      # Details about an antenna demod decode Config used in a contact.

      struct AntennaDemodDecodeDetails
        include JSON::Serializable

        # Name of an antenna demod decode output node used in a contact.

        @[JSON::Field(key: "outputNode")]
        getter output_node : String?

        def initialize(
          @output_node : String? = nil
        )
        end
      end

      # Information about how AWS Ground Station should configure an antenna for downlink during a contact.

      struct AntennaDownlinkConfig
        include JSON::Serializable

        # Object that describes a spectral Config .

        @[JSON::Field(key: "spectrumConfig")]
        getter spectrum_config : Types::SpectrumConfig

        def initialize(
          @spectrum_config : Types::SpectrumConfig
        )
        end
      end

      # Information about how AWS Ground Station should conﬁgure an antenna for downlink demod decode during
      # a contact.

      struct AntennaDownlinkDemodDecodeConfig
        include JSON::Serializable

        # Information about the decode Config .

        @[JSON::Field(key: "decodeConfig")]
        getter decode_config : Types::DecodeConfig

        # Information about the demodulation Config .

        @[JSON::Field(key: "demodulationConfig")]
        getter demodulation_config : Types::DemodulationConfig

        # Information about the spectral Config .

        @[JSON::Field(key: "spectrumConfig")]
        getter spectrum_config : Types::SpectrumConfig

        def initialize(
          @decode_config : Types::DecodeConfig,
          @demodulation_config : Types::DemodulationConfig,
          @spectrum_config : Types::SpectrumConfig
        )
        end
      end

      # Information about the uplink Config of an antenna.

      struct AntennaUplinkConfig
        include JSON::Serializable

        # Information about the uplink spectral Config .

        @[JSON::Field(key: "spectrumConfig")]
        getter spectrum_config : Types::UplinkSpectrumConfig

        # EIRP of the target.

        @[JSON::Field(key: "targetEirp")]
        getter target_eirp : Types::Eirp

        # Whether or not uplink transmit is disabled.

        @[JSON::Field(key: "transmitDisabled")]
        getter transmit_disabled : Bool?

        def initialize(
          @spectrum_config : Types::UplinkSpectrumConfig,
          @target_eirp : Types::Eirp,
          @transmit_disabled : Bool? = nil
        )
        end
      end

      # Information about AwsGroundStationAgentEndpoint.

      struct AwsGroundStationAgentEndpoint
        include JSON::Serializable

        # The egress address of AgentEndpoint.

        @[JSON::Field(key: "egressAddress")]
        getter egress_address : Types::ConnectionDetails

        # The ingress address of AgentEndpoint.

        @[JSON::Field(key: "ingressAddress")]
        getter ingress_address : Types::RangedConnectionDetails

        # Name string associated with AgentEndpoint. Used as a human-readable identifier for AgentEndpoint.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of AgentEndpoint.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String?

        # The results of the audit.

        @[JSON::Field(key: "auditResults")]
        getter audit_results : String?

        def initialize(
          @egress_address : Types::ConnectionDetails,
          @ingress_address : Types::RangedConnectionDetails,
          @name : String,
          @agent_status : String? = nil,
          @audit_results : String? = nil
        )
        end
      end

      # Azimuth elevation ephemeris data. Use this ephemeris type to provide pointing angles directly,
      # rather than satellite orbital elements. Use this when you need precise antenna pointing but have
      # imprecise or unknown satellite trajectory information. The azimuth elevation data specifies the
      # antenna pointing direction at specific times relative to a ground station location. AWS Ground
      # Station uses 4th order Lagrange interpolation to compute pointing angles between the provided data
      # points. AWS Ground Station automatically filters interpolated pointing angles, including only those
      # that are above the site mask elevation of the specified ground station. For more detail about
      # providing azimuth elevation ephemerides to AWS Ground Station, see the azimuth elevation ephemeris
      # section of the AWS Ground Station User Guide.

      struct AzElEphemeris
        include JSON::Serializable

        # Azimuth elevation segment data. You can provide data inline in the request or through an Amazon S3
        # object reference.

        @[JSON::Field(key: "data")]
        getter data : Types::AzElSegmentsData

        # The ground station name for which you're providing azimuth elevation data. This ephemeris is
        # specific to this ground station and can't be used at other locations.

        @[JSON::Field(key: "groundStation")]
        getter ground_station : String

        def initialize(
          @data : Types::AzElSegmentsData,
          @ground_station : String
        )
        end
      end

      # Filter for selecting contacts that use a specific AzElEphemeris .

      struct AzElEphemerisFilter
        include JSON::Serializable

        # Unique identifier of the azimuth elevation ephemeris.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Program track settings for AzElEphemeris .

      struct AzElProgramTrackSettings
        include JSON::Serializable

        # Unique identifier of the azimuth elevation ephemeris.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String

        def initialize(
          @ephemeris_id : String
        )
        end
      end

      # A time segment containing azimuth elevation pointing data. Each segment defines a continuous time
      # period with pointing angle data points. AWS Ground Station uses 4th order Lagrange interpolation
      # between the provided points, so each segment must contain at least five data points.

      struct AzElSegment
        include JSON::Serializable

        # List of time-tagged azimuth elevation data points. Must contain at least five points to support 4th
        # order Lagrange interpolation. Points must be in chronological order with no duplicates.

        @[JSON::Field(key: "azElList")]
        getter az_el_list : Array(Types::TimeAzEl)

        # The reference time for this segment in ISO 8601 format in Coordinated Universal Time (UTC). All time
        # values within the segment's AzElSegment$azElList are specified as offsets in atomic seconds from
        # this reference epoch. Example: 2024-01-15T12:00:00.000Z

        @[JSON::Field(key: "referenceEpoch")]
        getter reference_epoch : Time

        # The valid time range for this segment. Specifies the start and end timestamps in ISO 8601 format in
        # Coordinated Universal Time (UTC). The segment's pointing data must cover this entire time range.

        @[JSON::Field(key: "validTimeRange")]
        getter valid_time_range : Types::ISO8601TimeRange

        def initialize(
          @az_el_list : Array(Types::TimeAzEl),
          @reference_epoch : Time,
          @valid_time_range : Types::ISO8601TimeRange
        )
        end
      end

      # Azimuth elevation segment collection. Contains five or more time-ordered segments that define
      # antenna pointing angles over the ephemeris validity period.

      struct AzElSegments
        include JSON::Serializable

        # The unit of measure for azimuth and elevation angles. All angles in all segments must use the same
        # unit.

        @[JSON::Field(key: "angleUnit")]
        getter angle_unit : String

        # List of azimuth elevation segments. Must contain between 1 and 100 segments. Segments must be in
        # chronological order with no overlaps.

        @[JSON::Field(key: "azElSegmentList")]
        getter az_el_segment_list : Array(Types::AzElSegment)

        def initialize(
          @angle_unit : String,
          @az_el_segment_list : Array(Types::AzElSegment)
        )
        end
      end

      # Container for azimuth elevation segment data. Specify either AzElSegmentsData$s3Object to reference
      # data in Amazon S3, or AzElSegmentsData$azElData to provide data inline.

      struct AzElSegmentsData
        include JSON::Serializable

        # Azimuth elevation segment data provided directly in the request. Use this option for smaller
        # datasets or when Amazon S3 access is not available.

        @[JSON::Field(key: "azElData")]
        getter az_el_data : Types::AzElSegments?

        # The Amazon S3 object containing azimuth elevation segment data. The Amazon S3 object must contain
        # JSON-formatted azimuth elevation data matching the AzElSegments structure.

        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @az_el_data : Types::AzElSegments? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end


      struct CancelContactRequest
        include JSON::Serializable

        # UUID of a contact.

        @[JSON::Field(key: "contactId")]
        getter contact_id : String

        def initialize(
          @contact_id : String
        )
        end
      end

      # Data on the status of agent components.

      struct ComponentStatusData
        include JSON::Serializable

        # Capability ARN of the component.

        @[JSON::Field(key: "capabilityArn")]
        getter capability_arn : String

        # The Component type.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # Dataflow UUID associated with the component.

        @[JSON::Field(key: "dataflowId")]
        getter dataflow_id : String

        # Component status.

        @[JSON::Field(key: "status")]
        getter status : String

        # Bytes received by the component.

        @[JSON::Field(key: "bytesReceived")]
        getter bytes_received : Int64?

        # Bytes sent by the component.

        @[JSON::Field(key: "bytesSent")]
        getter bytes_sent : Int64?

        # Packets dropped by component.

        @[JSON::Field(key: "packetsDropped")]
        getter packets_dropped : Int64?

        def initialize(
          @capability_arn : String,
          @component_type : String,
          @dataflow_id : String,
          @status : String,
          @bytes_received : Int64? = nil,
          @bytes_sent : Int64? = nil,
          @packets_dropped : Int64? = nil
        )
        end
      end

      # Version information for agent components.

      struct ComponentVersion
        include JSON::Serializable

        # Component type.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # List of versions.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)

        def initialize(
          @component_type : String,
          @versions : Array(String)
        )
        end
      end

      # Details for certain Config object types in a contact.

      struct ConfigDetails
        include JSON::Serializable

        # Details for antenna demod decode Config in a contact.

        @[JSON::Field(key: "antennaDemodDecodeDetails")]
        getter antenna_demod_decode_details : Types::AntennaDemodDecodeDetails?


        @[JSON::Field(key: "endpointDetails")]
        getter endpoint_details : Types::EndpointDetails?

        # Details for an S3 recording Config in a contact.

        @[JSON::Field(key: "s3RecordingDetails")]
        getter s3_recording_details : Types::S3RecordingDetails?

        def initialize(
          @antenna_demod_decode_details : Types::AntennaDemodDecodeDetails? = nil,
          @endpoint_details : Types::EndpointDetails? = nil,
          @s3_recording_details : Types::S3RecordingDetails? = nil
        )
        end
      end


      struct ConfigIdResponse
        include JSON::Serializable

        # ARN of a Config .

        @[JSON::Field(key: "configArn")]
        getter config_arn : String?

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String?

        def initialize(
          @config_arn : String? = nil,
          @config_id : String? = nil,
          @config_type : String? = nil
        )
        end
      end

      # An item in a list of Config objects.

      struct ConfigListItem
        include JSON::Serializable

        # ARN of a Config .

        @[JSON::Field(key: "configArn")]
        getter config_arn : String?

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String?

        # Name of a Config .

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @config_arn : String? = nil,
          @config_id : String? = nil,
          @config_type : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Object containing the parameters of a Config . See the subtype definitions for what each type of
      # Config contains.

      struct ConfigTypeData
        include JSON::Serializable

        # Information about how AWS Ground Station should configure an antenna for downlink during a contact.

        @[JSON::Field(key: "antennaDownlinkConfig")]
        getter antenna_downlink_config : Types::AntennaDownlinkConfig?

        # Information about how AWS Ground Station should conﬁgure an antenna for downlink demod decode during
        # a contact.

        @[JSON::Field(key: "antennaDownlinkDemodDecodeConfig")]
        getter antenna_downlink_demod_decode_config : Types::AntennaDownlinkDemodDecodeConfig?

        # Information about how AWS Ground Station should conﬁgure an antenna for uplink during a contact.

        @[JSON::Field(key: "antennaUplinkConfig")]
        getter antenna_uplink_config : Types::AntennaUplinkConfig?

        # Information about the dataflow endpoint Config .

        @[JSON::Field(key: "dataflowEndpointConfig")]
        getter dataflow_endpoint_config : Types::DataflowEndpointConfig?

        # Information about an S3 recording Config .

        @[JSON::Field(key: "s3RecordingConfig")]
        getter s3_recording_config : Types::S3RecordingConfig?

        # Object that determines whether tracking should be used during a contact executed with this Config in
        # the mission profile.

        @[JSON::Field(key: "trackingConfig")]
        getter tracking_config : Types::TrackingConfig?

        # Information about an uplink echo Config . Parameters from the AntennaUplinkConfig , corresponding to
        # the specified AntennaUplinkConfigArn , are used when this UplinkEchoConfig is used in a contact.

        @[JSON::Field(key: "uplinkEchoConfig")]
        getter uplink_echo_config : Types::UplinkEchoConfig?

        def initialize(
          @antenna_downlink_config : Types::AntennaDownlinkConfig? = nil,
          @antenna_downlink_demod_decode_config : Types::AntennaDownlinkDemodDecodeConfig? = nil,
          @antenna_uplink_config : Types::AntennaUplinkConfig? = nil,
          @dataflow_endpoint_config : Types::DataflowEndpointConfig? = nil,
          @s3_recording_config : Types::S3RecordingConfig? = nil,
          @tracking_config : Types::TrackingConfig? = nil,
          @uplink_echo_config : Types::UplinkEchoConfig? = nil
        )
        end
      end

      # Egress address of AgentEndpoint with an optional mtu.

      struct ConnectionDetails
        include JSON::Serializable

        # A socket address.

        @[JSON::Field(key: "socketAddress")]
        getter socket_address : Types::SocketAddress

        # Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        def initialize(
          @socket_address : Types::SocketAddress,
          @mtu : Int32? = nil
        )
        end
      end

      # Data describing a contact.

      struct ContactData
        include JSON::Serializable

        # UUID of a contact.

        @[JSON::Field(key: "contactId")]
        getter contact_id : String?

        # Status of a contact.

        @[JSON::Field(key: "contactStatus")]
        getter contact_status : String?

        # End time of a contact in UTC.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ephemeris that determines antenna pointing for the contact.

        @[JSON::Field(key: "ephemeris")]
        getter ephemeris : Types::EphemerisResponseData?

        # Error message of a contact.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Name of a ground station.

        @[JSON::Field(key: "groundStation")]
        getter ground_station : String?

        # Maximum elevation angle of a contact.

        @[JSON::Field(key: "maximumElevation")]
        getter maximum_elevation : Types::Elevation?

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String?

        # Amount of time after a contact ends that you’d like to receive a CloudWatch event indicating the
        # pass has finished.

        @[JSON::Field(key: "postPassEndTime")]
        getter post_pass_end_time : Time?

        # Amount of time prior to contact start you’d like to receive a CloudWatch event indicating an
        # upcoming pass.

        @[JSON::Field(key: "prePassStartTime")]
        getter pre_pass_start_time : Time?

        # Region of a contact.

        @[JSON::Field(key: "region")]
        getter region : String?

        # ARN of a satellite.

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        # Start time of a contact in UTC.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Tags assigned to a contact.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Projected time in UTC your satellite will set below the receive mask . This time is based on the
        # satellite's current active ephemeris for future contacts and the ephemeris that was active during
        # contact execution for completed contacts. This field is not present for contacts with a SCHEDULING
        # or SCHEDULED status.

        @[JSON::Field(key: "visibilityEndTime")]
        getter visibility_end_time : Time?

        # Projected time in UTC your satellite will rise above the receive mask . This time is based on the
        # satellite's current active ephemeris for future contacts and the ephemeris that was active during
        # contact execution for completed contacts. This field is not present for contacts with a SCHEDULING
        # or SCHEDULED status.

        @[JSON::Field(key: "visibilityStartTime")]
        getter visibility_start_time : Time?

        def initialize(
          @contact_id : String? = nil,
          @contact_status : String? = nil,
          @end_time : Time? = nil,
          @ephemeris : Types::EphemerisResponseData? = nil,
          @error_message : String? = nil,
          @ground_station : String? = nil,
          @maximum_elevation : Types::Elevation? = nil,
          @mission_profile_arn : String? = nil,
          @post_pass_end_time : Time? = nil,
          @pre_pass_start_time : Time? = nil,
          @region : String? = nil,
          @satellite_arn : String? = nil,
          @start_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @visibility_end_time : Time? = nil,
          @visibility_start_time : Time? = nil
        )
        end
      end


      struct ContactIdResponse
        include JSON::Serializable

        # UUID of a contact.

        @[JSON::Field(key: "contactId")]
        getter contact_id : String?

        def initialize(
          @contact_id : String? = nil
        )
        end
      end


      struct CreateConfigRequest
        include JSON::Serializable

        # Parameters of a Config .

        @[JSON::Field(key: "configData")]
        getter config_data : Types::ConfigTypeData

        # Name of a Config .

        @[JSON::Field(key: "name")]
        getter name : String

        # Tags assigned to a Config .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @config_data : Types::ConfigTypeData,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDataflowEndpointGroupRequest
        include JSON::Serializable

        # Endpoint details of each endpoint in the dataflow endpoint group. All dataflow endpoints within a
        # single dataflow endpoint group must be of the same type. You cannot mix AWS Ground Station Agent
        # endpoints with Dataflow endpoints in the same group. If your use case requires both types of
        # endpoints, you must create separate dataflow endpoint groups for each type.

        @[JSON::Field(key: "endpointDetails")]
        getter endpoint_details : Array(Types::EndpointDetails)

        # Amount of time, in seconds, after a contact ends that the Ground Station Dataflow Endpoint Group
        # will be in a POSTPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the POSTPASS state.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time, in seconds, before a contact starts that the Ground Station Dataflow Endpoint Group
        # will be in a PREPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the PREPASS state.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # Tags of a dataflow endpoint group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @endpoint_details : Array(Types::EndpointDetails),
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDataflowEndpointGroupV2Request
        include JSON::Serializable

        # Dataflow endpoint group's endpoint definitions

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::CreateEndpointDetails)

        # Amount of time, in seconds, after a contact ends that the Ground Station Dataflow Endpoint Group
        # will be in a POSTPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the POSTPASS state.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time, in seconds, before a contact starts that the Ground Station Dataflow Endpoint Group
        # will be in a PREPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the PREPASS state.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # Tags of a V2 dataflow endpoint group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @endpoints : Array(Types::CreateEndpointDetails),
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDataflowEndpointGroupV2Response
        include JSON::Serializable

        # Dataflow endpoint group ID

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String?

        def initialize(
          @dataflow_endpoint_group_id : String? = nil
        )
        end
      end

      # Endpoint definition used for creating a dataflow endpoint

      struct CreateEndpointDetails
        include JSON::Serializable

        # Definition for a downlink agent endpoint

        @[JSON::Field(key: "downlinkAwsGroundStationAgentEndpoint")]
        getter downlink_aws_ground_station_agent_endpoint : Types::DownlinkAwsGroundStationAgentEndpoint?

        # Definition for an uplink agent endpoint

        @[JSON::Field(key: "uplinkAwsGroundStationAgentEndpoint")]
        getter uplink_aws_ground_station_agent_endpoint : Types::UplinkAwsGroundStationAgentEndpoint?

        def initialize(
          @downlink_aws_ground_station_agent_endpoint : Types::DownlinkAwsGroundStationAgentEndpoint? = nil,
          @uplink_aws_ground_station_agent_endpoint : Types::UplinkAwsGroundStationAgentEndpoint? = nil
        )
        end
      end


      struct CreateEphemerisRequest
        include JSON::Serializable

        # A name that you can use to identify the ephemeris.

        @[JSON::Field(key: "name")]
        getter name : String

        # Set to true to enable the ephemeris after validation. Set to false to keep it disabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Ephemeris data.

        @[JSON::Field(key: "ephemeris")]
        getter ephemeris : Types::EphemerisData?

        # An overall expiration time for the ephemeris in UTC, after which it will become EXPIRED .

        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time?

        # The ARN of the KMS key to use for encrypting the ephemeris.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # A priority score that determines which ephemeris to use when multiple ephemerides overlap. Higher
        # numbers take precedence. The default is 1. Must be 1 or greater.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The satellite ID that associates this ephemeris with a satellite in AWS Ground Station.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        # Tags assigned to an ephemeris.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @enabled : Bool? = nil,
          @ephemeris : Types::EphemerisData? = nil,
          @expiration_time : Time? = nil,
          @kms_key_arn : String? = nil,
          @priority : Int32? = nil,
          @satellite_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMissionProfileRequest
        include JSON::Serializable

        # A list of lists of ARNs. Each list of ARNs is an edge, with a from Config and a to Config .

        @[JSON::Field(key: "dataflowEdges")]
        getter dataflow_edges : Array(Array(String))

        # Smallest amount of time in seconds that you’d like to see for an available contact. AWS Ground
        # Station will not present you with contacts shorter than this duration.

        @[JSON::Field(key: "minimumViableContactDurationSeconds")]
        getter minimum_viable_contact_duration_seconds : Int32

        # Name of a mission profile.

        @[JSON::Field(key: "name")]
        getter name : String

        # ARN of a tracking Config .

        @[JSON::Field(key: "trackingConfigArn")]
        getter tracking_config_arn : String

        # Amount of time after a contact ends that you’d like to receive a Ground Station Contact State Change
        # event indicating the pass has finished.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time prior to contact start you’d like to receive a Ground Station Contact State Change
        # event indicating an upcoming pass.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # KMS key to use for encrypting streams.

        @[JSON::Field(key: "streamsKmsKey")]
        getter streams_kms_key : Types::KmsKey?

        # Role to use for encrypting streams with KMS key.

        @[JSON::Field(key: "streamsKmsRole")]
        getter streams_kms_role : String?

        # Tags assigned to a mission profile.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dataflow_edges : Array(Array(String)),
          @minimum_viable_contact_duration_seconds : Int32,
          @name : String,
          @tracking_config_arn : String,
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @streams_kms_key : Types::KmsKey? = nil,
          @streams_kms_role : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about a dataflow edge used in a contact.

      struct DataflowDetail
        include JSON::Serializable


        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination?

        # Error message for a dataflow.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        def initialize(
          @destination : Types::Destination? = nil,
          @error_message : String? = nil,
          @source : Types::Source? = nil
        )
        end
      end

      # Information about a dataflow endpoint.

      struct DataflowEndpoint
        include JSON::Serializable

        # Socket address of a dataflow endpoint.

        @[JSON::Field(key: "address")]
        getter address : Types::SocketAddress?

        # Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # Name of a dataflow endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Status of a dataflow endpoint.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @address : Types::SocketAddress? = nil,
          @mtu : Int32? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about the dataflow endpoint Config .

      struct DataflowEndpointConfig
        include JSON::Serializable

        # Name of a dataflow endpoint.

        @[JSON::Field(key: "dataflowEndpointName")]
        getter dataflow_endpoint_name : String

        # Region of a dataflow endpoint.

        @[JSON::Field(key: "dataflowEndpointRegion")]
        getter dataflow_endpoint_region : String?

        def initialize(
          @dataflow_endpoint_name : String,
          @dataflow_endpoint_region : String? = nil
        )
        end
      end


      struct DataflowEndpointGroupIdResponse
        include JSON::Serializable

        # UUID of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String?

        def initialize(
          @dataflow_endpoint_group_id : String? = nil
        )
        end
      end

      # Item in a list of DataflowEndpoint groups.

      struct DataflowEndpointListItem
        include JSON::Serializable

        # ARN of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupArn")]
        getter dataflow_endpoint_group_arn : String?

        # UUID of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String?

        def initialize(
          @dataflow_endpoint_group_arn : String? = nil,
          @dataflow_endpoint_group_id : String? = nil
        )
        end
      end

      # Information about the decode Config .

      struct DecodeConfig
        include JSON::Serializable

        # Unvalidated JSON of a decode Config .

        @[JSON::Field(key: "unvalidatedJSON")]
        getter unvalidated_json : String

        def initialize(
          @unvalidated_json : String
        )
        end
      end


      struct DeleteConfigRequest
        include JSON::Serializable

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String

        def initialize(
          @config_id : String,
          @config_type : String
        )
        end
      end


      struct DeleteDataflowEndpointGroupRequest
        include JSON::Serializable

        # UUID of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String

        def initialize(
          @dataflow_endpoint_group_id : String
        )
        end
      end


      struct DeleteEphemerisRequest
        include JSON::Serializable

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String

        def initialize(
          @ephemeris_id : String
        )
        end
      end


      struct DeleteMissionProfileRequest
        include JSON::Serializable

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String

        def initialize(
          @mission_profile_id : String
        )
        end
      end

      # Information about the demodulation Config .

      struct DemodulationConfig
        include JSON::Serializable

        # Unvalidated JSON of a demodulation Config .

        @[JSON::Field(key: "unvalidatedJSON")]
        getter unvalidated_json : String

        def initialize(
          @unvalidated_json : String
        )
        end
      end

      # Dependency encountered an error.

      struct DependencyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String?

        def initialize(
          @message : String? = nil,
          @parameter_name : String? = nil
        )
        end
      end


      struct DescribeContactRequest
        include JSON::Serializable

        # UUID of a contact.

        @[JSON::Field(key: "contactId")]
        getter contact_id : String

        def initialize(
          @contact_id : String
        )
        end
      end


      struct DescribeContactResponse
        include JSON::Serializable

        # UUID of a contact.

        @[JSON::Field(key: "contactId")]
        getter contact_id : String?

        # Status of a contact.

        @[JSON::Field(key: "contactStatus")]
        getter contact_status : String?

        # List describing source and destination details for each dataflow edge.

        @[JSON::Field(key: "dataflowList")]
        getter dataflow_list : Array(Types::DataflowDetail)?

        # End time of a contact in UTC.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ephemeris that determines antenna pointing directions for the contact.

        @[JSON::Field(key: "ephemeris")]
        getter ephemeris : Types::EphemerisResponseData?

        # Error message for a contact.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Ground station for a contact.

        @[JSON::Field(key: "groundStation")]
        getter ground_station : String?

        # Maximum elevation angle of a contact.

        @[JSON::Field(key: "maximumElevation")]
        getter maximum_elevation : Types::Elevation?

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String?

        # Amount of time after a contact ends that you’d like to receive a CloudWatch event indicating the
        # pass has finished.

        @[JSON::Field(key: "postPassEndTime")]
        getter post_pass_end_time : Time?

        # Amount of time prior to contact start you’d like to receive a CloudWatch event indicating an
        # upcoming pass.

        @[JSON::Field(key: "prePassStartTime")]
        getter pre_pass_start_time : Time?

        # Region of a contact.

        @[JSON::Field(key: "region")]
        getter region : String?

        # ARN of a satellite.

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        # Start time of a contact in UTC.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Tags assigned to a contact.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Tracking configuration overrides specified when the contact was reserved.

        @[JSON::Field(key: "trackingOverrides")]
        getter tracking_overrides : Types::TrackingOverrides?

        # Projected time in UTC your satellite will set below the receive mask . This time is based on the
        # satellite's current active ephemeris for future contacts and the ephemeris that was active during
        # contact execution for completed contacts.

        @[JSON::Field(key: "visibilityEndTime")]
        getter visibility_end_time : Time?

        # Projected time in UTC your satellite will rise above the receive mask . This time is based on the
        # satellite's current active ephemeris for future contacts and the ephemeris that was active during
        # contact execution for completed contacts.

        @[JSON::Field(key: "visibilityStartTime")]
        getter visibility_start_time : Time?

        def initialize(
          @contact_id : String? = nil,
          @contact_status : String? = nil,
          @dataflow_list : Array(Types::DataflowDetail)? = nil,
          @end_time : Time? = nil,
          @ephemeris : Types::EphemerisResponseData? = nil,
          @error_message : String? = nil,
          @ground_station : String? = nil,
          @maximum_elevation : Types::Elevation? = nil,
          @mission_profile_arn : String? = nil,
          @post_pass_end_time : Time? = nil,
          @pre_pass_start_time : Time? = nil,
          @region : String? = nil,
          @satellite_arn : String? = nil,
          @start_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @tracking_overrides : Types::TrackingOverrides? = nil,
          @visibility_end_time : Time? = nil,
          @visibility_start_time : Time? = nil
        )
        end
      end


      struct DescribeEphemerisRequest
        include JSON::Serializable

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String

        def initialize(
          @ephemeris_id : String
        )
        end
      end


      struct DescribeEphemerisResponse
        include JSON::Serializable

        # The time the ephemeris was uploaded in UTC.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Whether or not the ephemeris is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String?

        # Detailed error information for ephemerides with INVALID status. Provides specific error codes and
        # messages to help diagnose validation failures.

        @[JSON::Field(key: "errorReasons")]
        getter error_reasons : Array(Types::EphemerisErrorReason)?

        # Reason that an ephemeris failed validation. Appears only when the status is INVALID .

        @[JSON::Field(key: "invalidReason")]
        getter invalid_reason : String?

        # A name that you can use to identify the ephemeris.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A priority score that determines which ephemeris to use when multiple ephemerides overlap. Higher
        # numbers take precedence. The default is 1. Must be 1 or greater.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The AWS Ground Station satellite ID associated with ephemeris.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        # The status of the ephemeris.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Supplied ephemeris data.

        @[JSON::Field(key: "suppliedData")]
        getter supplied_data : Types::EphemerisTypeDescription?

        # Tags assigned to an ephemeris.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_time : Time? = nil,
          @enabled : Bool? = nil,
          @ephemeris_id : String? = nil,
          @error_reasons : Array(Types::EphemerisErrorReason)? = nil,
          @invalid_reason : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @satellite_id : String? = nil,
          @status : String? = nil,
          @supplied_data : Types::EphemerisTypeDescription? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Dataflow details for the destination side.

      struct Destination
        include JSON::Serializable

        # Additional details for a Config , if type is dataflow endpoint or antenna demod decode.

        @[JSON::Field(key: "configDetails")]
        getter config_details : Types::ConfigDetails?

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String?

        # Region of a dataflow destination.

        @[JSON::Field(key: "dataflowDestinationRegion")]
        getter dataflow_destination_region : String?

        def initialize(
          @config_details : Types::ConfigDetails? = nil,
          @config_id : String? = nil,
          @config_type : String? = nil,
          @dataflow_destination_region : String? = nil
        )
        end
      end

      # Data for agent discovery.

      struct DiscoveryData
        include JSON::Serializable

        # List of capabilities to associate with agent.

        @[JSON::Field(key: "capabilityArns")]
        getter capability_arns : Array(String)

        # List of private IP addresses to associate with agent.

        @[JSON::Field(key: "privateIpAddresses")]
        getter private_ip_addresses : Array(String)

        # List of public IP addresses to associate with agent.

        @[JSON::Field(key: "publicIpAddresses")]
        getter public_ip_addresses : Array(String)

        def initialize(
          @capability_arns : Array(String),
          @private_ip_addresses : Array(String),
          @public_ip_addresses : Array(String)
        )
        end
      end

      # Definition for a downlink agent endpoint

      struct DownlinkAwsGroundStationAgentEndpoint
        include JSON::Serializable

        # Dataflow details for the downlink endpoint

        @[JSON::Field(key: "dataflowDetails")]
        getter dataflow_details : Types::DownlinkDataflowDetails

        # Downlink dataflow endpoint name

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @dataflow_details : Types::DownlinkDataflowDetails,
          @name : String
        )
        end
      end

      # Details for a downlink agent endpoint

      struct DownlinkAwsGroundStationAgentEndpointDetails
        include JSON::Serializable

        # Dataflow details for the downlink endpoint

        @[JSON::Field(key: "dataflowDetails")]
        getter dataflow_details : Types::DownlinkDataflowDetails

        # Downlink dataflow endpoint name

        @[JSON::Field(key: "name")]
        getter name : String

        # Status of the agent associated with the downlink dataflow endpoint

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String?

        # Health audit results for the downlink dataflow endpoint

        @[JSON::Field(key: "auditResults")]
        getter audit_results : String?

        def initialize(
          @dataflow_details : Types::DownlinkDataflowDetails,
          @name : String,
          @agent_status : String? = nil,
          @audit_results : String? = nil
        )
        end
      end

      # Connection details for Ground Station to Agent and Agent to customer

      struct DownlinkConnectionDetails
        include JSON::Serializable


        @[JSON::Field(key: "agentIpAndPortAddress")]
        getter agent_ip_and_port_address : Types::RangedConnectionDetails


        @[JSON::Field(key: "egressAddressAndPort")]
        getter egress_address_and_port : Types::ConnectionDetails

        def initialize(
          @agent_ip_and_port_address : Types::RangedConnectionDetails,
          @egress_address_and_port : Types::ConnectionDetails
        )
        end
      end

      # Dataflow details for a downlink endpoint

      struct DownlinkDataflowDetails
        include JSON::Serializable

        # Downlink connection details for customer to Agent and Agent to Ground Station

        @[JSON::Field(key: "agentConnectionDetails")]
        getter agent_connection_details : Types::DownlinkConnectionDetails?

        def initialize(
          @agent_connection_details : Types::DownlinkConnectionDetails? = nil
        )
        end
      end

      # Object that represents EIRP.

      struct Eirp
        include JSON::Serializable

        # Units of an EIRP.

        @[JSON::Field(key: "units")]
        getter units : String

        # Value of an EIRP. Valid values are between 20.0 to 50.0 dBW.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @units : String,
          @value : Float64
        )
        end
      end

      # Elevation angle of the satellite in the sky during a contact.

      struct Elevation
        include JSON::Serializable

        # Elevation angle units.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # Elevation angle value.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @unit : String,
          @value : Float64
        )
        end
      end

      # Information about the endpoint details.

      struct EndpointDetails
        include JSON::Serializable

        # An agent endpoint.

        @[JSON::Field(key: "awsGroundStationAgentEndpoint")]
        getter aws_ground_station_agent_endpoint : Types::AwsGroundStationAgentEndpoint?

        # Definition for a downlink agent endpoint

        @[JSON::Field(key: "downlinkAwsGroundStationAgentEndpoint")]
        getter downlink_aws_ground_station_agent_endpoint : Types::DownlinkAwsGroundStationAgentEndpointDetails?

        # A dataflow endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::DataflowEndpoint?

        # Health reasons for a dataflow endpoint. This field is ignored when calling
        # CreateDataflowEndpointGroup .

        @[JSON::Field(key: "healthReasons")]
        getter health_reasons : Array(String)?

        # A dataflow endpoint health status. This field is ignored when calling CreateDataflowEndpointGroup .

        @[JSON::Field(key: "healthStatus")]
        getter health_status : String?

        # Endpoint security details including a list of subnets, a list of security groups and a role to
        # connect streams to instances.

        @[JSON::Field(key: "securityDetails")]
        getter security_details : Types::SecurityDetails?

        # Definition for an uplink agent endpoint

        @[JSON::Field(key: "uplinkAwsGroundStationAgentEndpoint")]
        getter uplink_aws_ground_station_agent_endpoint : Types::UplinkAwsGroundStationAgentEndpointDetails?

        def initialize(
          @aws_ground_station_agent_endpoint : Types::AwsGroundStationAgentEndpoint? = nil,
          @downlink_aws_ground_station_agent_endpoint : Types::DownlinkAwsGroundStationAgentEndpointDetails? = nil,
          @endpoint : Types::DataflowEndpoint? = nil,
          @health_reasons : Array(String)? = nil,
          @health_status : String? = nil,
          @security_details : Types::SecurityDetails? = nil,
          @uplink_aws_ground_station_agent_endpoint : Types::UplinkAwsGroundStationAgentEndpointDetails? = nil
        )
        end
      end

      # Ephemeris data.

      struct EphemerisData
        include JSON::Serializable


        @[JSON::Field(key: "azEl")]
        getter az_el : Types::AzElEphemeris?


        @[JSON::Field(key: "oem")]
        getter oem : Types::OEMEphemeris?


        @[JSON::Field(key: "tle")]
        getter tle : Types::TLEEphemeris?

        def initialize(
          @az_el : Types::AzElEphemeris? = nil,
          @oem : Types::OEMEphemeris? = nil,
          @tle : Types::TLEEphemeris? = nil
        )
        end
      end

      # Description of ephemeris.

      struct EphemerisDescription
        include JSON::Serializable

        # Supplied ephemeris data.

        @[JSON::Field(key: "ephemerisData")]
        getter ephemeris_data : String?

        # Source Amazon S3 object used for the ephemeris.

        @[JSON::Field(key: "sourceS3Object")]
        getter source_s3_object : Types::S3Object?

        def initialize(
          @ephemeris_data : String? = nil,
          @source_s3_object : Types::S3Object? = nil
        )
        end
      end

      # Detailed error information for ephemeris validation failures. Provides an error code and descriptive
      # message to help diagnose and resolve validation issues.

      struct EphemerisErrorReason
        include JSON::Serializable

        # The error code identifying the type of validation failure. See the Troubleshooting Invalid
        # Ephemerides guide for error code details.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # A human-readable message describing the validation failure. Provides specific details about what
        # failed and may include suggestions for remediation.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @error_code : String,
          @error_message : String
        )
        end
      end

      # Filter for selecting contacts that use a specific ephemeris".

      struct EphemerisFilter
        include JSON::Serializable

        # Filter for AzElEphemeris .

        @[JSON::Field(key: "azEl")]
        getter az_el : Types::AzElEphemerisFilter?

        def initialize(
          @az_el : Types::AzElEphemerisFilter? = nil
        )
        end
      end


      struct EphemerisIdResponse
        include JSON::Serializable

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String?

        def initialize(
          @ephemeris_id : String? = nil
        )
        end
      end

      # Ephemeris item.

      struct EphemerisItem
        include JSON::Serializable

        # The time the ephemeris was uploaded in UTC.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Whether or not the ephemeris is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String?

        # The type of ephemeris.

        @[JSON::Field(key: "ephemerisType")]
        getter ephemeris_type : String?

        # A name that you can use to identify the ephemeris.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A priority score that determines which ephemeris to use when multiple ephemerides overlap. Higher
        # numbers take precedence. The default is 1. Must be 1 or greater.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Source Amazon S3 object used for the ephemeris.

        @[JSON::Field(key: "sourceS3Object")]
        getter source_s3_object : Types::S3Object?

        # The status of the ephemeris.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @enabled : Bool? = nil,
          @ephemeris_id : String? = nil,
          @ephemeris_type : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @source_s3_object : Types::S3Object? = nil,
          @status : String? = nil
        )
        end
      end

      # Metadata describing a particular ephemeris.

      struct EphemerisMetaData
        include JSON::Serializable

        # The EphemerisSource that generated a given ephemeris.

        @[JSON::Field(key: "source")]
        getter source : String

        # UUID of a customer-provided ephemeris. This field is not populated for default ephemerides from
        # Space Track.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String?

        # The epoch of a default, ephemeris from Space Track in UTC. This field is not populated for
        # customer-provided ephemerides.

        @[JSON::Field(key: "epoch")]
        getter epoch : Time?

        # A name string associated with the ephemeris. Used as a human-readable identifier for the ephemeris.
        # A name is only returned for customer-provider ephemerides that have a name associated.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @source : String,
          @ephemeris_id : String? = nil,
          @epoch : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Ephemeris data for a contact.

      struct EphemerisResponseData
        include JSON::Serializable

        # Type of ephemeris.

        @[JSON::Field(key: "ephemerisType")]
        getter ephemeris_type : String

        # Unique identifier of the ephemeris. Appears only for custom ephemerides.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String?

        def initialize(
          @ephemeris_type : String,
          @ephemeris_id : String? = nil
        )
        end
      end


      struct EphemerisTypeDescription
        include JSON::Serializable


        @[JSON::Field(key: "azEl")]
        getter az_el : Types::EphemerisDescription?


        @[JSON::Field(key: "oem")]
        getter oem : Types::EphemerisDescription?


        @[JSON::Field(key: "tle")]
        getter tle : Types::EphemerisDescription?

        def initialize(
          @az_el : Types::EphemerisDescription? = nil,
          @oem : Types::EphemerisDescription? = nil,
          @tle : Types::EphemerisDescription? = nil
        )
        end
      end

      # Object that describes the frequency.

      struct Frequency
        include JSON::Serializable

        # Frequency units.

        @[JSON::Field(key: "units")]
        getter units : String

        # Frequency value. Valid values are between 2200 to 2300 MHz and 7750 to 8400 MHz for downlink and
        # 2025 to 2120 MHz for uplink.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @units : String,
          @value : Float64
        )
        end
      end

      # Object that describes the frequency bandwidth.

      struct FrequencyBandwidth
        include JSON::Serializable

        # Frequency bandwidth units.

        @[JSON::Field(key: "units")]
        getter units : String

        # Frequency bandwidth value. AWS Ground Station currently has the following bandwidth limitations: For
        # AntennaDownlinkDemodDecodeconfig , valid values are between 125 kHz to 650 MHz. For
        # AntennaDownlinkconfig , valid values are between 10 kHz to 54 MHz. For AntennaUplinkConfig , valid
        # values are between 10 kHz to 54 MHz.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @units : String,
          @value : Float64
        )
        end
      end


      struct GetAgentConfigurationRequest
        include JSON::Serializable

        # UUID of agent to get configuration information for.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_id : String
        )
        end
      end


      struct GetAgentConfigurationResponse
        include JSON::Serializable

        # UUID of agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # Tasking document for agent.

        @[JSON::Field(key: "taskingDocument")]
        getter tasking_document : String?

        def initialize(
          @agent_id : String? = nil,
          @tasking_document : String? = nil
        )
        end
      end


      struct GetAgentTaskResponseUrlRequest
        include JSON::Serializable

        # UUID of agent requesting the response URL.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # GUID of the agent task for which the response URL is being requested.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @agent_id : String,
          @task_id : String
        )
        end
      end


      struct GetAgentTaskResponseUrlResponse
        include JSON::Serializable

        # UUID of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # Presigned URL for uploading agent task response logs.

        @[JSON::Field(key: "presignedLogUrl")]
        getter presigned_log_url : String

        # GUID of the agent task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @agent_id : String,
          @presigned_log_url : String,
          @task_id : String
        )
        end
      end


      struct GetConfigRequest
        include JSON::Serializable

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String

        def initialize(
          @config_id : String,
          @config_type : String
        )
        end
      end


      struct GetConfigResponse
        include JSON::Serializable

        # ARN of a Config

        @[JSON::Field(key: "configArn")]
        getter config_arn : String

        # Data elements in a Config .

        @[JSON::Field(key: "configData")]
        getter config_data : Types::ConfigTypeData

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String

        # Name of a Config .

        @[JSON::Field(key: "name")]
        getter name : String

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String?

        # Tags assigned to a Config .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @config_arn : String,
          @config_data : Types::ConfigTypeData,
          @config_id : String,
          @name : String,
          @config_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDataflowEndpointGroupRequest
        include JSON::Serializable

        # UUID of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String

        def initialize(
          @dataflow_endpoint_group_id : String
        )
        end
      end


      struct GetDataflowEndpointGroupResponse
        include JSON::Serializable

        # Amount of time, in seconds, after a contact ends that the Ground Station Dataflow Endpoint Group
        # will be in a POSTPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the POSTPASS state.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time, in seconds, before a contact starts that the Ground Station Dataflow Endpoint Group
        # will be in a PREPASS state. A Ground Station Dataflow Endpoint Group State Change event will be
        # emitted when the Dataflow Endpoint Group enters and exits the PREPASS state.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # ARN of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupArn")]
        getter dataflow_endpoint_group_arn : String?

        # UUID of a dataflow endpoint group.

        @[JSON::Field(key: "dataflowEndpointGroupId")]
        getter dataflow_endpoint_group_id : String?

        # Details of a dataflow endpoint.

        @[JSON::Field(key: "endpointsDetails")]
        getter endpoints_details : Array(Types::EndpointDetails)?

        # Tags assigned to a dataflow endpoint group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @dataflow_endpoint_group_arn : String? = nil,
          @dataflow_endpoint_group_id : String? = nil,
          @endpoints_details : Array(Types::EndpointDetails)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetMinuteUsageRequest
        include JSON::Serializable

        # The month being requested, with a value of 1-12.

        @[JSON::Field(key: "month")]
        getter month : Int32

        # The year being requested, in the format of YYYY.

        @[JSON::Field(key: "year")]
        getter year : Int32

        def initialize(
          @month : Int32,
          @year : Int32
        )
        end
      end


      struct GetMinuteUsageResponse
        include JSON::Serializable

        # Estimated number of minutes remaining for an account, specific to the month being requested.

        @[JSON::Field(key: "estimatedMinutesRemaining")]
        getter estimated_minutes_remaining : Int32?

        # Returns whether or not an account has signed up for the reserved minutes pricing plan, specific to
        # the month being requested.

        @[JSON::Field(key: "isReservedMinutesCustomer")]
        getter is_reserved_minutes_customer : Bool?

        # Total number of reserved minutes allocated, specific to the month being requested.

        @[JSON::Field(key: "totalReservedMinuteAllocation")]
        getter total_reserved_minute_allocation : Int32?

        # Total scheduled minutes for an account, specific to the month being requested.

        @[JSON::Field(key: "totalScheduledMinutes")]
        getter total_scheduled_minutes : Int32?

        # Upcoming minutes scheduled for an account, specific to the month being requested.

        @[JSON::Field(key: "upcomingMinutesScheduled")]
        getter upcoming_minutes_scheduled : Int32?

        def initialize(
          @estimated_minutes_remaining : Int32? = nil,
          @is_reserved_minutes_customer : Bool? = nil,
          @total_reserved_minute_allocation : Int32? = nil,
          @total_scheduled_minutes : Int32? = nil,
          @upcoming_minutes_scheduled : Int32? = nil
        )
        end
      end


      struct GetMissionProfileRequest
        include JSON::Serializable

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String

        def initialize(
          @mission_profile_id : String
        )
        end
      end


      struct GetMissionProfileResponse
        include JSON::Serializable

        # Amount of time after a contact ends that you’d like to receive a CloudWatch event indicating the
        # pass has finished.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time prior to contact start you’d like to receive a CloudWatch event indicating an
        # upcoming pass.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # A list of lists of ARNs. Each list of ARNs is an edge, with a from Config and a to Config .

        @[JSON::Field(key: "dataflowEdges")]
        getter dataflow_edges : Array(Array(String))?

        # Smallest amount of time in seconds that you’d like to see for an available contact. AWS Ground
        # Station will not present you with contacts shorter than this duration.

        @[JSON::Field(key: "minimumViableContactDurationSeconds")]
        getter minimum_viable_contact_duration_seconds : Int32?

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String?

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String?

        # Name of a mission profile.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Region of a mission profile.

        @[JSON::Field(key: "region")]
        getter region : String?

        # KMS key to use for encrypting streams.

        @[JSON::Field(key: "streamsKmsKey")]
        getter streams_kms_key : Types::KmsKey?

        # Role to use for encrypting streams with KMS key.

        @[JSON::Field(key: "streamsKmsRole")]
        getter streams_kms_role : String?

        # Tags assigned to a mission profile.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # ARN of a tracking Config .

        @[JSON::Field(key: "trackingConfigArn")]
        getter tracking_config_arn : String?

        def initialize(
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @dataflow_edges : Array(Array(String))? = nil,
          @minimum_viable_contact_duration_seconds : Int32? = nil,
          @mission_profile_arn : String? = nil,
          @mission_profile_id : String? = nil,
          @name : String? = nil,
          @region : String? = nil,
          @streams_kms_key : Types::KmsKey? = nil,
          @streams_kms_role : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tracking_config_arn : String? = nil
        )
        end
      end


      struct GetSatelliteRequest
        include JSON::Serializable

        # UUID of a satellite.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String

        def initialize(
          @satellite_id : String
        )
        end
      end


      struct GetSatelliteResponse
        include JSON::Serializable

        # The current ephemeris being used to compute the trajectory of the satellite.

        @[JSON::Field(key: "currentEphemeris")]
        getter current_ephemeris : Types::EphemerisMetaData?

        # A list of ground stations to which the satellite is on-boarded.

        @[JSON::Field(key: "groundStations")]
        getter ground_stations : Array(String)?

        # NORAD satellite ID number.

        @[JSON::Field(key: "noradSatelliteID")]
        getter norad_satellite_id : Int32?

        # ARN of a satellite.

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        # UUID of a satellite.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        def initialize(
          @current_ephemeris : Types::EphemerisMetaData? = nil,
          @ground_stations : Array(String)? = nil,
          @norad_satellite_id : Int32? = nil,
          @satellite_arn : String? = nil,
          @satellite_id : String? = nil
        )
        end
      end

      # Information about the ground station data.

      struct GroundStationData
        include JSON::Serializable

        # UUID of a ground station.

        @[JSON::Field(key: "groundStationId")]
        getter ground_station_id : String?

        # Name of a ground station.

        @[JSON::Field(key: "groundStationName")]
        getter ground_station_name : String?

        # Ground station Region.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @ground_station_id : String? = nil,
          @ground_station_name : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Time range specified using ISO 8601 format timestamps.

      struct ISO8601TimeRange
        include JSON::Serializable

        # End time in ISO 8601 format in Coordinated Universal Time (UTC). Example: 2024-01-15T12:00:00.000Z

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # Start time in ISO 8601 format in Coordinated Universal Time (UTC). Example: 2026-11-15T10:28:48.000Z

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # An integer range that has a minimum and maximum value.

      struct IntegerRange
        include JSON::Serializable

        # A maximum value.

        @[JSON::Field(key: "maximum")]
        getter maximum : Int32

        # A minimum value.

        @[JSON::Field(key: "minimum")]
        getter minimum : Int32

        def initialize(
          @maximum : Int32,
          @minimum : Int32
        )
        end
      end

      # One or more parameters are not valid.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String?

        def initialize(
          @message : String? = nil,
          @parameter_name : String? = nil
        )
        end
      end

      # KMS key info.

      struct KmsKey
        include JSON::Serializable

        # KMS Alias Arn.

        @[JSON::Field(key: "kmsAliasArn")]
        getter kms_alias_arn : String?

        # KMS Alias Name.

        @[JSON::Field(key: "kmsAliasName")]
        getter kms_alias_name : String?

        # KMS Key Arn.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @kms_alias_arn : String? = nil,
          @kms_alias_name : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct ListConfigsRequest
        include JSON::Serializable

        # Maximum number of Configs returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the request of a previous ListConfigs call. Used to get the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigsResponse
        include JSON::Serializable

        # List of Config items.

        @[JSON::Field(key: "configList")]
        getter config_list : Array(Types::ConfigListItem)?

        # Next token returned in the response of a previous ListConfigs call. Used to get the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @config_list : Array(Types::ConfigListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContactsRequest
        include JSON::Serializable

        # End time of a contact in UTC.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # Start time of a contact in UTC.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Status of a contact reservation.

        @[JSON::Field(key: "statusList")]
        getter status_list : Array(String)

        # Filter for selecting contacts that use a specific ephemeris".

        @[JSON::Field(key: "ephemeris")]
        getter ephemeris : Types::EphemerisFilter?

        # Name of a ground station.

        @[JSON::Field(key: "groundStation")]
        getter ground_station : String?

        # Maximum number of contacts returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String?

        # Next token returned in the request of a previous ListContacts call. Used to get the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # ARN of a satellite.

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @status_list : Array(String),
          @ephemeris : Types::EphemerisFilter? = nil,
          @ground_station : String? = nil,
          @max_results : Int32? = nil,
          @mission_profile_arn : String? = nil,
          @next_token : String? = nil,
          @satellite_arn : String? = nil
        )
        end
      end


      struct ListContactsResponse
        include JSON::Serializable

        # List of contacts.

        @[JSON::Field(key: "contactList")]
        getter contact_list : Array(Types::ContactData)?

        # Next token returned in the response of a previous ListContacts call. Used to get the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @contact_list : Array(Types::ContactData)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataflowEndpointGroupsRequest
        include JSON::Serializable

        # Maximum number of dataflow endpoint groups returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the request of a previous ListDataflowEndpointGroups call. Used to get the
        # next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataflowEndpointGroupsResponse
        include JSON::Serializable

        # A list of dataflow endpoint groups.

        @[JSON::Field(key: "dataflowEndpointGroupList")]
        getter dataflow_endpoint_group_list : Array(Types::DataflowEndpointListItem)?

        # Next token returned in the response of a previous ListDataflowEndpointGroups call. Used to get the
        # next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataflow_endpoint_group_list : Array(Types::DataflowEndpointListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEphemeridesRequest
        include JSON::Serializable

        # The end time for the list operation in UTC. Returns ephemerides with expiration times within your
        # specified time range.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The start time for the list operation in UTC. Returns ephemerides with expiration times within your
        # specified time range.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Filter ephemerides by type. If not specified, all ephemeris types will be returned.

        @[JSON::Field(key: "ephemerisType")]
        getter ephemeris_type : String?

        # Maximum number of ephemerides to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The AWS Ground Station satellite ID to list ephemeris for.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        # The list of ephemeris status to return.

        @[JSON::Field(key: "statusList")]
        getter status_list : Array(String)?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @ephemeris_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @satellite_id : String? = nil,
          @status_list : Array(String)? = nil
        )
        end
      end


      struct ListEphemeridesResponse
        include JSON::Serializable

        # List of ephemerides.

        @[JSON::Field(key: "ephemerides")]
        getter ephemerides : Array(Types::EphemerisItem)?

        # Pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ephemerides : Array(Types::EphemerisItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroundStationsRequest
        include JSON::Serializable

        # Maximum number of ground stations returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token that can be supplied in the next call to get the next page of ground stations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Satellite ID to retrieve on-boarded ground stations.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @satellite_id : String? = nil
        )
        end
      end


      struct ListGroundStationsResponse
        include JSON::Serializable

        # List of ground stations.

        @[JSON::Field(key: "groundStationList")]
        getter ground_station_list : Array(Types::GroundStationData)?

        # Next token that can be supplied in the next call to get the next page of ground stations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ground_station_list : Array(Types::GroundStationData)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMissionProfilesRequest
        include JSON::Serializable

        # Maximum number of mission profiles returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the request of a previous ListMissionProfiles call. Used to get the next page
        # of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMissionProfilesResponse
        include JSON::Serializable

        # List of mission profiles.

        @[JSON::Field(key: "missionProfileList")]
        getter mission_profile_list : Array(Types::MissionProfileListItem)?

        # Next token returned in the response of a previous ListMissionProfiles call. Used to get the next
        # page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mission_profile_list : Array(Types::MissionProfileListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSatellitesRequest
        include JSON::Serializable

        # Maximum number of satellites returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token that can be supplied in the next call to get the next page of satellites.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSatellitesResponse
        include JSON::Serializable

        # Next token that can be supplied in the next call to get the next page of satellites.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of satellites.

        @[JSON::Field(key: "satellites")]
        getter satellites : Array(Types::SatelliteListItem)?

        def initialize(
          @next_token : String? = nil,
          @satellites : Array(Types::SatelliteListItem)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # ARN of a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags assigned to a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct MissionProfileIdResponse
        include JSON::Serializable

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String?

        def initialize(
          @mission_profile_id : String? = nil
        )
        end
      end

      # Item in a list of mission profiles.

      struct MissionProfileListItem
        include JSON::Serializable

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String?

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String?

        # Name of a mission profile.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Region of a mission profile.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @mission_profile_arn : String? = nil,
          @mission_profile_id : String? = nil,
          @name : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Ephemeris data in Orbit Ephemeris Message (OEM) format. AWS Ground Station processes OEM ephemerides
      # according to the CCSDS standard with some extra restrictions. OEM files should be in KVN format. For
      # more detail about the OEM format that AWS Ground Station supports, see OEM ephemeris format in the
      # AWS Ground Station user guide.

      struct OEMEphemeris
        include JSON::Serializable

        # OEM data that you provide directly instead of using an Amazon S3 object.

        @[JSON::Field(key: "oemData")]
        getter oem_data : String?

        # The Amazon S3 object that contains the ephemeris data.

        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @oem_data : String? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Program track settings for an antenna during a contact.

      struct ProgramTrackSettings
        include JSON::Serializable

        # Program track settings for AzElEphemeris .

        @[JSON::Field(key: "azEl")]
        getter az_el : Types::AzElProgramTrackSettings?

        def initialize(
          @az_el : Types::AzElProgramTrackSettings? = nil
        )
        end
      end

      # Ingress address of AgentEndpoint with a port range and an optional mtu.

      struct RangedConnectionDetails
        include JSON::Serializable

        # A ranged socket address.

        @[JSON::Field(key: "socketAddress")]
        getter socket_address : Types::RangedSocketAddress

        # Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        def initialize(
          @socket_address : Types::RangedSocketAddress,
          @mtu : Int32? = nil
        )
        end
      end

      # A socket address with a port range.

      struct RangedSocketAddress
        include JSON::Serializable

        # IPv4 socket address.

        @[JSON::Field(key: "name")]
        getter name : String

        # Port range of a socket address.

        @[JSON::Field(key: "portRange")]
        getter port_range : Types::IntegerRange

        def initialize(
          @name : String,
          @port_range : Types::IntegerRange
        )
        end
      end


      struct RegisterAgentRequest
        include JSON::Serializable

        # Detailed information about the agent being registered.

        @[JSON::Field(key: "agentDetails")]
        getter agent_details : Types::AgentDetails

        # Data for associating an agent with the capabilities it is managing.

        @[JSON::Field(key: "discoveryData")]
        getter discovery_data : Types::DiscoveryData

        # Tags assigned to an Agent .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_details : Types::AgentDetails,
          @discovery_data : Types::DiscoveryData,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterAgentResponse
        include JSON::Serializable

        # UUID of registered agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        def initialize(
          @agent_id : String? = nil
        )
        end
      end


      struct ReserveContactRequest
        include JSON::Serializable

        # End time of a contact in UTC.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # Name of a ground station.

        @[JSON::Field(key: "groundStation")]
        getter ground_station : String

        # ARN of a mission profile.

        @[JSON::Field(key: "missionProfileArn")]
        getter mission_profile_arn : String

        # Start time of a contact in UTC.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # ARN of a satellite

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        # Tags assigned to a contact.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Tracking configuration overrides for the contact.

        @[JSON::Field(key: "trackingOverrides")]
        getter tracking_overrides : Types::TrackingOverrides?

        def initialize(
          @end_time : Time,
          @ground_station : String,
          @mission_profile_arn : String,
          @start_time : Time,
          @satellite_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tracking_overrides : Types::TrackingOverrides? = nil
        )
        end
      end

      # The specified resource is in use by non-terminal state contacts and cannot be modified or deleted.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Account limits for this resource have been exceeded.

      struct ResourceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String?

        def initialize(
          @message : String? = nil,
          @parameter_name : String? = nil
        )
        end
      end

      # Resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Object stored in Amazon S3 containing ephemeris data.

      struct S3Object
        include JSON::Serializable

        # An Amazon S3 Bucket name.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # An Amazon S3 key for the ephemeris.

        @[JSON::Field(key: "key")]
        getter key : String?

        # For versioned Amazon S3 objects, the version to use for the ephemeris.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Information about an S3 recording Config .

      struct S3RecordingConfig
        include JSON::Serializable

        # ARN of the bucket to record to.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String

        # ARN of the role Ground Station assumes to write data to the bucket.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # S3 Key prefix to prefice data files.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_arn : String,
          @role_arn : String,
          @prefix : String? = nil
        )
        end
      end

      # Details about an S3 recording Config used in a contact.

      struct S3RecordingDetails
        include JSON::Serializable

        # ARN of the bucket used.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String?

        # Key template used for the S3 Recording Configuration

        @[JSON::Field(key: "keyTemplate")]
        getter key_template : String?

        def initialize(
          @bucket_arn : String? = nil,
          @key_template : String? = nil
        )
        end
      end

      # Item in a list of satellites.

      struct SatelliteListItem
        include JSON::Serializable

        # The current ephemeris being used to compute the trajectory of the satellite.

        @[JSON::Field(key: "currentEphemeris")]
        getter current_ephemeris : Types::EphemerisMetaData?

        # A list of ground stations to which the satellite is on-boarded.

        @[JSON::Field(key: "groundStations")]
        getter ground_stations : Array(String)?

        # NORAD satellite ID number.

        @[JSON::Field(key: "noradSatelliteID")]
        getter norad_satellite_id : Int32?

        # ARN of a satellite.

        @[JSON::Field(key: "satelliteArn")]
        getter satellite_arn : String?

        # UUID of a satellite.

        @[JSON::Field(key: "satelliteId")]
        getter satellite_id : String?

        def initialize(
          @current_ephemeris : Types::EphemerisMetaData? = nil,
          @ground_stations : Array(String)? = nil,
          @norad_satellite_id : Int32? = nil,
          @satellite_arn : String? = nil,
          @satellite_id : String? = nil
        )
        end
      end

      # Information about endpoints.

      struct SecurityDetails
        include JSON::Serializable

        # ARN to a role needed for connecting streams to your instances.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The security groups to attach to the elastic network interfaces.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # A list of subnets where AWS Ground Station places elastic network interfaces to send streams to your
        # instances.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @role_arn : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # Parameter name that caused the exception

        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String?

        def initialize(
          @message : String? = nil,
          @parameter_name : String? = nil
        )
        end
      end

      # Information about the socket address.

      struct SocketAddress
        include JSON::Serializable

        # Name of a socket address.

        @[JSON::Field(key: "name")]
        getter name : String

        # Port of a socket address.

        @[JSON::Field(key: "port")]
        getter port : Int32

        def initialize(
          @name : String,
          @port : Int32
        )
        end
      end

      # Dataflow details for the source side.

      struct Source
        include JSON::Serializable

        # Additional details for a Config , if type is dataflow-endpoint or antenna-downlink-demod-decode

        @[JSON::Field(key: "configDetails")]
        getter config_details : Types::ConfigDetails?

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String?

        # Region of a dataflow source.

        @[JSON::Field(key: "dataflowSourceRegion")]
        getter dataflow_source_region : String?

        def initialize(
          @config_details : Types::ConfigDetails? = nil,
          @config_id : String? = nil,
          @config_type : String? = nil,
          @dataflow_source_region : String? = nil
        )
        end
      end

      # Object that describes a spectral Config .

      struct SpectrumConfig
        include JSON::Serializable

        # Bandwidth of a spectral Config . AWS Ground Station currently has the following bandwidth
        # limitations: For AntennaDownlinkDemodDecodeconfig , valid values are between 125 kHz to 650 MHz. For
        # AntennaDownlinkconfig valid values are between 10 kHz to 54 MHz. For AntennaUplinkConfig , valid
        # values are between 10 kHz to 54 MHz.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : Types::FrequencyBandwidth

        # Center frequency of a spectral Config . Valid values are between 2200 to 2300 MHz and 7750 to 8400
        # MHz for downlink and 2025 to 2120 MHz for uplink.

        @[JSON::Field(key: "centerFrequency")]
        getter center_frequency : Types::Frequency

        # Polarization of a spectral Config . Capturing both "RIGHT_HAND" and "LEFT_HAND" polarization
        # requires two separate configs.

        @[JSON::Field(key: "polarization")]
        getter polarization : String?

        def initialize(
          @bandwidth : Types::FrequencyBandwidth,
          @center_frequency : Types::Frequency,
          @polarization : String? = nil
        )
        end
      end

      # Two-line element set (TLE) data.

      struct TLEData
        include JSON::Serializable

        # First line of two-line element set (TLE) data.

        @[JSON::Field(key: "tleLine1")]
        getter tle_line1 : String

        # Second line of two-line element set (TLE) data.

        @[JSON::Field(key: "tleLine2")]
        getter tle_line2 : String

        # The valid time range for the TLE. Time ranges must be continuous without gaps or overlaps.

        @[JSON::Field(key: "validTimeRange")]
        getter valid_time_range : Types::TimeRange

        def initialize(
          @tle_line1 : String,
          @tle_line2 : String,
          @valid_time_range : Types::TimeRange
        )
        end
      end

      # Two-line element set (TLE) ephemeris. For more detail about providing Two-line element sets to AWS
      # Ground Station, see the TLE section of the AWS Ground Station user guide.

      struct TLEEphemeris
        include JSON::Serializable

        # The Amazon S3 object that contains the ephemeris data.

        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object?

        # TLE data that you provide directly instead of using an Amazon S3 object.

        @[JSON::Field(key: "tleData")]
        getter tle_data : Array(Types::TLEData)?

        def initialize(
          @s3_object : Types::S3Object? = nil,
          @tle_data : Array(Types::TLEData)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # ARN of a resource tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tags assigned to a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Time-tagged azimuth elevation pointing data. Specifies the antenna pointing direction at a specific
      # time offset from the segment's reference epoch.

      struct TimeAzEl
        include JSON::Serializable

        # Azimuth angle at the specified time. Valid ranges by unit: DEGREE_ANGLE : -180 to 360 degrees,
        # measured clockwise from true north RADIAN : -π to 2π radians, measured clockwise from true north

        @[JSON::Field(key: "az")]
        getter az : Float64

        # Time offset in atomic seconds from the segment's reference epoch. All dt values within a segment
        # must be in ascending order with no duplicates. dt values may be: negative expressed as fractions of
        # a second expressed in scientific notation

        @[JSON::Field(key: "dt")]
        getter dt : Float64

        # Elevation angle at the specified time. Valid ranges by unit: DEGREE_ANGLE : -90 to 90 degrees, where
        # 0 is the horizon, 90 is zenith, and negative values are below the horizon RADIAN : -π/2 to π/2
        # radians, where 0 is the horizon, π/2 is zenith, and negative values are below the horizon

        @[JSON::Field(key: "el")]
        getter el : Float64

        def initialize(
          @az : Float64,
          @dt : Float64,
          @el : Float64
        )
        end
      end

      # A time range with a start and end time.

      struct TimeRange
        include JSON::Serializable

        # Unix epoch timestamp in UTC at which the time range ends.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # Unix epoch timestamp in UTC at which the time range starts.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # Object that determines whether tracking should be used during a contact executed with this Config in
      # the mission profile.

      struct TrackingConfig
        include JSON::Serializable

        # Current setting for autotrack.

        @[JSON::Field(key: "autotrack")]
        getter autotrack : String

        def initialize(
          @autotrack : String
        )
        end
      end

      # Overrides the default tracking configuration on an antenna during a contact.

      struct TrackingOverrides
        include JSON::Serializable

        # Program track settings to override for antenna tracking during the contact.

        @[JSON::Field(key: "programTrackSettings")]
        getter program_track_settings : Types::ProgramTrackSettings

        def initialize(
          @program_track_settings : Types::ProgramTrackSettings
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # ARN of a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Keys of a resource tag.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAgentStatusRequest
        include JSON::Serializable

        # UUID of agent to update.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # Aggregate status for agent.

        @[JSON::Field(key: "aggregateStatus")]
        getter aggregate_status : Types::AggregateStatus

        # List of component statuses for agent.

        @[JSON::Field(key: "componentStatuses")]
        getter component_statuses : Array(Types::ComponentStatusData)

        # GUID of agent task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @agent_id : String,
          @aggregate_status : Types::AggregateStatus,
          @component_statuses : Array(Types::ComponentStatusData),
          @task_id : String
        )
        end
      end


      struct UpdateAgentStatusResponse
        include JSON::Serializable

        # UUID of updated agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_id : String
        )
        end
      end


      struct UpdateConfigRequest
        include JSON::Serializable

        # Parameters of a Config .

        @[JSON::Field(key: "configData")]
        getter config_data : Types::ConfigTypeData

        # UUID of a Config .

        @[JSON::Field(key: "configId")]
        getter config_id : String

        # Type of a Config .

        @[JSON::Field(key: "configType")]
        getter config_type : String

        # Name of a Config .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @config_data : Types::ConfigTypeData,
          @config_id : String,
          @config_type : String,
          @name : String
        )
        end
      end


      struct UpdateEphemerisRequest
        include JSON::Serializable

        # Enable or disable the ephemeris. Changing this value doesn't require re-validation.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The AWS Ground Station ephemeris ID.

        @[JSON::Field(key: "ephemerisId")]
        getter ephemeris_id : String

        # A name that you can use to identify the ephemeris.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A priority score that determines which ephemeris to use when multiple ephemerides overlap. Higher
        # numbers take precedence. The default is 1. Must be 1 or greater.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @enabled : Bool,
          @ephemeris_id : String,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end


      struct UpdateMissionProfileRequest
        include JSON::Serializable

        # UUID of a mission profile.

        @[JSON::Field(key: "missionProfileId")]
        getter mission_profile_id : String

        # Amount of time after a contact ends that you’d like to receive a Ground Station Contact State Change
        # event indicating the pass has finished.

        @[JSON::Field(key: "contactPostPassDurationSeconds")]
        getter contact_post_pass_duration_seconds : Int32?

        # Amount of time after a contact ends that you’d like to receive a Ground Station Contact State Change
        # event indicating the pass has finished.

        @[JSON::Field(key: "contactPrePassDurationSeconds")]
        getter contact_pre_pass_duration_seconds : Int32?

        # A list of lists of ARNs. Each list of ARNs is an edge, with a from Config and a to Config .

        @[JSON::Field(key: "dataflowEdges")]
        getter dataflow_edges : Array(Array(String))?

        # Smallest amount of time in seconds that you’d like to see for an available contact. AWS Ground
        # Station will not present you with contacts shorter than this duration.

        @[JSON::Field(key: "minimumViableContactDurationSeconds")]
        getter minimum_viable_contact_duration_seconds : Int32?

        # Name of a mission profile.

        @[JSON::Field(key: "name")]
        getter name : String?

        # KMS key to use for encrypting streams.

        @[JSON::Field(key: "streamsKmsKey")]
        getter streams_kms_key : Types::KmsKey?

        # Role to use for encrypting streams with KMS key.

        @[JSON::Field(key: "streamsKmsRole")]
        getter streams_kms_role : String?

        # ARN of a tracking Config .

        @[JSON::Field(key: "trackingConfigArn")]
        getter tracking_config_arn : String?

        def initialize(
          @mission_profile_id : String,
          @contact_post_pass_duration_seconds : Int32? = nil,
          @contact_pre_pass_duration_seconds : Int32? = nil,
          @dataflow_edges : Array(Array(String))? = nil,
          @minimum_viable_contact_duration_seconds : Int32? = nil,
          @name : String? = nil,
          @streams_kms_key : Types::KmsKey? = nil,
          @streams_kms_role : String? = nil,
          @tracking_config_arn : String? = nil
        )
        end
      end

      # Definition for an uplink agent endpoint

      struct UplinkAwsGroundStationAgentEndpoint
        include JSON::Serializable

        # Dataflow details for the uplink endpoint

        @[JSON::Field(key: "dataflowDetails")]
        getter dataflow_details : Types::UplinkDataflowDetails

        # Uplink dataflow endpoint name

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @dataflow_details : Types::UplinkDataflowDetails,
          @name : String
        )
        end
      end

      # Details for an uplink agent endpoint

      struct UplinkAwsGroundStationAgentEndpointDetails
        include JSON::Serializable

        # Dataflow details for the uplink endpoint

        @[JSON::Field(key: "dataflowDetails")]
        getter dataflow_details : Types::UplinkDataflowDetails

        # Uplink dataflow endpoint name

        @[JSON::Field(key: "name")]
        getter name : String

        # Status of the agent associated with the uplink dataflow endpoint

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String?

        # Health audit results for the uplink dataflow endpoint

        @[JSON::Field(key: "auditResults")]
        getter audit_results : String?

        def initialize(
          @dataflow_details : Types::UplinkDataflowDetails,
          @name : String,
          @agent_status : String? = nil,
          @audit_results : String? = nil
        )
        end
      end

      # Connection details for customer to Agent and Agent to Ground Station

      struct UplinkConnectionDetails
        include JSON::Serializable


        @[JSON::Field(key: "agentIpAndPortAddress")]
        getter agent_ip_and_port_address : Types::RangedConnectionDetails


        @[JSON::Field(key: "ingressAddressAndPort")]
        getter ingress_address_and_port : Types::ConnectionDetails

        def initialize(
          @agent_ip_and_port_address : Types::RangedConnectionDetails,
          @ingress_address_and_port : Types::ConnectionDetails
        )
        end
      end

      # Dataflow details for an uplink endpoint

      struct UplinkDataflowDetails
        include JSON::Serializable

        # Uplink connection details for customer to Agent and Agent to Ground Station

        @[JSON::Field(key: "agentConnectionDetails")]
        getter agent_connection_details : Types::UplinkConnectionDetails?

        def initialize(
          @agent_connection_details : Types::UplinkConnectionDetails? = nil
        )
        end
      end

      # Information about an uplink echo Config . Parameters from the AntennaUplinkConfig , corresponding to
      # the specified AntennaUplinkConfigArn , are used when this UplinkEchoConfig is used in a contact.

      struct UplinkEchoConfig
        include JSON::Serializable

        # ARN of an uplink Config .

        @[JSON::Field(key: "antennaUplinkConfigArn")]
        getter antenna_uplink_config_arn : String

        # Whether or not an uplink Config is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @antenna_uplink_config_arn : String,
          @enabled : Bool
        )
        end
      end

      # Information about the uplink spectral Config .

      struct UplinkSpectrumConfig
        include JSON::Serializable

        # Center frequency of an uplink spectral Config . Valid values are between 2025 to 2120 MHz.

        @[JSON::Field(key: "centerFrequency")]
        getter center_frequency : Types::Frequency

        # Polarization of an uplink spectral Config . Capturing both "RIGHT_HAND" and "LEFT_HAND" polarization
        # requires two separate configs.

        @[JSON::Field(key: "polarization")]
        getter polarization : String?

        def initialize(
          @center_frequency : Types::Frequency,
          @polarization : String? = nil
        )
        end
      end
    end
  end
end
