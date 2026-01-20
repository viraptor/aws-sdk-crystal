require "json"
require "time"

module Aws
  module IoTWireless
    module Types

      # ABP device object for LoRaWAN specification v1.0.x

      struct AbpV1_0_x
        include JSON::Serializable

        # The DevAddr value.

        @[JSON::Field(key: "DevAddr")]
        getter dev_addr : String?

        # The FCnt init value.

        @[JSON::Field(key: "FCntStart")]
        getter f_cnt_start : Int32?

        # Session keys for ABP v1.0.x

        @[JSON::Field(key: "SessionKeys")]
        getter session_keys : Types::SessionKeysAbpV1_0_x?

        def initialize(
          @dev_addr : String? = nil,
          @f_cnt_start : Int32? = nil,
          @session_keys : Types::SessionKeysAbpV1_0_x? = nil
        )
        end
      end

      # ABP device object for LoRaWAN specification v1.1

      struct AbpV1_1
        include JSON::Serializable

        # The DevAddr value.

        @[JSON::Field(key: "DevAddr")]
        getter dev_addr : String?

        # The FCnt init value.

        @[JSON::Field(key: "FCntStart")]
        getter f_cnt_start : Int32?

        # Session keys for ABP v1.1

        @[JSON::Field(key: "SessionKeys")]
        getter session_keys : Types::SessionKeysAbpV1_1?

        def initialize(
          @dev_addr : String? = nil,
          @f_cnt_start : Int32? = nil,
          @session_keys : Types::SessionKeysAbpV1_1? = nil
        )
        end
      end

      # User does not have permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The accuracy of the estimated position in meters. An empty value indicates that no position data is
      # available. A value of ‘0.0’ value indicates that position data is available. This data corresponds
      # to the position information that you specified instead of the position computed by solver.

      struct Accuracy
        include JSON::Serializable

        # The horizontal accuracy of the estimated position, which is the difference between the estimated
        # location and the actual device location.

        @[JSON::Field(key: "HorizontalAccuracy")]
        getter horizontal_accuracy : Float64?

        # The vertical accuracy of the estimated position, which is the difference between the estimated
        # altitude and actual device latitude in meters.

        @[JSON::Field(key: "VerticalAccuracy")]
        getter vertical_accuracy : Float64?

        def initialize(
          @horizontal_accuracy : Float64? = nil,
          @vertical_accuracy : Float64? = nil
        )
        end
      end

      # LoRaWAN application configuration, which can be used to perform geolocation.

      struct ApplicationConfig
        include JSON::Serializable

        # The name of the position data destination that describes the AWS IoT rule that processes the
        # device's position data for use by AWS IoT Core for LoRaWAN.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?


        @[JSON::Field(key: "FPort")]
        getter f_port : Int32?

        # Application type, which can be specified to obtain real-time position information of your LoRaWAN
        # device.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @destination_name : String? = nil,
          @f_port : Int32? = nil,
          @type : String? = nil
        )
        end
      end


      struct AssociateAwsAccountWithPartnerAccountRequest
        include JSON::Serializable

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkAccountInfo

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The tags to attach to the specified resource. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sidewalk : Types::SidewalkAccountInfo,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct AssociateAwsAccountWithPartnerAccountResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkAccountInfo?

        def initialize(
          @arn : String? = nil,
          @sidewalk : Types::SidewalkAccountInfo? = nil
        )
        end
      end


      struct AssociateMulticastGroupWithFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "MulticastGroupId")]
        getter multicast_group_id : String

        def initialize(
          @id : String,
          @multicast_group_id : String
        )
        end
      end


      struct AssociateMulticastGroupWithFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateWirelessDeviceWithFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "WirelessDeviceId")]
        getter wireless_device_id : String

        def initialize(
          @id : String,
          @wireless_device_id : String
        )
        end
      end


      struct AssociateWirelessDeviceWithFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateWirelessDeviceWithMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "WirelessDeviceId")]
        getter wireless_device_id : String

        def initialize(
          @id : String,
          @wireless_device_id : String
        )
        end
      end


      struct AssociateWirelessDeviceWithMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateWirelessDeviceWithThingRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ARN of the thing to associate with the wireless device.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String

        def initialize(
          @id : String,
          @thing_arn : String
        )
        end
      end


      struct AssociateWirelessDeviceWithThingResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateWirelessGatewayWithCertificateRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ID of the certificate to associate with the wireless gateway.

        @[JSON::Field(key: "IotCertificateId")]
        getter iot_certificate_id : String

        def initialize(
          @id : String,
          @iot_certificate_id : String
        )
        end
      end


      struct AssociateWirelessGatewayWithCertificateResponse
        include JSON::Serializable

        # The ID of the certificate associated with the wireless gateway.

        @[JSON::Field(key: "IotCertificateId")]
        getter iot_certificate_id : String?

        def initialize(
          @iot_certificate_id : String? = nil
        )
        end
      end


      struct AssociateWirelessGatewayWithThingRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ARN of the thing to associate with the wireless gateway.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String

        def initialize(
          @id : String,
          @thing_arn : String
        )
        end
      end


      struct AssociateWirelessGatewayWithThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Beaconing parameters for configuring the wireless gateways.

      struct Beaconing
        include JSON::Serializable

        # The data rate for gateways that are sending the beacons.

        @[JSON::Field(key: "DataRate")]
        getter data_rate : Int32?

        # The frequency list for the gateways to send the beacons.

        @[JSON::Field(key: "Frequencies")]
        getter frequencies : Array(Int32)?

        def initialize(
          @data_rate : Int32? = nil,
          @frequencies : Array(Int32)? = nil
        )
        end
      end


      struct CancelMulticastGroupSessionRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct CancelMulticastGroupSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # CDMA local ID information, which corresponds to the local identification parameters of a CDMA cell.

      struct CdmaLocalId
        include JSON::Serializable

        # CDMA channel information.

        @[JSON::Field(key: "CdmaChannel")]
        getter cdma_channel : Int32

        # Pseudo-noise offset, which is a characteristic of the signal from a cell on a radio tower.

        @[JSON::Field(key: "PnOffset")]
        getter pn_offset : Int32

        def initialize(
          @cdma_channel : Int32,
          @pn_offset : Int32
        )
        end
      end

      # CDMA object for network measurement reports.

      struct CdmaNmrObj
        include JSON::Serializable

        # CDMA channel information.

        @[JSON::Field(key: "CdmaChannel")]
        getter cdma_channel : Int32

        # Pseudo-noise offset, which is a characteristic of the signal from a cell on a radio tower.

        @[JSON::Field(key: "PnOffset")]
        getter pn_offset : Int32

        # CDMA base station ID (BSID).

        @[JSON::Field(key: "BaseStationId")]
        getter base_station_id : Int32?

        # Transmit power level of the pilot signal, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "PilotPower")]
        getter pilot_power : Int32?

        def initialize(
          @cdma_channel : Int32,
          @pn_offset : Int32,
          @base_station_id : Int32? = nil,
          @pilot_power : Int32? = nil
        )
        end
      end

      # CDMA (Code-division multiple access) object.

      struct CdmaObj
        include JSON::Serializable

        # CDMA base station ID (BSID).

        @[JSON::Field(key: "BaseStationId")]
        getter base_station_id : Int32

        # CDMA network ID (NID).

        @[JSON::Field(key: "NetworkId")]
        getter network_id : Int32

        # CDMA system ID (SID).

        @[JSON::Field(key: "SystemId")]
        getter system_id : Int32

        # CDMA base station latitude in degrees.

        @[JSON::Field(key: "BaseLat")]
        getter base_lat : Float64?

        # CDMA base station longitude in degrees.

        @[JSON::Field(key: "BaseLng")]
        getter base_lng : Float64?

        # CDMA local identification (local ID) parameters.

        @[JSON::Field(key: "CdmaLocalId")]
        getter cdma_local_id : Types::CdmaLocalId?

        # CDMA network measurement reports.

        @[JSON::Field(key: "CdmaNmr")]
        getter cdma_nmr : Array(Types::CdmaNmrObj)?

        # Transmit power level of the pilot signal, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "PilotPower")]
        getter pilot_power : Int32?

        # CDMA registration zone (RZ).

        @[JSON::Field(key: "RegistrationZone")]
        getter registration_zone : Int32?

        def initialize(
          @base_station_id : Int32,
          @network_id : Int32,
          @system_id : Int32,
          @base_lat : Float64? = nil,
          @base_lng : Float64? = nil,
          @cdma_local_id : Types::CdmaLocalId? = nil,
          @cdma_nmr : Array(Types::CdmaNmrObj)? = nil,
          @pilot_power : Int32? = nil,
          @registration_zone : Int32? = nil
        )
        end
      end

      # The cell towers that were used to perform the measurements.

      struct CellTowers
        include JSON::Serializable

        # CDMA object information.

        @[JSON::Field(key: "Cdma")]
        getter cdma : Array(Types::CdmaObj)?

        # GSM object information.

        @[JSON::Field(key: "Gsm")]
        getter gsm : Array(Types::GsmObj)?

        # LTE object information.

        @[JSON::Field(key: "Lte")]
        getter lte : Array(Types::LteObj)?

        # TD-SCDMA object information.

        @[JSON::Field(key: "Tdscdma")]
        getter tdscdma : Array(Types::TdscdmaObj)?

        # WCDMA object information.

        @[JSON::Field(key: "Wcdma")]
        getter wcdma : Array(Types::WcdmaObj)?

        def initialize(
          @cdma : Array(Types::CdmaObj)? = nil,
          @gsm : Array(Types::GsmObj)? = nil,
          @lte : Array(Types::LteObj)? = nil,
          @tdscdma : Array(Types::TdscdmaObj)? = nil,
          @wcdma : Array(Types::WcdmaObj)? = nil
        )
        end
      end

      # List of sidewalk certificates.

      struct CertificateList
        include JSON::Serializable

        # The certificate chain algorithm provided by sidewalk.

        @[JSON::Field(key: "SigningAlg")]
        getter signing_alg : String

        # The value of the chosen sidewalk certificate.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @signing_alg : String,
          @value : String
        )
        end
      end

      # Adding, updating, or deleting the resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Id of the resource in the conflicting operation.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Type of the resource in the conflicting operation.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Connection status event configuration object for enabling or disabling topic.

      struct ConnectionStatusEventConfiguration
        include JSON::Serializable

        # Connection status event configuration object for enabling or disabling LoRaWAN related event topics.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANConnectionStatusEventNotificationConfigurations?

        # Denotes whether the wireless gateway ID connection status event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessGatewayIdEventTopic")]
        getter wireless_gateway_id_event_topic : String?

        def initialize(
          @lo_ra_wan : Types::LoRaWANConnectionStatusEventNotificationConfigurations? = nil,
          @wireless_gateway_id_event_topic : String? = nil
        )
        end
      end

      # Connection status resource type event configuration object for enabling or disabling topic.

      struct ConnectionStatusResourceTypeEventConfiguration
        include JSON::Serializable

        # Connection status resource type event configuration object for enabling or disabling LoRaWAN related
        # event topics.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANConnectionStatusResourceTypeEventConfiguration?

        def initialize(
          @lo_ra_wan : Types::LoRaWANConnectionStatusResourceTypeEventConfiguration? = nil
        )
        end
      end


      struct CreateDestinationRequest
        include JSON::Serializable

        # The rule name or topic rule to send messages to.

        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The type of value in Expression .

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String

        # The name of the new resource.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the IAM Role that authorizes the destination.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the new resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags to attach to the new destination. Tags are metadata that you can use to manage a resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @expression : String,
          @expression_type : String,
          @name : String,
          @role_arn : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDestinationResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the new resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateDeviceProfileRequest
        include JSON::Serializable

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The device profile information to use to create the device profile.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANDeviceProfile?

        # The name of the new resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Sidewalk-related information for creating the Sidewalk device profile.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkCreateDeviceProfile?

        # The tags to attach to the new device profile. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_request_token : String? = nil,
          @lo_ra_wan : Types::LoRaWANDeviceProfile? = nil,
          @name : String? = nil,
          @sidewalk : Types::SidewalkCreateDeviceProfile? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDeviceProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new device profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "FirmwareUpdateImage")]
        getter firmware_update_image : String


        @[JSON::Field(key: "FirmwareUpdateRole")]
        getter firmware_update_role : String


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Descriptor")]
        getter descriptor : String?


        @[JSON::Field(key: "FragmentIntervalMS")]
        getter fragment_interval_ms : Int32?


        @[JSON::Field(key: "FragmentSizeBytes")]
        getter fragment_size_bytes : Int32?


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANFuotaTask?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "RedundancyPercent")]
        getter redundancy_percent : Int32?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @firmware_update_image : String,
          @firmware_update_role : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @descriptor : String? = nil,
          @fragment_interval_ms : Int32? = nil,
          @fragment_size_bytes : Int32? = nil,
          @lo_ra_wan : Types::LoRaWANFuotaTask? = nil,
          @name : String? = nil,
          @redundancy_percent : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFuotaTaskResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticast

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the multicast group.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @lo_ra_wan : Types::LoRaWANMulticast,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMulticastGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateNetworkAnalyzerConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # Multicast Group resources to add to the network analyzer configruation. Provide the MulticastGroupId
        # of the resource to add in the input array.

        @[JSON::Field(key: "MulticastGroups")]
        getter multicast_groups : Array(String)?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?


        @[JSON::Field(key: "TraceContent")]
        getter trace_content : Types::TraceContent?

        # Wireless device resources to add to the network analyzer configuration. Provide the WirelessDeviceId
        # of the resource to add in the input array.

        @[JSON::Field(key: "WirelessDevices")]
        getter wireless_devices : Array(String)?

        # Wireless gateway resources to add to the network analyzer configuration. Provide the
        # WirelessGatewayId of the resource to add in the input array.

        @[JSON::Field(key: "WirelessGateways")]
        getter wireless_gateways : Array(String)?

        def initialize(
          @name : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @multicast_groups : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @trace_content : Types::TraceContent? = nil,
          @wireless_devices : Array(String)? = nil,
          @wireless_gateways : Array(String)? = nil
        )
        end
      end


      struct CreateNetworkAnalyzerConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateServiceProfileRequest
        include JSON::Serializable

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The service profile information to use to create the service profile.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANServiceProfile?

        # The name of the new resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags to attach to the new service profile. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_request_token : String? = nil,
          @lo_ra_wan : Types::LoRaWANServiceProfile? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateServiceProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new service profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateWirelessDeviceRequest
        include JSON::Serializable

        # The name of the destination to assign to the new wireless device.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String

        # The wireless device type.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the new resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The device configuration information to use to create the wireless device.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANDevice?

        # The name of the new resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The integration status of the Device Location feature for LoRaWAN and Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The device configuration information to use to create the Sidewalk device.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkCreateWirelessDevice?

        # The tags to attach to the new wireless device. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination_name : String,
          @type : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @lo_ra_wan : Types::LoRaWANDevice? = nil,
          @name : String? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkCreateWirelessDevice? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWirelessDeviceResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new wireless device.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateWirelessGatewayRequest
        include JSON::Serializable

        # The gateway configuration information to use to create the wireless gateway.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANGateway

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the new resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the new resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags to attach to the new wireless gateway. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @lo_ra_wan : Types::LoRaWANGateway,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWirelessGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new wireless gateway.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateWirelessGatewayTaskDefinitionRequest
        include JSON::Serializable

        # Whether to automatically create tasks using this task definition for all gateways with the specified
        # current version. If false , the task must me created by calling CreateWirelessGatewayTask .

        @[JSON::Field(key: "AutoCreateTasks")]
        getter auto_create_tasks : Bool

        # Each resource must have a unique client request token. The client token is used to implement
        # idempotency. It ensures that the request completes no more than one time. If you retry a request
        # with the same token and the same parameters, the request will complete successfully. However, if you
        # try to create a new resource using the same token but different parameters, an HTTP 409 conflict
        # occurs. If you omit this value, AWS SDKs will automatically generate a unique client request. For
        # more information about idempotency, see Ensuring idempotency in Amazon EC2 API requests .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The name of the new resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags to attach to the specified resource. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Information about the gateways to update.

        @[JSON::Field(key: "Update")]
        getter update : Types::UpdateWirelessGatewayTaskCreate?

        def initialize(
          @auto_create_tasks : Bool,
          @client_request_token : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @update : Types::UpdateWirelessGatewayTaskCreate? = nil
        )
        end
      end


      struct CreateWirelessGatewayTaskDefinitionResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new wireless gateway task definition.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateWirelessGatewayTaskRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ID of the WirelessGatewayTaskDefinition.

        @[JSON::Field(key: "WirelessGatewayTaskDefinitionId")]
        getter wireless_gateway_task_definition_id : String

        def initialize(
          @id : String,
          @wireless_gateway_task_definition_id : String
        )
        end
      end


      struct CreateWirelessGatewayTaskResponse
        include JSON::Serializable

        # The status of the request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the WirelessGatewayTaskDefinition.

        @[JSON::Field(key: "WirelessGatewayTaskDefinitionId")]
        getter wireless_gateway_task_definition_id : String?

        def initialize(
          @status : String? = nil,
          @wireless_gateway_task_definition_id : String? = nil
        )
        end
      end

      # The device attestation key (DAK) information.

      struct DakCertificateMetadata
        include JSON::Serializable

        # The certificate ID for the DAK.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The advertised product ID (APID) that's used for pre-production and production applications.

        @[JSON::Field(key: "ApId")]
        getter ap_id : String?

        # The device type ID that's used for prototyping applications.

        @[JSON::Field(key: "DeviceTypeId")]
        getter device_type_id : String?

        # Whether factory support has been enabled.

        @[JSON::Field(key: "FactorySupport")]
        getter factory_support : Bool?

        # The maximum number of signatures that the DAK can sign. A value of -1 indicates that there's no
        # device limit.

        @[JSON::Field(key: "MaxAllowedSignature")]
        getter max_allowed_signature : Int32?

        def initialize(
          @certificate_id : String,
          @ap_id : String? = nil,
          @device_type_id : String? = nil,
          @factory_support : Bool? = nil,
          @max_allowed_signature : Int32? = nil
        )
        end
      end


      struct DeleteDestinationRequest
        include JSON::Serializable

        # The name of the resource to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDeviceProfileRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteDeviceProfileResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteNetworkAnalyzerConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        def initialize(
          @configuration_name : String
        )
        end
      end


      struct DeleteNetworkAnalyzerConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteQueuedMessagesRequest
        include JSON::Serializable

        # The ID of a given wireless device for which downlink messages will be deleted.

        @[JSON::Field(key: "Id")]
        getter id : String

        # If message ID is "*" , it cleares the entire downlink queue for a given device, specified by the
        # wireless device ID. Otherwise, the downlink message with the specified message ID will be deleted.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The wireless device type, which can be either Sidewalk or LoRaWAN.

        @[JSON::Field(key: "WirelessDeviceType")]
        getter wireless_device_type : String?

        def initialize(
          @id : String,
          @message_id : String,
          @wireless_device_type : String? = nil
        )
        end
      end


      struct DeleteQueuedMessagesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteServiceProfileRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteServiceProfileResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The unique identifier of the import task to be deleted.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteWirelessDeviceImportTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWirelessDeviceRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteWirelessDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWirelessGatewayRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteWirelessGatewayResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWirelessGatewayTaskDefinitionRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteWirelessGatewayTaskDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWirelessGatewayTaskRequest
        include JSON::Serializable

        # The ID of the resource to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteWirelessGatewayTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterWirelessDeviceRequest
        include JSON::Serializable

        # The identifier of the wireless device to deregister from AWS IoT Wireless.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The type of wireless device to deregister from AWS IoT Wireless, which can be LoRaWAN or Sidewalk .

        @[JSON::Field(key: "WirelessDeviceType")]
        getter wireless_device_type : String?

        def initialize(
          @identifier : String,
          @wireless_device_type : String? = nil
        )
        end
      end


      struct DeregisterWirelessDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a destination.

      struct Destinations
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The rule name or topic rule to send messages to.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # The type of value in Expression .

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the IAM Role that authorizes the destination.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @expression : String? = nil,
          @expression_type : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes a device profile.

      struct DeviceProfile
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the device profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Device registration state event configuration object for enabling and disabling relevant topics.

      struct DeviceRegistrationStateEventConfiguration
        include JSON::Serializable

        # Device registration state event configuration object for enabling or disabling Sidewalk related
        # event topics.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkEventNotificationConfigurations?

        # Denotes whether the wireless device ID device registration state event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceIdEventTopic")]
        getter wireless_device_id_event_topic : String?

        def initialize(
          @sidewalk : Types::SidewalkEventNotificationConfigurations? = nil,
          @wireless_device_id_event_topic : String? = nil
        )
        end
      end

      # Device registration state resource type event configuration object for enabling or disabling topic.

      struct DeviceRegistrationStateResourceTypeEventConfiguration
        include JSON::Serializable

        # Device registration resource type state event configuration object for enabling or disabling
        # Sidewalk related event topics.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkResourceTypeEventConfiguration?

        def initialize(
          @sidewalk : Types::SidewalkResourceTypeEventConfiguration? = nil
        )
        end
      end

      # The required list of dimensions for the metric.

      struct Dimension
        include JSON::Serializable

        # The name of the dimension.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The dimension's value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct DisassociateAwsAccountFromPartnerAccountRequest
        include JSON::Serializable

        # The partner account ID to disassociate from the AWS account.

        @[JSON::Field(key: "PartnerAccountId")]
        getter partner_account_id : String

        # The partner type.

        @[JSON::Field(key: "partnerType")]
        getter partner_type : String

        def initialize(
          @partner_account_id : String,
          @partner_type : String
        )
        end
      end


      struct DisassociateAwsAccountFromPartnerAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateMulticastGroupFromFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "MulticastGroupId")]
        getter multicast_group_id : String

        def initialize(
          @id : String,
          @multicast_group_id : String
        )
        end
      end


      struct DisassociateMulticastGroupFromFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWirelessDeviceFromFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "WirelessDeviceId")]
        getter wireless_device_id : String

        def initialize(
          @id : String,
          @wireless_device_id : String
        )
        end
      end


      struct DisassociateWirelessDeviceFromFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWirelessDeviceFromMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "WirelessDeviceId")]
        getter wireless_device_id : String

        def initialize(
          @id : String,
          @wireless_device_id : String
        )
        end
      end


      struct DisassociateWirelessDeviceFromMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWirelessDeviceFromThingRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DisassociateWirelessDeviceFromThingResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWirelessGatewayFromCertificateRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DisassociateWirelessGatewayFromCertificateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWirelessGatewayFromThingRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DisassociateWirelessGatewayFromThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The message in the downlink queue.

      struct DownlinkQueueMessage
        include JSON::Serializable


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANSendDataToDevice?

        # The message ID assigned by IoT Wireless to each downlink message, which helps identify the message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The time at which Iot Wireless received the downlink message.

        @[JSON::Field(key: "ReceivedAt")]
        getter received_at : String?

        # The transmit mode to use for sending data to the wireless device. This can be 0 for UM
        # (unacknowledge mode) or 1 for AM (acknowledge mode).

        @[JSON::Field(key: "TransmitMode")]
        getter transmit_mode : Int32?

        def initialize(
          @lo_ra_wan : Types::LoRaWANSendDataToDevice? = nil,
          @message_id : String? = nil,
          @received_at : String? = nil,
          @transmit_mode : Int32? = nil
        )
        end
      end

      # Event configuration object for a single resource.

      struct EventConfigurationItem
        include JSON::Serializable


        @[JSON::Field(key: "Events")]
        getter events : Types::EventNotificationItemConfigurations?

        # Resource identifier opted in for event messaging.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Identifier type of the particular resource identifier for event configuration.

        @[JSON::Field(key: "IdentifierType")]
        getter identifier_type : String?

        # Partner type of the resource if the identifier type is PartnerAccountId.

        @[JSON::Field(key: "PartnerType")]
        getter partner_type : String?

        def initialize(
          @events : Types::EventNotificationItemConfigurations? = nil,
          @identifier : String? = nil,
          @identifier_type : String? = nil,
          @partner_type : String? = nil
        )
        end
      end

      # Object of all event configurations and the status of the event topics.

      struct EventNotificationItemConfigurations
        include JSON::Serializable

        # Connection status event configuration for an event configuration item.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::ConnectionStatusEventConfiguration?

        # Device registration state event configuration for an event configuration item.

        @[JSON::Field(key: "DeviceRegistrationState")]
        getter device_registration_state : Types::DeviceRegistrationStateEventConfiguration?

        # Join event configuration for an event configuration item.

        @[JSON::Field(key: "Join")]
        getter join : Types::JoinEventConfiguration?

        # Message delivery status event configuration for an event configuration item.

        @[JSON::Field(key: "MessageDeliveryStatus")]
        getter message_delivery_status : Types::MessageDeliveryStatusEventConfiguration?

        # Proximity event configuration for an event configuration item.

        @[JSON::Field(key: "Proximity")]
        getter proximity : Types::ProximityEventConfiguration?

        def initialize(
          @connection_status : Types::ConnectionStatusEventConfiguration? = nil,
          @device_registration_state : Types::DeviceRegistrationStateEventConfiguration? = nil,
          @join : Types::JoinEventConfiguration? = nil,
          @message_delivery_status : Types::MessageDeliveryStatusEventConfiguration? = nil,
          @proximity : Types::ProximityEventConfiguration? = nil
        )
        end
      end

      # List of FPort assigned for different LoRaWAN application packages to use

      struct FPorts
        include JSON::Serializable

        # Optional LoRaWAN application information, which can be used for geolocation.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::ApplicationConfig)?


        @[JSON::Field(key: "ClockSync")]
        getter clock_sync : Int32?


        @[JSON::Field(key: "Fuota")]
        getter fuota : Int32?


        @[JSON::Field(key: "Multicast")]
        getter multicast : Int32?

        # FPort values for the GNSS, stream, and ClockSync functions of the positioning information.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::Positioning?

        def initialize(
          @applications : Array(Types::ApplicationConfig)? = nil,
          @clock_sync : Int32? = nil,
          @fuota : Int32? = nil,
          @multicast : Int32? = nil,
          @positioning : Types::Positioning? = nil
        )
        end
      end

      # A FUOTA task.

      struct FuotaTask
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The log options for a FUOTA task event and can be used to set log levels for a specific FUOTA task
      # event. For a LoRaWAN FUOTA task, the only possible event for a log message is Fuota .

      struct FuotaTaskEventLogOption
        include JSON::Serializable


        @[JSON::Field(key: "Event")]
        getter event : String


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        def initialize(
          @event : String,
          @log_level : String
        )
        end
      end

      # The log options for FUOTA tasks and can be used to set log levels for a specific type of FUOTA task.

      struct FuotaTaskLogOption
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        # The FUOTA task type.

        @[JSON::Field(key: "Type")]
        getter type : String


        @[JSON::Field(key: "Events")]
        getter events : Array(Types::FuotaTaskEventLogOption)?

        def initialize(
          @log_level : String,
          @type : String,
          @events : Array(Types::FuotaTaskEventLogOption)? = nil
        )
        end
      end

      # Gateway list item object that specifies the frequency and list of gateways for which the downlink
      # message should be sent.

      struct GatewayListItem
        include JSON::Serializable

        # The frequency to use for the gateways when sending a downlink message to the wireless device.

        @[JSON::Field(key: "DownlinkFrequency")]
        getter downlink_frequency : Int32

        # The ID of the wireless gateways that you want to add to the list of gateways when sending downlink
        # messages.

        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : String

        def initialize(
          @downlink_frequency : Int32,
          @gateway_id : String
        )
        end
      end


      struct GetDestinationRequest
        include JSON::Serializable

        # The name of the resource to get.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetDestinationResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The rule name or topic rule to send messages to.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # The type of value in Expression .

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the IAM Role that authorizes the destination.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @expression : String? = nil,
          @expression_type : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct GetDeviceProfileRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetDeviceProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the device profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Information about the device profile.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANDeviceProfile?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the Sidewalk parameters in the device profile.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkGetDeviceProfile?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANDeviceProfile? = nil,
          @name : String? = nil,
          @sidewalk : Types::SidewalkGetDeviceProfile? = nil
        )
        end
      end


      struct GetEventConfigurationByResourceTypesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetEventConfigurationByResourceTypesResponse
        include JSON::Serializable

        # Resource type event configuration for the connection status event.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::ConnectionStatusResourceTypeEventConfiguration?

        # Resource type event configuration for the device registration state event.

        @[JSON::Field(key: "DeviceRegistrationState")]
        getter device_registration_state : Types::DeviceRegistrationStateResourceTypeEventConfiguration?

        # Resource type event configuration for the join event.

        @[JSON::Field(key: "Join")]
        getter join : Types::JoinResourceTypeEventConfiguration?

        # Resource type event configuration object for the message delivery status event.

        @[JSON::Field(key: "MessageDeliveryStatus")]
        getter message_delivery_status : Types::MessageDeliveryStatusResourceTypeEventConfiguration?

        # Resource type event configuration for the proximity event.

        @[JSON::Field(key: "Proximity")]
        getter proximity : Types::ProximityResourceTypeEventConfiguration?

        def initialize(
          @connection_status : Types::ConnectionStatusResourceTypeEventConfiguration? = nil,
          @device_registration_state : Types::DeviceRegistrationStateResourceTypeEventConfiguration? = nil,
          @join : Types::JoinResourceTypeEventConfiguration? = nil,
          @message_delivery_status : Types::MessageDeliveryStatusResourceTypeEventConfiguration? = nil,
          @proximity : Types::ProximityResourceTypeEventConfiguration? = nil
        )
        end
      end


      struct GetFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetFuotaTaskResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Descriptor")]
        getter descriptor : String?


        @[JSON::Field(key: "FirmwareUpdateImage")]
        getter firmware_update_image : String?


        @[JSON::Field(key: "FirmwareUpdateRole")]
        getter firmware_update_role : String?


        @[JSON::Field(key: "FragmentIntervalMS")]
        getter fragment_interval_ms : Int32?


        @[JSON::Field(key: "FragmentSizeBytes")]
        getter fragment_size_bytes : Int32?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANFuotaTaskGetInfo?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "RedundancyPercent")]
        getter redundancy_percent : Int32?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @descriptor : String? = nil,
          @firmware_update_image : String? = nil,
          @firmware_update_role : String? = nil,
          @fragment_interval_ms : Int32? = nil,
          @fragment_size_bytes : Int32? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANFuotaTaskGetInfo? = nil,
          @name : String? = nil,
          @redundancy_percent : Int32? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetLogLevelsByResourceTypesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetLogLevelsByResourceTypesResponse
        include JSON::Serializable


        @[JSON::Field(key: "DefaultLogLevel")]
        getter default_log_level : String?


        @[JSON::Field(key: "FuotaTaskLogOptions")]
        getter fuota_task_log_options : Array(Types::FuotaTaskLogOption)?


        @[JSON::Field(key: "WirelessDeviceLogOptions")]
        getter wireless_device_log_options : Array(Types::WirelessDeviceLogOption)?


        @[JSON::Field(key: "WirelessGatewayLogOptions")]
        getter wireless_gateway_log_options : Array(Types::WirelessGatewayLogOption)?

        def initialize(
          @default_log_level : String? = nil,
          @fuota_task_log_options : Array(Types::FuotaTaskLogOption)? = nil,
          @wireless_device_log_options : Array(Types::WirelessDeviceLogOption)? = nil,
          @wireless_gateway_log_options : Array(Types::WirelessGatewayLogOption)? = nil
        )
        end
      end


      struct GetMetricConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetMetricConfigurationResponse
        include JSON::Serializable

        # The configuration status of the AWS account for summary metric aggregation.

        @[JSON::Field(key: "SummaryMetric")]
        getter summary_metric : Types::SummaryMetricConfiguration?

        def initialize(
          @summary_metric : Types::SummaryMetricConfiguration? = nil
        )
        end
      end


      struct GetMetricsRequest
        include JSON::Serializable

        # The list of queries to retrieve the summary metrics.

        @[JSON::Field(key: "SummaryMetricQueries")]
        getter summary_metric_queries : Array(Types::SummaryMetricQuery)?

        def initialize(
          @summary_metric_queries : Array(Types::SummaryMetricQuery)? = nil
        )
        end
      end


      struct GetMetricsResponse
        include JSON::Serializable

        # The list of summary metrics that were retrieved.

        @[JSON::Field(key: "SummaryMetricQueryResults")]
        getter summary_metric_query_results : Array(Types::SummaryMetricQueryResult)?

        def initialize(
          @summary_metric_query_results : Array(Types::SummaryMetricQueryResult)? = nil
        )
        end
      end


      struct GetMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetMulticastGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticastGet?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANMulticastGet? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMulticastGroupSessionRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetMulticastGroupSessionResponse
        include JSON::Serializable


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticastSession?

        def initialize(
          @lo_ra_wan : Types::LoRaWANMulticastSession? = nil
        )
        end
      end


      struct GetNetworkAnalyzerConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        def initialize(
          @configuration_name : String
        )
        end
      end


      struct GetNetworkAnalyzerConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # List of multicast group resources that have been added to the network analyzer configuration.

        @[JSON::Field(key: "MulticastGroups")]
        getter multicast_groups : Array(String)?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "TraceContent")]
        getter trace_content : Types::TraceContent?

        # List of wireless device resources that have been added to the network analyzer configuration.

        @[JSON::Field(key: "WirelessDevices")]
        getter wireless_devices : Array(String)?

        # List of wireless gateway resources that have been added to the network analyzer configuration.

        @[JSON::Field(key: "WirelessGateways")]
        getter wireless_gateways : Array(String)?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @multicast_groups : Array(String)? = nil,
          @name : String? = nil,
          @trace_content : Types::TraceContent? = nil,
          @wireless_devices : Array(String)? = nil,
          @wireless_gateways : Array(String)? = nil
        )
        end
      end


      struct GetPartnerAccountRequest
        include JSON::Serializable

        # The partner account ID to disassociate from the AWS account.

        @[JSON::Field(key: "PartnerAccountId")]
        getter partner_account_id : String

        # The partner type.

        @[JSON::Field(key: "partnerType")]
        getter partner_type : String

        def initialize(
          @partner_account_id : String,
          @partner_type : String
        )
        end
      end


      struct GetPartnerAccountResponse
        include JSON::Serializable

        # Whether the partner account is linked to the AWS account.

        @[JSON::Field(key: "AccountLinked")]
        getter account_linked : Bool?

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkAccountInfoWithFingerprint?

        def initialize(
          @account_linked : Bool? = nil,
          @sidewalk : Types::SidewalkAccountInfoWithFingerprint? = nil
        )
        end
      end


      struct GetPositionConfigurationRequest
        include JSON::Serializable

        # Resource identifier used in a position configuration.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # Resource type of the resource for which position configuration is retrieved.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct GetPositionConfigurationResponse
        include JSON::Serializable

        # The position data destination that describes the AWS IoT rule that processes the device's position
        # data for use by AWS IoT Core for LoRaWAN.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The wrapper for the solver configuration details object.

        @[JSON::Field(key: "Solvers")]
        getter solvers : Types::PositionSolverDetails?

        def initialize(
          @destination : String? = nil,
          @solvers : Types::PositionSolverDetails? = nil
        )
        end
      end


      struct GetPositionEstimateRequest
        include JSON::Serializable

        # Retrieves an estimated device position by resolving measurement data from cellular radio towers. The
        # position is resolved using HERE's cellular-based solver.

        @[JSON::Field(key: "CellTowers")]
        getter cell_towers : Types::CellTowers?

        # Retrieves an estimated device position by resolving the global navigation satellite system (GNSS)
        # scan data. The position is resolved using the GNSS solver powered by LoRa Cloud.

        @[JSON::Field(key: "Gnss")]
        getter gnss : Types::Gnss?

        # Retrieves an estimated device position by resolving the IP address information from the device. The
        # position is resolved using MaxMind's IP-based solver.

        @[JSON::Field(key: "Ip")]
        getter ip : Types::Ip?

        # Optional information that specifies the time when the position information will be resolved. It uses
        # the Unix timestamp format. If not specified, the time at which the request was received will be
        # used.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # Retrieves an estimated device position by resolving WLAN measurement data. The position is resolved
        # using HERE's Wi-Fi based solver.

        @[JSON::Field(key: "WiFiAccessPoints")]
        getter wi_fi_access_points : Array(Types::WiFiAccessPoint)?

        def initialize(
          @cell_towers : Types::CellTowers? = nil,
          @gnss : Types::Gnss? = nil,
          @ip : Types::Ip? = nil,
          @timestamp : Time? = nil,
          @wi_fi_access_points : Array(Types::WiFiAccessPoint)? = nil
        )
        end
      end


      struct GetPositionEstimateResponse
        include JSON::Serializable

        # The position information of the resource, displayed as a JSON payload. The payload is of type blob
        # and uses the GeoJSON format, which a format that's used to encode geographic data structures. A
        # sample payload contains the timestamp information, the WGS84 coordinates of the location, and the
        # accuracy and confidence level. For more information and examples, see Resolve device location
        # (console) .

        @[JSON::Field(key: "GeoJsonPayload")]
        getter geo_json_payload : Bytes?

        def initialize(
          @geo_json_payload : Bytes? = nil
        )
        end
      end


      struct GetPositionRequest
        include JSON::Serializable

        # Resource identifier used to retrieve the position information.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # Resource type of the resource for which position information is retrieved.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct GetPositionResponse
        include JSON::Serializable

        # The accuracy of the estimated position in meters. An empty value indicates that no position data is
        # available. A value of ‘0.0’ value indicates that position data is available. This data corresponds
        # to the position information that you specified instead of the position computed by solver.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::Accuracy?

        # The position information of the resource.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # The vendor of the positioning solver.

        @[JSON::Field(key: "SolverProvider")]
        getter solver_provider : String?

        # The type of solver used to identify the position of the resource.

        @[JSON::Field(key: "SolverType")]
        getter solver_type : String?

        # The version of the positioning solver.

        @[JSON::Field(key: "SolverVersion")]
        getter solver_version : String?

        # The timestamp at which the device's position was determined.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String?

        def initialize(
          @accuracy : Types::Accuracy? = nil,
          @position : Array(Float64)? = nil,
          @solver_provider : String? = nil,
          @solver_type : String? = nil,
          @solver_version : String? = nil,
          @timestamp : String? = nil
        )
        end
      end


      struct GetResourceEventConfigurationRequest
        include JSON::Serializable

        # Resource identifier to opt in for event messaging.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Identifier type of the particular resource identifier for event configuration.

        @[JSON::Field(key: "identifierType")]
        getter identifier_type : String

        # Partner type of the resource if the identifier type is PartnerAccountId .

        @[JSON::Field(key: "partnerType")]
        getter partner_type : String?

        def initialize(
          @identifier : String,
          @identifier_type : String,
          @partner_type : String? = nil
        )
        end
      end


      struct GetResourceEventConfigurationResponse
        include JSON::Serializable

        # Event configuration for the connection status event.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::ConnectionStatusEventConfiguration?

        # Event configuration for the device registration state event.

        @[JSON::Field(key: "DeviceRegistrationState")]
        getter device_registration_state : Types::DeviceRegistrationStateEventConfiguration?

        # Event configuration for the join event.

        @[JSON::Field(key: "Join")]
        getter join : Types::JoinEventConfiguration?

        # Event configuration for the message delivery status event.

        @[JSON::Field(key: "MessageDeliveryStatus")]
        getter message_delivery_status : Types::MessageDeliveryStatusEventConfiguration?

        # Event configuration for the proximity event.

        @[JSON::Field(key: "Proximity")]
        getter proximity : Types::ProximityEventConfiguration?

        def initialize(
          @connection_status : Types::ConnectionStatusEventConfiguration? = nil,
          @device_registration_state : Types::DeviceRegistrationStateEventConfiguration? = nil,
          @join : Types::JoinEventConfiguration? = nil,
          @message_delivery_status : Types::MessageDeliveryStatusEventConfiguration? = nil,
          @proximity : Types::ProximityEventConfiguration? = nil
        )
        end
      end


      struct GetResourceLogLevelRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The type of resource, which can be WirelessDevice , WirelessGateway , or FuotaTask .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct GetResourceLogLevelResponse
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        def initialize(
          @log_level : String? = nil
        )
        end
      end


      struct GetResourcePositionRequest
        include JSON::Serializable

        # The identifier of the resource for which position information is retrieved. It can be the wireless
        # device ID or the wireless gateway ID, depending on the resource type.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The type of resource for which position information is retrieved, which can be a wireless device or
        # a wireless gateway.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct GetResourcePositionResponse
        include JSON::Serializable

        # The position information of the resource, displayed as a JSON payload. The payload uses the GeoJSON
        # format, which a format that's used to encode geographic data structures. For more information, see
        # GeoJSON .

        @[JSON::Field(key: "GeoJsonPayload")]
        getter geo_json_payload : Bytes?

        def initialize(
          @geo_json_payload : Bytes? = nil
        )
        end
      end


      struct GetServiceEndpointRequest
        include JSON::Serializable

        # The service type for which to get endpoint information about. Can be CUPS for the Configuration and
        # Update Server endpoint, or LNS for the LoRaWAN Network Server endpoint.

        @[JSON::Field(key: "serviceType")]
        getter service_type : String?

        def initialize(
          @service_type : String? = nil
        )
        end
      end


      struct GetServiceEndpointResponse
        include JSON::Serializable

        # The Root CA of the server trust certificate.

        @[JSON::Field(key: "ServerTrust")]
        getter server_trust : String?

        # The service endpoint value.

        @[JSON::Field(key: "ServiceEndpoint")]
        getter service_endpoint : String?

        # The endpoint's service type.

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String?

        def initialize(
          @server_trust : String? = nil,
          @service_endpoint : String? = nil,
          @service_type : String? = nil
        )
        end
      end


      struct GetServiceProfileRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetServiceProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the service profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Information about the service profile.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANGetServiceProfileInfo?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANGetServiceProfileInfo? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The identifier of the import task for which information is requested.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetWirelessDeviceImportTaskResponse
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the import task.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the import task was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The name of the destination that's assigned to the wireless devices in the import task.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The number of devices in the import task that failed to onboard to the import task.

        @[JSON::Field(key: "FailedImportedDeviceCount")]
        getter failed_imported_device_count : Int64?

        # The identifier of the import task for which information is retrieved.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of devices in the import task that are waiting for the control log to start processing.

        @[JSON::Field(key: "InitializedImportedDeviceCount")]
        getter initialized_imported_device_count : Int64?

        # The number of devices in the import task that have been onboarded to the import task.

        @[JSON::Field(key: "OnboardedImportedDeviceCount")]
        getter onboarded_imported_device_count : Int64?

        # The number of devices in the import task that are waiting in the import task queue to be onboarded.

        @[JSON::Field(key: "PendingImportedDeviceCount")]
        getter pending_imported_device_count : Int64?

        # The integration status of the Device Location feature for LoRaWAN and Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The Sidewalk-related information about an import task.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkGetStartImportInfo?

        # The import task status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the provided status information, such as a validation error that causes the import
        # task to fail.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @destination_name : String? = nil,
          @failed_imported_device_count : Int64? = nil,
          @id : String? = nil,
          @initialized_imported_device_count : Int64? = nil,
          @onboarded_imported_device_count : Int64? = nil,
          @pending_imported_device_count : Int64? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkGetStartImportInfo? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetWirelessDeviceRequest
        include JSON::Serializable

        # The identifier of the wireless device to get.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The type of identifier used in identifier .

        @[JSON::Field(key: "identifierType")]
        getter identifier_type : String

        def initialize(
          @identifier : String,
          @identifier_type : String
        )
        end
      end


      struct GetWirelessDeviceResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the destination to which the device is assigned.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The ID of the wireless device.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Information about the wireless device.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANDevice?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The integration status of the Device Location feature for LoRaWAN and Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # Sidewalk device object.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkDevice?

        # The ARN of the thing associated with the wireless device.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String?

        # The name of the thing associated with the wireless device. The value is empty if a thing isn't
        # associated with the device.

        @[JSON::Field(key: "ThingName")]
        getter thing_name : String?

        # The wireless device type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @destination_name : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANDevice? = nil,
          @name : String? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkDevice? = nil,
          @thing_arn : String? = nil,
          @thing_name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetWirelessDeviceStatisticsRequest
        include JSON::Serializable

        # The ID of the wireless device for which to get the data.

        @[JSON::Field(key: "Id")]
        getter wireless_device_id : String

        def initialize(
          @wireless_device_id : String
        )
        end
      end


      struct GetWirelessDeviceStatisticsResponse
        include JSON::Serializable

        # The date and time when the most recent uplink was received. This value is only valid for 3 months.

        @[JSON::Field(key: "LastUplinkReceivedAt")]
        getter last_uplink_received_at : String?

        # Information about the wireless device's operations.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANDeviceMetadata?

        # MetaData for Sidewalk device.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkDeviceMetadata?

        # The ID of the wireless device.

        @[JSON::Field(key: "WirelessDeviceId")]
        getter wireless_device_id : String?

        def initialize(
          @last_uplink_received_at : String? = nil,
          @lo_ra_wan : Types::LoRaWANDeviceMetadata? = nil,
          @sidewalk : Types::SidewalkDeviceMetadata? = nil,
          @wireless_device_id : String? = nil
        )
        end
      end


      struct GetWirelessGatewayCertificateRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetWirelessGatewayCertificateResponse
        include JSON::Serializable

        # The ID of the certificate associated with the wireless gateway.

        @[JSON::Field(key: "IotCertificateId")]
        getter iot_certificate_id : String?

        # The ID of the certificate that is associated with the wireless gateway and used for the
        # LoRaWANNetworkServer endpoint.

        @[JSON::Field(key: "LoRaWANNetworkServerCertificateId")]
        getter lo_ra_wan_network_server_certificate_id : String?

        def initialize(
          @iot_certificate_id : String? = nil,
          @lo_ra_wan_network_server_certificate_id : String? = nil
        )
        end
      end


      struct GetWirelessGatewayFirmwareInformationRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetWirelessGatewayFirmwareInformationResponse
        include JSON::Serializable

        # Information about the wireless gateway's firmware.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANGatewayCurrentVersion?

        def initialize(
          @lo_ra_wan : Types::LoRaWANGatewayCurrentVersion? = nil
        )
        end
      end


      struct GetWirelessGatewayRequest
        include JSON::Serializable

        # The identifier of the wireless gateway to get.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The type of identifier used in identifier .

        @[JSON::Field(key: "identifierType")]
        getter identifier_type : String

        def initialize(
          @identifier : String,
          @identifier_type : String
        )
        end
      end


      struct GetWirelessGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the wireless gateway.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Information about the wireless gateway.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANGateway?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the thing associated with the wireless gateway.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String?

        # The name of the thing associated with the wireless gateway. The value is empty if a thing isn't
        # associated with the gateway.

        @[JSON::Field(key: "ThingName")]
        getter thing_name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANGateway? = nil,
          @name : String? = nil,
          @thing_arn : String? = nil,
          @thing_name : String? = nil
        )
        end
      end


      struct GetWirelessGatewayStatisticsRequest
        include JSON::Serializable

        # The ID of the wireless gateway for which to get the data.

        @[JSON::Field(key: "Id")]
        getter wireless_gateway_id : String

        def initialize(
          @wireless_gateway_id : String
        )
        end
      end


      struct GetWirelessGatewayStatisticsResponse
        include JSON::Serializable

        # The connection status of the wireless gateway.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : String?

        # The date and time when the most recent uplink was received. This value is only valid for 3 months.

        @[JSON::Field(key: "LastUplinkReceivedAt")]
        getter last_uplink_received_at : String?

        # The ID of the wireless gateway.

        @[JSON::Field(key: "WirelessGatewayId")]
        getter wireless_gateway_id : String?

        def initialize(
          @connection_status : String? = nil,
          @last_uplink_received_at : String? = nil,
          @wireless_gateway_id : String? = nil
        )
        end
      end


      struct GetWirelessGatewayTaskDefinitionRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetWirelessGatewayTaskDefinitionResponse
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Whether to automatically create tasks using this task definition for all gateways with the specified
        # current version. If false , the task must me created by calling CreateWirelessGatewayTask .

        @[JSON::Field(key: "AutoCreateTasks")]
        getter auto_create_tasks : Bool?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the gateways to update.

        @[JSON::Field(key: "Update")]
        getter update : Types::UpdateWirelessGatewayTaskCreate?

        def initialize(
          @arn : String? = nil,
          @auto_create_tasks : Bool? = nil,
          @name : String? = nil,
          @update : Types::UpdateWirelessGatewayTaskCreate? = nil
        )
        end
      end


      struct GetWirelessGatewayTaskRequest
        include JSON::Serializable

        # The ID of the resource to get.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetWirelessGatewayTaskResponse
        include JSON::Serializable

        # The date and time when the most recent uplink was received. This value is only valid for 3 months.

        @[JSON::Field(key: "LastUplinkReceivedAt")]
        getter last_uplink_received_at : String?

        # The status of the request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time when the task was created.

        @[JSON::Field(key: "TaskCreatedAt")]
        getter task_created_at : String?

        # The ID of the wireless gateway.

        @[JSON::Field(key: "WirelessGatewayId")]
        getter wireless_gateway_id : String?

        # The ID of the WirelessGatewayTask.

        @[JSON::Field(key: "WirelessGatewayTaskDefinitionId")]
        getter wireless_gateway_task_definition_id : String?

        def initialize(
          @last_uplink_received_at : String? = nil,
          @status : String? = nil,
          @task_created_at : String? = nil,
          @wireless_gateway_id : String? = nil,
          @wireless_gateway_task_definition_id : String? = nil
        )
        end
      end

      # Global identity information.

      struct GlobalIdentity
        include JSON::Serializable

        # GERAN (GSM EDGE Radio Access Network) cell global identifier.

        @[JSON::Field(key: "GeranCid")]
        getter geran_cid : Int32

        # Location area code of the global identity.

        @[JSON::Field(key: "Lac")]
        getter lac : Int32

        def initialize(
          @geran_cid : Int32,
          @lac : Int32
        )
        end
      end

      # Global navigation satellite system (GNSS) object used for positioning.

      struct Gnss
        include JSON::Serializable

        # Payload that contains the GNSS scan result, or NAV message, in hexadecimal notation.

        @[JSON::Field(key: "Payload")]
        getter payload : String

        # Optional assistance altitude, which is the altitude of the device at capture time, specified in
        # meters above the WGS84 reference ellipsoid.

        @[JSON::Field(key: "AssistAltitude")]
        getter assist_altitude : Float64?

        # Optional assistance position information, specified using latitude and longitude values in degrees.
        # The coordinates are inside the WGS84 reference frame.

        @[JSON::Field(key: "AssistPosition")]
        getter assist_position : Array(Float64)?

        # Optional parameter that gives an estimate of the time when the GNSS scan information is taken, in
        # seconds GPS time (GPST). If capture time is not specified, the local server time is used.

        @[JSON::Field(key: "CaptureTime")]
        getter capture_time : Float64?

        # Optional value that gives the capture time estimate accuracy, in seconds. If capture time accuracy
        # is not specified, default value of 300 is used.

        @[JSON::Field(key: "CaptureTimeAccuracy")]
        getter capture_time_accuracy : Float64?

        # Optional parameter that forces 2D solve, which modifies the positioning algorithm to a 2D solution
        # problem. When this parameter is specified, the assistance altitude should have an accuracy of at
        # least 10 meters.

        @[JSON::Field(key: "Use2DSolver")]
        getter use2_d_solver : Bool?

        def initialize(
          @payload : String,
          @assist_altitude : Float64? = nil,
          @assist_position : Array(Float64)? = nil,
          @capture_time : Float64? = nil,
          @capture_time_accuracy : Float64? = nil,
          @use2_d_solver : Bool? = nil
        )
        end
      end

      # GSM local ID information, which corresponds to the local identification parameters of a GSM cell.

      struct GsmLocalId
        include JSON::Serializable

        # GSM broadcast control channel.

        @[JSON::Field(key: "Bcch")]
        getter bcch : Int32

        # GSM base station identity code (BSIC).

        @[JSON::Field(key: "Bsic")]
        getter bsic : Int32

        def initialize(
          @bcch : Int32,
          @bsic : Int32
        )
        end
      end

      # GSM object for network measurement reports.

      struct GsmNmrObj
        include JSON::Serializable

        # GSM broadcast control channel.

        @[JSON::Field(key: "Bcch")]
        getter bcch : Int32

        # GSM base station identity code (BSIC).

        @[JSON::Field(key: "Bsic")]
        getter bsic : Int32

        # Global identity information of the GSM object.

        @[JSON::Field(key: "GlobalIdentity")]
        getter global_identity : Types::GlobalIdentity?

        # Rx level, which is the received signal power, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "RxLevel")]
        getter rx_level : Int32?

        def initialize(
          @bcch : Int32,
          @bsic : Int32,
          @global_identity : Types::GlobalIdentity? = nil,
          @rx_level : Int32? = nil
        )
        end
      end

      # GSM object.

      struct GsmObj
        include JSON::Serializable

        # GERAN (GSM EDGE Radio Access Network) Cell Global Identifier.

        @[JSON::Field(key: "GeranCid")]
        getter geran_cid : Int32

        # Location area code.

        @[JSON::Field(key: "Lac")]
        getter lac : Int32

        # Mobile Country Code.

        @[JSON::Field(key: "Mcc")]
        getter mcc : Int32

        # Mobile Network Code.

        @[JSON::Field(key: "Mnc")]
        getter mnc : Int32

        # GSM local identification (local ID) information.

        @[JSON::Field(key: "GsmLocalId")]
        getter gsm_local_id : Types::GsmLocalId?

        # GSM object for network measurement reports.

        @[JSON::Field(key: "GsmNmr")]
        getter gsm_nmr : Array(Types::GsmNmrObj)?

        # Timing advance value, which corresponds to the length of time a signal takes to reach the base
        # station from a mobile phone.

        @[JSON::Field(key: "GsmTimingAdvance")]
        getter gsm_timing_advance : Int32?

        # Rx level, which is the received signal power, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "RxLevel")]
        getter rx_level : Int32?

        def initialize(
          @geran_cid : Int32,
          @lac : Int32,
          @mcc : Int32,
          @mnc : Int32,
          @gsm_local_id : Types::GsmLocalId? = nil,
          @gsm_nmr : Array(Types::GsmNmrObj)? = nil,
          @gsm_timing_advance : Int32? = nil,
          @rx_level : Int32? = nil
        )
        end
      end

      # Information about a Sidewalk device that has been added to an import task.

      struct ImportedSidewalkDevice
        include JSON::Serializable

        # The time at which the status information was last updated.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        # The onboarding status of the Sidewalk device in the import task.

        @[JSON::Field(key: "OnboardingStatus")]
        getter onboarding_status : String?

        # The reason for the onboarding status information for the Sidewalk device.

        @[JSON::Field(key: "OnboardingStatusReason")]
        getter onboarding_status_reason : String?

        # The Sidewalk manufacturing serial number (SMSN) of the Sidewalk device.

        @[JSON::Field(key: "SidewalkManufacturingSn")]
        getter sidewalk_manufacturing_sn : String?

        def initialize(
          @last_update_time : Time? = nil,
          @onboarding_status : String? = nil,
          @onboarding_status_reason : String? = nil,
          @sidewalk_manufacturing_sn : String? = nil
        )
        end
      end

      # Information about a wireless device that has been added to an import task.

      struct ImportedWirelessDevice
        include JSON::Serializable

        # The Sidewalk-related information about a device that has been added to an import task.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::ImportedSidewalkDevice?

        def initialize(
          @sidewalk : Types::ImportedSidewalkDevice? = nil
        )
        end
      end

      # An unexpected error occurred while processing a request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # IP address used for resolving device location.

      struct Ip
        include JSON::Serializable

        # IP address information.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String

        def initialize(
          @ip_address : String
        )
        end
      end

      # Join event configuration object for enabling or disabling topic.

      struct JoinEventConfiguration
        include JSON::Serializable

        # Join event configuration object for enabling or disabling LoRaWAN related event topics.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANJoinEventNotificationConfigurations?

        # Denotes whether the wireless device ID join event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceIdEventTopic")]
        getter wireless_device_id_event_topic : String?

        def initialize(
          @lo_ra_wan : Types::LoRaWANJoinEventNotificationConfigurations? = nil,
          @wireless_device_id_event_topic : String? = nil
        )
        end
      end

      # Join resource type event configuration object for enabling or disabling topic.

      struct JoinResourceTypeEventConfiguration
        include JSON::Serializable

        # Join resource type event configuration object for enabling or disabling LoRaWAN related event
        # topics.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANJoinResourceTypeEventConfiguration?

        def initialize(
          @lo_ra_wan : Types::LoRaWANJoinResourceTypeEventConfiguration? = nil
        )
        end
      end


      struct ListDestinationsRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDestinationsResponse
        include JSON::Serializable

        # The list of destinations.

        @[JSON::Field(key: "DestinationList")]
        getter destination_list : Array(Types::Destinations)?

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destination_list : Array(Types::Destinations)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceProfilesRequest
        include JSON::Serializable

        # A filter to list only device profiles that use this type, which can be LoRaWAN or Sidewalk .

        @[JSON::Field(key: "deviceProfileType")]
        getter device_profile_type : String?

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @device_profile_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceProfilesResponse
        include JSON::Serializable

        # The list of device profiles.

        @[JSON::Field(key: "DeviceProfileList")]
        getter device_profile_list : Array(Types::DeviceProfile)?

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_profile_list : Array(Types::DeviceProfile)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDevicesForWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The identifier of the import task for which wireless devices are listed.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the devices in the import task.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListDevicesForWirelessDeviceImportTaskResponse
        include JSON::Serializable

        # The name of the Sidewalk destination that describes the IoT rule to route messages received from
        # devices in an import task that are onboarded to AWS IoT Wireless.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # List of wireless devices in an import task and their onboarding status.

        @[JSON::Field(key: "ImportedWirelessDeviceList")]
        getter imported_wireless_device_list : Array(Types::ImportedWirelessDevice)?

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The integration status of the Device Location feature for Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The Sidewalk object containing Sidewalk-related device information.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkListDevicesForImportInfo?

        def initialize(
          @destination_name : String? = nil,
          @imported_wireless_device_list : Array(Types::ImportedWirelessDevice)? = nil,
          @next_token : String? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkListDevicesForImportInfo? = nil
        )
        end
      end


      struct ListEventConfigurationsRequest
        include JSON::Serializable

        # Resource type to filter event configurations.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventConfigurationsResponse
        include JSON::Serializable

        # Event configurations of all events for a single resource.

        @[JSON::Field(key: "EventConfigurationsList")]
        getter event_configurations_list : Array(Types::EventConfigurationItem)?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_configurations_list : Array(Types::EventConfigurationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFuotaTasksRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFuotaTasksResponse
        include JSON::Serializable


        @[JSON::Field(key: "FuotaTaskList")]
        getter fuota_task_list : Array(Types::FuotaTask)?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fuota_task_list : Array(Types::FuotaTask)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMulticastGroupsByFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMulticastGroupsByFuotaTaskResponse
        include JSON::Serializable


        @[JSON::Field(key: "MulticastGroupList")]
        getter multicast_group_list : Array(Types::MulticastGroupByFuotaTask)?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multicast_group_list : Array(Types::MulticastGroupByFuotaTask)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMulticastGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMulticastGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "MulticastGroupList")]
        getter multicast_group_list : Array(Types::MulticastGroup)?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multicast_group_list : Array(Types::MulticastGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNetworkAnalyzerConfigurationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNetworkAnalyzerConfigurationsResponse
        include JSON::Serializable

        # The list of network analyzer configurations.

        @[JSON::Field(key: "NetworkAnalyzerConfigurationList")]
        getter network_analyzer_configuration_list : Array(Types::NetworkAnalyzerConfigurations)?

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @network_analyzer_configuration_list : Array(Types::NetworkAnalyzerConfigurations)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnerAccountsRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnerAccountsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Array(Types::SidewalkAccountInfoWithFingerprint)?

        def initialize(
          @next_token : String? = nil,
          @sidewalk : Array(Types::SidewalkAccountInfoWithFingerprint)? = nil
        )
        end
      end


      struct ListPositionConfigurationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Resource type for which position configurations are listed.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListPositionConfigurationsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of position configurations.

        @[JSON::Field(key: "PositionConfigurationList")]
        getter position_configuration_list : Array(Types::PositionConfigurationItem)?

        def initialize(
          @next_token : String? = nil,
          @position_configuration_list : Array(Types::PositionConfigurationItem)? = nil
        )
        end
      end


      struct ListQueuedMessagesRequest
        include JSON::Serializable

        # The ID of a given wireless device which the downlink message packets are being sent.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The wireless device type, whic can be either Sidewalk or LoRaWAN.

        @[JSON::Field(key: "WirelessDeviceType")]
        getter wireless_device_type : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @wireless_device_type : String? = nil
        )
        end
      end


      struct ListQueuedMessagesResponse
        include JSON::Serializable

        # The messages in the downlink queue.

        @[JSON::Field(key: "DownlinkQueueMessagesList")]
        getter downlink_queue_messages_list : Array(Types::DownlinkQueueMessage)?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @downlink_queue_messages_list : Array(Types::DownlinkQueueMessage)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceProfilesRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceProfilesResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of service profiles.

        @[JSON::Field(key: "ServiceProfileList")]
        getter service_profile_list : Array(Types::ServiceProfile)?

        def initialize(
          @next_token : String? = nil,
          @service_profile_list : Array(Types::ServiceProfile)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource for which you want to list tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags to attach to the specified resource. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWirelessDeviceImportTasksRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWirelessDeviceImportTasksResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of import tasks and summary information of onboarding status of devices in each import task.

        @[JSON::Field(key: "WirelessDeviceImportTaskList")]
        getter wireless_device_import_task_list : Array(Types::WirelessDeviceImportTask)?

        def initialize(
          @next_token : String? = nil,
          @wireless_device_import_task_list : Array(Types::WirelessDeviceImportTask)? = nil
        )
        end
      end


      struct ListWirelessDevicesRequest
        include JSON::Serializable

        # A filter to list only the wireless devices that use as uplink destination.

        @[JSON::Field(key: "destinationName")]
        getter destination_name : String?

        # A filter to list only the wireless devices that use this device profile.

        @[JSON::Field(key: "deviceProfileId")]
        getter device_profile_id : String?


        @[JSON::Field(key: "fuotaTaskId")]
        getter fuota_task_id : String?

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "multicastGroupId")]
        getter multicast_group_id : String?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to list only the wireless devices that use this service profile.

        @[JSON::Field(key: "serviceProfileId")]
        getter service_profile_id : String?

        # A filter to list only the wireless devices that use this wireless device type.

        @[JSON::Field(key: "wirelessDeviceType")]
        getter wireless_device_type : String?

        def initialize(
          @destination_name : String? = nil,
          @device_profile_id : String? = nil,
          @fuota_task_id : String? = nil,
          @max_results : Int32? = nil,
          @multicast_group_id : String? = nil,
          @next_token : String? = nil,
          @service_profile_id : String? = nil,
          @wireless_device_type : String? = nil
        )
        end
      end


      struct ListWirelessDevicesResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the wireless device.

        @[JSON::Field(key: "WirelessDeviceList")]
        getter wireless_device_list : Array(Types::WirelessDeviceStatistics)?

        def initialize(
          @next_token : String? = nil,
          @wireless_device_list : Array(Types::WirelessDeviceStatistics)? = nil
        )
        end
      end


      struct ListWirelessGatewayTaskDefinitionsRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to list only the wireless gateway task definitions that use this task definition type.

        @[JSON::Field(key: "taskDefinitionType")]
        getter task_definition_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @task_definition_type : String? = nil
        )
        end
      end


      struct ListWirelessGatewayTaskDefinitionsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of task definitions.

        @[JSON::Field(key: "TaskDefinitions")]
        getter task_definitions : Array(Types::UpdateWirelessGatewayTaskEntry)?

        def initialize(
          @next_token : String? = nil,
          @task_definitions : Array(Types::UpdateWirelessGatewayTaskEntry)? = nil
        )
        end
      end


      struct ListWirelessGatewaysRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWirelessGatewaysResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the wireless gateway.

        @[JSON::Field(key: "WirelessGatewayList")]
        getter wireless_gateway_list : Array(Types::WirelessGatewayStatistics)?

        def initialize(
          @next_token : String? = nil,
          @wireless_gateway_list : Array(Types::WirelessGatewayStatistics)? = nil
        )
        end
      end

      # Object for LoRaWAN connection status resource type event configuration.

      struct LoRaWANConnectionStatusEventNotificationConfigurations
        include JSON::Serializable

        # Denotes whether the gateway EUI connection status event topic is enabled or disabled.

        @[JSON::Field(key: "GatewayEuiEventTopic")]
        getter gateway_eui_event_topic : String?

        def initialize(
          @gateway_eui_event_topic : String? = nil
        )
        end
      end

      # Object for LoRaWAN connection status resource type event configuration.

      struct LoRaWANConnectionStatusResourceTypeEventConfiguration
        include JSON::Serializable

        # Denotes whether the wireless gateway connection status event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessGatewayEventTopic")]
        getter wireless_gateway_event_topic : String?

        def initialize(
          @wireless_gateway_event_topic : String? = nil
        )
        end
      end

      # LoRaWAN object for create functions.

      struct LoRaWANDevice
        include JSON::Serializable

        # LoRaWAN object for create APIs

        @[JSON::Field(key: "AbpV1_0_x")]
        getter abp_v1_0_x : Types::AbpV1_0_x?

        # ABP device object for create APIs for v1.1

        @[JSON::Field(key: "AbpV1_1")]
        getter abp_v1_1 : Types::AbpV1_1?

        # The DevEUI value.

        @[JSON::Field(key: "DevEui")]
        getter dev_eui : String?

        # The ID of the device profile for the new wireless device.

        @[JSON::Field(key: "DeviceProfileId")]
        getter device_profile_id : String?


        @[JSON::Field(key: "FPorts")]
        getter f_ports : Types::FPorts?

        # OTAA device object for create APIs for v1.0.x

        @[JSON::Field(key: "OtaaV1_0_x")]
        getter otaa_v1_0_x : Types::OtaaV1_0_x?

        # OTAA device object for v1.1 for create APIs

        @[JSON::Field(key: "OtaaV1_1")]
        getter otaa_v1_1 : Types::OtaaV1_1?

        # The ID of the service profile.

        @[JSON::Field(key: "ServiceProfileId")]
        getter service_profile_id : String?

        def initialize(
          @abp_v1_0_x : Types::AbpV1_0_x? = nil,
          @abp_v1_1 : Types::AbpV1_1? = nil,
          @dev_eui : String? = nil,
          @device_profile_id : String? = nil,
          @f_ports : Types::FPorts? = nil,
          @otaa_v1_0_x : Types::OtaaV1_0_x? = nil,
          @otaa_v1_1 : Types::OtaaV1_1? = nil,
          @service_profile_id : String? = nil
        )
        end
      end

      # LoRaWAN device metatdata.

      struct LoRaWANDeviceMetadata
        include JSON::Serializable

        # The DataRate value.

        @[JSON::Field(key: "DataRate")]
        getter data_rate : Int32?

        # The DevEUI value.

        @[JSON::Field(key: "DevEui")]
        getter dev_eui : String?

        # The FPort value.

        @[JSON::Field(key: "FPort")]
        getter f_port : Int32?

        # The device's channel frequency in Hz.

        @[JSON::Field(key: "Frequency")]
        getter frequency : Int32?

        # Information about the gateways accessed by the device.

        @[JSON::Field(key: "Gateways")]
        getter gateways : Array(Types::LoRaWANGatewayMetadata)?

        # Information about the LoRaWAN public network accessed by the device.

        @[JSON::Field(key: "PublicGateways")]
        getter public_gateways : Array(Types::LoRaWANPublicGatewayMetadata)?

        # The date and time of the metadata.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String?

        def initialize(
          @data_rate : Int32? = nil,
          @dev_eui : String? = nil,
          @f_port : Int32? = nil,
          @frequency : Int32? = nil,
          @gateways : Array(Types::LoRaWANGatewayMetadata)? = nil,
          @public_gateways : Array(Types::LoRaWANPublicGatewayMetadata)? = nil,
          @timestamp : String? = nil
        )
        end
      end

      # LoRaWANDeviceProfile object.

      struct LoRaWANDeviceProfile
        include JSON::Serializable

        # The ClassBTimeout value.

        @[JSON::Field(key: "ClassBTimeout")]
        getter class_b_timeout : Int32?

        # The ClassCTimeout value.

        @[JSON::Field(key: "ClassCTimeout")]
        getter class_c_timeout : Int32?

        # The list of values that make up the FactoryPresetFreqs value.

        @[JSON::Field(key: "FactoryPresetFreqsList")]
        getter factory_preset_freqs_list : Array(Int32)?

        # The MAC version (such as OTAA 1.1 or OTAA 1.0.3) to use with this device profile.

        @[JSON::Field(key: "MacVersion")]
        getter mac_version : String?

        # The MaxDutyCycle value. It ranges from 0 to 15.

        @[JSON::Field(key: "MaxDutyCycle")]
        getter max_duty_cycle : Int32?

        # The MaxEIRP value.

        @[JSON::Field(key: "MaxEirp")]
        getter max_eirp : Int32?

        # The PingSlotDR value.

        @[JSON::Field(key: "PingSlotDr")]
        getter ping_slot_dr : Int32?

        # The PingSlotFreq value.

        @[JSON::Field(key: "PingSlotFreq")]
        getter ping_slot_freq : Int32?

        # The PingSlotPeriod value.

        @[JSON::Field(key: "PingSlotPeriod")]
        getter ping_slot_period : Int32?

        # The version of regional parameters.

        @[JSON::Field(key: "RegParamsRevision")]
        getter reg_params_revision : String?

        # The frequency band (RFRegion) value.

        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?

        # The RXDataRate2 value.

        @[JSON::Field(key: "RxDataRate2")]
        getter rx_data_rate2 : Int32?

        # The RXDelay1 value.

        @[JSON::Field(key: "RxDelay1")]
        getter rx_delay1 : Int32?

        # The RXDROffset1 value.

        @[JSON::Field(key: "RxDrOffset1")]
        getter rx_dr_offset1 : Int32?

        # The RXFreq2 value.

        @[JSON::Field(key: "RxFreq2")]
        getter rx_freq2 : Int32?

        # The Supports32BitFCnt value.

        @[JSON::Field(key: "Supports32BitFCnt")]
        getter supports32_bit_f_cnt : Bool?

        # The SupportsClassB value.

        @[JSON::Field(key: "SupportsClassB")]
        getter supports_class_b : Bool?

        # The SupportsClassC value.

        @[JSON::Field(key: "SupportsClassC")]
        getter supports_class_c : Bool?

        # The SupportsJoin value.

        @[JSON::Field(key: "SupportsJoin")]
        getter supports_join : Bool?

        def initialize(
          @class_b_timeout : Int32? = nil,
          @class_c_timeout : Int32? = nil,
          @factory_preset_freqs_list : Array(Int32)? = nil,
          @mac_version : String? = nil,
          @max_duty_cycle : Int32? = nil,
          @max_eirp : Int32? = nil,
          @ping_slot_dr : Int32? = nil,
          @ping_slot_freq : Int32? = nil,
          @ping_slot_period : Int32? = nil,
          @reg_params_revision : String? = nil,
          @rf_region : String? = nil,
          @rx_data_rate2 : Int32? = nil,
          @rx_delay1 : Int32? = nil,
          @rx_dr_offset1 : Int32? = nil,
          @rx_freq2 : Int32? = nil,
          @supports32_bit_f_cnt : Bool? = nil,
          @supports_class_b : Bool? = nil,
          @supports_class_c : Bool? = nil,
          @supports_join : Bool? = nil
        )
        end
      end

      # The LoRaWAN information used with a FUOTA task.

      struct LoRaWANFuotaTask
        include JSON::Serializable


        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?

        def initialize(
          @rf_region : String? = nil
        )
        end
      end

      # The LoRaWAN information returned from getting a FUOTA task.

      struct LoRaWANFuotaTaskGetInfo
        include JSON::Serializable


        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?


        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @rf_region : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # LoRaWANGateway object.

      struct LoRaWANGateway
        include JSON::Serializable

        # Beaconing object information, which consists of the data rate and frequency parameters.

        @[JSON::Field(key: "Beaconing")]
        getter beaconing : Types::Beaconing?

        # The gateway's EUI value.

        @[JSON::Field(key: "GatewayEui")]
        getter gateway_eui : String?


        @[JSON::Field(key: "JoinEuiFilters")]
        getter join_eui_filters : Array(Array(String))?

        # The MaxEIRP value.

        @[JSON::Field(key: "MaxEirp")]
        getter max_eirp : Float64?


        @[JSON::Field(key: "NetIdFilters")]
        getter net_id_filters : Array(String)?

        # The frequency band (RFRegion) value.

        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?


        @[JSON::Field(key: "SubBands")]
        getter sub_bands : Array(Int32)?

        def initialize(
          @beaconing : Types::Beaconing? = nil,
          @gateway_eui : String? = nil,
          @join_eui_filters : Array(Array(String))? = nil,
          @max_eirp : Float64? = nil,
          @net_id_filters : Array(String)? = nil,
          @rf_region : String? = nil,
          @sub_bands : Array(Int32)? = nil
        )
        end
      end

      # LoRaWANGatewayCurrentVersion object.

      struct LoRaWANGatewayCurrentVersion
        include JSON::Serializable

        # The version of the gateways that should receive the update.

        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : Types::LoRaWANGatewayVersion?

        def initialize(
          @current_version : Types::LoRaWANGatewayVersion? = nil
        )
        end
      end

      # LoRaWAN gateway metatdata.

      struct LoRaWANGatewayMetadata
        include JSON::Serializable

        # The gateway's EUI value.

        @[JSON::Field(key: "GatewayEui")]
        getter gateway_eui : String?

        # The RSSI value.

        @[JSON::Field(key: "Rssi")]
        getter rssi : Float64?

        # The SNR value.

        @[JSON::Field(key: "Snr")]
        getter snr : Float64?

        def initialize(
          @gateway_eui : String? = nil,
          @rssi : Float64? = nil,
          @snr : Float64? = nil
        )
        end
      end

      # LoRaWANGatewayVersion object.

      struct LoRaWANGatewayVersion
        include JSON::Serializable

        # The model number of the wireless gateway.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The version of the wireless gateway firmware.

        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        # The basic station version of the wireless gateway.

        @[JSON::Field(key: "Station")]
        getter station : String?

        def initialize(
          @model : String? = nil,
          @package_version : String? = nil,
          @station : String? = nil
        )
        end
      end

      # LoRaWANGetServiceProfileInfo object.

      struct LoRaWANGetServiceProfileInfo
        include JSON::Serializable

        # The AddGWMetaData value.

        @[JSON::Field(key: "AddGwMetadata")]
        getter add_gw_metadata : Bool?

        # The ChannelMask value.

        @[JSON::Field(key: "ChannelMask")]
        getter channel_mask : String?

        # The DevStatusReqFreq value.

        @[JSON::Field(key: "DevStatusReqFreq")]
        getter dev_status_req_freq : Int32?

        # The DLBucketSize value.

        @[JSON::Field(key: "DlBucketSize")]
        getter dl_bucket_size : Int32?

        # The DLRate value.

        @[JSON::Field(key: "DlRate")]
        getter dl_rate : Int32?

        # The DLRatePolicy value.

        @[JSON::Field(key: "DlRatePolicy")]
        getter dl_rate_policy : String?

        # The DRMax value.

        @[JSON::Field(key: "DrMax")]
        getter dr_max : Int32?

        # The DRMin value.

        @[JSON::Field(key: "DrMin")]
        getter dr_min : Int32?

        # The HRAllowed value that describes whether handover roaming is allowed.

        @[JSON::Field(key: "HrAllowed")]
        getter hr_allowed : Bool?

        # The MinGwDiversity value.

        @[JSON::Field(key: "MinGwDiversity")]
        getter min_gw_diversity : Int32?

        # The maximum number of transmissions. Default: 3

        @[JSON::Field(key: "NbTransMax")]
        getter nb_trans_max : Int32?

        # The minimum number of transmissions. Default: 0

        @[JSON::Field(key: "NbTransMin")]
        getter nb_trans_min : Int32?

        # The NwkGeoLoc value.

        @[JSON::Field(key: "NwkGeoLoc")]
        getter nwk_geo_loc : Bool?

        # The PRAllowed value that describes whether passive roaming is allowed.

        @[JSON::Field(key: "PrAllowed")]
        getter pr_allowed : Bool?

        # The RAAllowed value that describes whether roaming activation is allowed.

        @[JSON::Field(key: "RaAllowed")]
        getter ra_allowed : Bool?

        # The ReportDevStatusBattery value.

        @[JSON::Field(key: "ReportDevStatusBattery")]
        getter report_dev_status_battery : Bool?

        # The ReportDevStatusMargin value.

        @[JSON::Field(key: "ReportDevStatusMargin")]
        getter report_dev_status_margin : Bool?

        # The TargetPER value.

        @[JSON::Field(key: "TargetPer")]
        getter target_per : Int32?

        # The Transmit Power Index maximum value. Default: 15

        @[JSON::Field(key: "TxPowerIndexMax")]
        getter tx_power_index_max : Int32?

        # The Transmit Power Index minimum value. Default: 0

        @[JSON::Field(key: "TxPowerIndexMin")]
        getter tx_power_index_min : Int32?

        # The ULBucketSize value.

        @[JSON::Field(key: "UlBucketSize")]
        getter ul_bucket_size : Int32?

        # The ULRate value.

        @[JSON::Field(key: "UlRate")]
        getter ul_rate : Int32?

        # The ULRatePolicy value.

        @[JSON::Field(key: "UlRatePolicy")]
        getter ul_rate_policy : String?

        def initialize(
          @add_gw_metadata : Bool? = nil,
          @channel_mask : String? = nil,
          @dev_status_req_freq : Int32? = nil,
          @dl_bucket_size : Int32? = nil,
          @dl_rate : Int32? = nil,
          @dl_rate_policy : String? = nil,
          @dr_max : Int32? = nil,
          @dr_min : Int32? = nil,
          @hr_allowed : Bool? = nil,
          @min_gw_diversity : Int32? = nil,
          @nb_trans_max : Int32? = nil,
          @nb_trans_min : Int32? = nil,
          @nwk_geo_loc : Bool? = nil,
          @pr_allowed : Bool? = nil,
          @ra_allowed : Bool? = nil,
          @report_dev_status_battery : Bool? = nil,
          @report_dev_status_margin : Bool? = nil,
          @target_per : Int32? = nil,
          @tx_power_index_max : Int32? = nil,
          @tx_power_index_min : Int32? = nil,
          @ul_bucket_size : Int32? = nil,
          @ul_rate : Int32? = nil,
          @ul_rate_policy : String? = nil
        )
        end
      end

      # Object for LoRaWAN join resource type event configuration.

      struct LoRaWANJoinEventNotificationConfigurations
        include JSON::Serializable

        # Denotes whether the Dev EUI join event topic is enabled or disabled.

        @[JSON::Field(key: "DevEuiEventTopic")]
        getter dev_eui_event_topic : String?

        def initialize(
          @dev_eui_event_topic : String? = nil
        )
        end
      end

      # Object for LoRaWAN join resource type event configuration.

      struct LoRaWANJoinResourceTypeEventConfiguration
        include JSON::Serializable

        # Denotes whether the wireless device join event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceEventTopic")]
        getter wireless_device_event_topic : String?

        def initialize(
          @wireless_device_event_topic : String? = nil
        )
        end
      end

      # LoRaWAN object for list functions.

      struct LoRaWANListDevice
        include JSON::Serializable

        # The DevEUI value.

        @[JSON::Field(key: "DevEui")]
        getter dev_eui : String?

        def initialize(
          @dev_eui : String? = nil
        )
        end
      end

      # The LoRaWAN information that is to be used with the multicast group.

      struct LoRaWANMulticast
        include JSON::Serializable


        @[JSON::Field(key: "DlClass")]
        getter dl_class : String?


        @[JSON::Field(key: "ParticipatingGateways")]
        getter participating_gateways : Types::ParticipatingGatewaysMulticast?


        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?

        def initialize(
          @dl_class : String? = nil,
          @participating_gateways : Types::ParticipatingGatewaysMulticast? = nil,
          @rf_region : String? = nil
        )
        end
      end

      # The LoRaWAN information that is to be returned from getting multicast group information.

      struct LoRaWANMulticastGet
        include JSON::Serializable


        @[JSON::Field(key: "DlClass")]
        getter dl_class : String?


        @[JSON::Field(key: "NumberOfDevicesInGroup")]
        getter number_of_devices_in_group : Int32?


        @[JSON::Field(key: "NumberOfDevicesRequested")]
        getter number_of_devices_requested : Int32?


        @[JSON::Field(key: "ParticipatingGateways")]
        getter participating_gateways : Types::ParticipatingGatewaysMulticast?


        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?

        def initialize(
          @dl_class : String? = nil,
          @number_of_devices_in_group : Int32? = nil,
          @number_of_devices_requested : Int32? = nil,
          @participating_gateways : Types::ParticipatingGatewaysMulticast? = nil,
          @rf_region : String? = nil
        )
        end
      end

      # The metadata information of the LoRaWAN multicast group.

      struct LoRaWANMulticastMetadata
        include JSON::Serializable


        @[JSON::Field(key: "FPort")]
        getter f_port : Int32?

        def initialize(
          @f_port : Int32? = nil
        )
        end
      end

      # The LoRaWAN information used with the multicast session.

      struct LoRaWANMulticastSession
        include JSON::Serializable


        @[JSON::Field(key: "DlDr")]
        getter dl_dr : Int32?


        @[JSON::Field(key: "DlFreq")]
        getter dl_freq : Int32?

        # The PingSlotPeriod value.

        @[JSON::Field(key: "PingSlotPeriod")]
        getter ping_slot_period : Int32?


        @[JSON::Field(key: "SessionStartTime")]
        getter session_start_time : Time?


        @[JSON::Field(key: "SessionTimeout")]
        getter session_timeout : Int32?

        def initialize(
          @dl_dr : Int32? = nil,
          @dl_freq : Int32? = nil,
          @ping_slot_period : Int32? = nil,
          @session_start_time : Time? = nil,
          @session_timeout : Int32? = nil
        )
        end
      end

      # LoRaWAN public gateway metadata.

      struct LoRaWANPublicGatewayMetadata
        include JSON::Serializable

        # Boolean that indicates whether downlink is allowed using the network.

        @[JSON::Field(key: "DlAllowed")]
        getter dl_allowed : Bool?

        # The ID of the gateways that are operated by the network provider.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ID of the LoRaWAN public network provider.

        @[JSON::Field(key: "ProviderNetId")]
        getter provider_net_id : String?


        @[JSON::Field(key: "RfRegion")]
        getter rf_region : String?

        # The RSSI (received signal strength indicator) value.

        @[JSON::Field(key: "Rssi")]
        getter rssi : Float64?

        # The SNR (signal to noise ratio) value.

        @[JSON::Field(key: "Snr")]
        getter snr : Float64?

        def initialize(
          @dl_allowed : Bool? = nil,
          @id : String? = nil,
          @provider_net_id : String? = nil,
          @rf_region : String? = nil,
          @rssi : Float64? = nil,
          @snr : Float64? = nil
        )
        end
      end

      # LoRaWAN router info.

      struct LoRaWANSendDataToDevice
        include JSON::Serializable


        @[JSON::Field(key: "FPort")]
        getter f_port : Int32?

        # Choose the gateways that you want to use for the downlink data traffic when the wireless device is
        # running in class B or class C mode.

        @[JSON::Field(key: "ParticipatingGateways")]
        getter participating_gateways : Types::ParticipatingGateways?

        def initialize(
          @f_port : Int32? = nil,
          @participating_gateways : Types::ParticipatingGateways? = nil
        )
        end
      end

      # LoRaWANServiceProfile object.

      struct LoRaWANServiceProfile
        include JSON::Serializable

        # The AddGWMetaData value.

        @[JSON::Field(key: "AddGwMetadata")]
        getter add_gw_metadata : Bool?

        # The DrMax value.

        @[JSON::Field(key: "DrMax")]
        getter dr_max : Int32?

        # The DrMin value.

        @[JSON::Field(key: "DrMin")]
        getter dr_min : Int32?

        # The maximum number of transmissions. Default: 3

        @[JSON::Field(key: "NbTransMax")]
        getter nb_trans_max : Int32?

        # The minimum number of transmissions. Default: 0

        @[JSON::Field(key: "NbTransMin")]
        getter nb_trans_min : Int32?

        # The PRAllowed value that describes whether passive roaming is allowed.

        @[JSON::Field(key: "PrAllowed")]
        getter pr_allowed : Bool?

        # The RAAllowed value that describes whether roaming activation is allowed.

        @[JSON::Field(key: "RaAllowed")]
        getter ra_allowed : Bool?

        # The Transmit Power Index maximum. Default: 15

        @[JSON::Field(key: "TxPowerIndexMax")]
        getter tx_power_index_max : Int32?

        # The Transmit Power Index minimum. Default: 0

        @[JSON::Field(key: "TxPowerIndexMin")]
        getter tx_power_index_min : Int32?

        def initialize(
          @add_gw_metadata : Bool? = nil,
          @dr_max : Int32? = nil,
          @dr_min : Int32? = nil,
          @nb_trans_max : Int32? = nil,
          @nb_trans_min : Int32? = nil,
          @pr_allowed : Bool? = nil,
          @ra_allowed : Bool? = nil,
          @tx_power_index_max : Int32? = nil,
          @tx_power_index_min : Int32? = nil
        )
        end
      end

      # The LoRaWAN information used to start a FUOTA task.

      struct LoRaWANStartFuotaTask
        include JSON::Serializable


        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @start_time : Time? = nil
        )
        end
      end

      # LoRaWAN object for update functions.

      struct LoRaWANUpdateDevice
        include JSON::Serializable

        # ABP device object for update APIs for v1.0.x

        @[JSON::Field(key: "AbpV1_0_x")]
        getter abp_v1_0_x : Types::UpdateAbpV1_0_x?

        # ABP device object for update APIs for v1.1

        @[JSON::Field(key: "AbpV1_1")]
        getter abp_v1_1 : Types::UpdateAbpV1_1?

        # The ID of the device profile for the wireless device.

        @[JSON::Field(key: "DeviceProfileId")]
        getter device_profile_id : String?

        # FPorts object for the positioning information of the device.

        @[JSON::Field(key: "FPorts")]
        getter f_ports : Types::UpdateFPorts?

        # The ID of the service profile.

        @[JSON::Field(key: "ServiceProfileId")]
        getter service_profile_id : String?

        def initialize(
          @abp_v1_0_x : Types::UpdateAbpV1_0_x? = nil,
          @abp_v1_1 : Types::UpdateAbpV1_1? = nil,
          @device_profile_id : String? = nil,
          @f_ports : Types::UpdateFPorts? = nil,
          @service_profile_id : String? = nil
        )
        end
      end

      # LoRaWANUpdateGatewayTaskCreate object.

      struct LoRaWANUpdateGatewayTaskCreate
        include JSON::Serializable

        # The version of the gateways that should receive the update.

        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : Types::LoRaWANGatewayVersion?

        # The CRC of the signature private key to check.

        @[JSON::Field(key: "SigKeyCrc")]
        getter sig_key_crc : Int64?

        # The signature used to verify the update firmware.

        @[JSON::Field(key: "UpdateSignature")]
        getter update_signature : String?

        # The firmware version to update the gateway to.

        @[JSON::Field(key: "UpdateVersion")]
        getter update_version : Types::LoRaWANGatewayVersion?

        def initialize(
          @current_version : Types::LoRaWANGatewayVersion? = nil,
          @sig_key_crc : Int64? = nil,
          @update_signature : String? = nil,
          @update_version : Types::LoRaWANGatewayVersion? = nil
        )
        end
      end

      # LoRaWANUpdateGatewayTaskEntry object.

      struct LoRaWANUpdateGatewayTaskEntry
        include JSON::Serializable

        # The version of the gateways that should receive the update.

        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : Types::LoRaWANGatewayVersion?

        # The firmware version to update the gateway to.

        @[JSON::Field(key: "UpdateVersion")]
        getter update_version : Types::LoRaWANGatewayVersion?

        def initialize(
          @current_version : Types::LoRaWANGatewayVersion? = nil,
          @update_version : Types::LoRaWANGatewayVersion? = nil
        )
        end
      end

      # LTE local identification (local ID) information.

      struct LteLocalId
        include JSON::Serializable

        # Evolved universal terrestrial radio access (E-UTRA) absolute radio frequency channel number (FCN).

        @[JSON::Field(key: "Earfcn")]
        getter earfcn : Int32

        # Physical cell ID.

        @[JSON::Field(key: "Pci")]
        getter pci : Int32

        def initialize(
          @earfcn : Int32,
          @pci : Int32
        )
        end
      end

      # LTE object for network measurement reports.

      struct LteNmrObj
        include JSON::Serializable

        # E-UTRA (Evolved universal terrestrial Radio Access) absolute radio frequency channel Number
        # (EARFCN).

        @[JSON::Field(key: "Earfcn")]
        getter earfcn : Int32

        # Physical cell ID.

        @[JSON::Field(key: "Pci")]
        getter pci : Int32

        # E-UTRAN (Evolved Universal Terrestrial Radio Access Network) cell global identifier (EUTRANCID).

        @[JSON::Field(key: "EutranCid")]
        getter eutran_cid : Int32?

        # Signal power of the reference signal received, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "Rsrp")]
        getter rsrp : Int32?

        # Signal quality of the reference Signal received, measured in decibels (dB).

        @[JSON::Field(key: "Rsrq")]
        getter rsrq : Float64?

        def initialize(
          @earfcn : Int32,
          @pci : Int32,
          @eutran_cid : Int32? = nil,
          @rsrp : Int32? = nil,
          @rsrq : Float64? = nil
        )
        end
      end

      # LTE object.

      struct LteObj
        include JSON::Serializable

        # E-UTRAN (Evolved Universal Terrestrial Radio Access Network) Cell Global Identifier.

        @[JSON::Field(key: "EutranCid")]
        getter eutran_cid : Int32

        # Mobile Country Code.

        @[JSON::Field(key: "Mcc")]
        getter mcc : Int32

        # Mobile Network Code.

        @[JSON::Field(key: "Mnc")]
        getter mnc : Int32

        # LTE local identification (local ID) information.

        @[JSON::Field(key: "LteLocalId")]
        getter lte_local_id : Types::LteLocalId?

        # LTE object for network measurement reports.

        @[JSON::Field(key: "LteNmr")]
        getter lte_nmr : Array(Types::LteNmrObj)?

        # LTE timing advance.

        @[JSON::Field(key: "LteTimingAdvance")]
        getter lte_timing_advance : Int32?

        # Parameter that determines whether the LTE object is capable of supporting NR (new radio).

        @[JSON::Field(key: "NrCapable")]
        getter nr_capable : Bool?

        # Signal power of the reference signal received, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "Rsrp")]
        getter rsrp : Int32?

        # Signal quality of the reference Signal received, measured in decibels (dB).

        @[JSON::Field(key: "Rsrq")]
        getter rsrq : Float64?

        # LTE tracking area code.

        @[JSON::Field(key: "Tac")]
        getter tac : Int32?

        def initialize(
          @eutran_cid : Int32,
          @mcc : Int32,
          @mnc : Int32,
          @lte_local_id : Types::LteLocalId? = nil,
          @lte_nmr : Array(Types::LteNmrObj)? = nil,
          @lte_timing_advance : Int32? = nil,
          @nr_capable : Bool? = nil,
          @rsrp : Int32? = nil,
          @rsrq : Float64? = nil,
          @tac : Int32? = nil
        )
        end
      end

      # Message delivery status event configuration object for enabling and disabling relevant topics.

      struct MessageDeliveryStatusEventConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkEventNotificationConfigurations?

        # Denotes whether the wireless device ID message delivery status event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceIdEventTopic")]
        getter wireless_device_id_event_topic : String?

        def initialize(
          @sidewalk : Types::SidewalkEventNotificationConfigurations? = nil,
          @wireless_device_id_event_topic : String? = nil
        )
        end
      end

      # Message delivery status resource type event configuration object for enabling or disabling relevant
      # topic.

      struct MessageDeliveryStatusResourceTypeEventConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkResourceTypeEventConfiguration?

        def initialize(
          @sidewalk : Types::SidewalkResourceTypeEventConfiguration? = nil
        )
        end
      end

      # The aggregated values of the metric.

      struct MetricQueryValue
        include JSON::Serializable

        # The average of the values of all data points collected during the aggregation period.

        @[JSON::Field(key: "Avg")]
        getter avg : Float64?

        # The maximum of the values of all the data points collected during the aggregation period.

        @[JSON::Field(key: "Max")]
        getter max : Float64?

        # The minimum of the values of all data points collected during the aggregation period.

        @[JSON::Field(key: "Min")]
        getter min : Float64?

        # The 90th percentile of the values of all data points collected during the aggregation period.

        @[JSON::Field(key: "P90")]
        getter p90 : Float64?

        # The standard deviation of the values of all data points collected during the aggregation period.

        @[JSON::Field(key: "Std")]
        getter std : Float64?

        # The sum of the values of all data points collected during the aggregation period.

        @[JSON::Field(key: "Sum")]
        getter sum : Float64?

        def initialize(
          @avg : Float64? = nil,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @p90 : Float64? = nil,
          @std : Float64? = nil,
          @sum : Float64? = nil
        )
        end
      end

      # A multicast group.

      struct MulticastGroup
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A multicast group that is associated with a FUOTA task.

      struct MulticastGroupByFuotaTask
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Wireless metadata that is to be sent to multicast group.

      struct MulticastWirelessMetadata
        include JSON::Serializable


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticastMetadata?

        def initialize(
          @lo_ra_wan : Types::LoRaWANMulticastMetadata? = nil
        )
        end
      end

      # Network analyzer configurations.

      struct NetworkAnalyzerConfigurations
        include JSON::Serializable

        # The Amazon Resource Name of the new resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # OTAA device object for v1.0.x

      struct OtaaV1_0_x
        include JSON::Serializable

        # The AppEUI value. You specify this value when using LoRaWAN versions v1.0.2 or v1.0.3.

        @[JSON::Field(key: "AppEui")]
        getter app_eui : String?

        # The AppKey value.

        @[JSON::Field(key: "AppKey")]
        getter app_key : String?

        # The GenAppKey value.

        @[JSON::Field(key: "GenAppKey")]
        getter gen_app_key : String?

        # The JoinEUI value. You specify this value instead of the AppEUI when using LoRaWAN version v1.0.4.

        @[JSON::Field(key: "JoinEui")]
        getter join_eui : String?

        def initialize(
          @app_eui : String? = nil,
          @app_key : String? = nil,
          @gen_app_key : String? = nil,
          @join_eui : String? = nil
        )
        end
      end

      # OTAA device object for v1.1

      struct OtaaV1_1
        include JSON::Serializable

        # The AppKey value.

        @[JSON::Field(key: "AppKey")]
        getter app_key : String?

        # The JoinEUI value.

        @[JSON::Field(key: "JoinEui")]
        getter join_eui : String?

        # The NwkKey value.

        @[JSON::Field(key: "NwkKey")]
        getter nwk_key : String?

        def initialize(
          @app_key : String? = nil,
          @join_eui : String? = nil,
          @nwk_key : String? = nil
        )
        end
      end

      # Specify the list of gateways to which you want to send downlink data traffic when the wireless
      # device is running in class B or class C mode.

      struct ParticipatingGateways
        include JSON::Serializable

        # Indicates whether to send the downlink message in sequential mode or concurrent mode, or to use only
        # the chosen gateways from the previous uplink message transmission.

        @[JSON::Field(key: "DownlinkMode")]
        getter downlink_mode : String

        # The list of gateways that you want to use for sending the downlink data traffic.

        @[JSON::Field(key: "GatewayList")]
        getter gateway_list : Array(Types::GatewayListItem)

        # The duration of time for which AWS IoT Core for LoRaWAN will wait before transmitting the payload to
        # the next gateway.

        @[JSON::Field(key: "TransmissionInterval")]
        getter transmission_interval : Int32

        def initialize(
          @downlink_mode : String,
          @gateway_list : Array(Types::GatewayListItem),
          @transmission_interval : Int32
        )
        end
      end

      # Specify the list of gateways to which you want to send the multicast downlink messages. The
      # multicast message will be sent to each gateway in the list, with the transmission interval as the
      # time interval between each message.

      struct ParticipatingGatewaysMulticast
        include JSON::Serializable

        # The list of gateways that you want to use for sending the multicast downlink message. Each downlink
        # message will be sent to all the gateways in the list in the order that you provided. If the gateway
        # list is empty, then AWS IoT Core for LoRaWAN chooses the gateways that were most recently used by
        # the devices to send an uplink message.

        @[JSON::Field(key: "GatewayList")]
        getter gateway_list : Array(String)?

        # The duration of time in milliseconds for which AWS IoT Core for LoRaWAN will wait before
        # transmitting the multicast payload to the next gateway in the list.

        @[JSON::Field(key: "TransmissionInterval")]
        getter transmission_interval : Int32?

        def initialize(
          @gateway_list : Array(String)? = nil,
          @transmission_interval : Int32? = nil
        )
        end
      end

      # The wrapper for a position configuration.

      struct PositionConfigurationItem
        include JSON::Serializable

        # The position data destination that describes the AWS IoT rule that processes the device's position
        # data for use by AWS IoT Core for LoRaWAN.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # Resource identifier for the position configuration.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Resource type of the resource for the position configuration.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The details of the positioning solver object used to compute the location.

        @[JSON::Field(key: "Solvers")]
        getter solvers : Types::PositionSolverDetails?

        def initialize(
          @destination : String? = nil,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil,
          @solvers : Types::PositionSolverDetails? = nil
        )
        end
      end

      # The wrapper for position solver configurations.

      struct PositionSolverConfigurations
        include JSON::Serializable

        # The Semtech GNSS solver configuration object.

        @[JSON::Field(key: "SemtechGnss")]
        getter semtech_gnss : Types::SemtechGnssConfiguration?

        def initialize(
          @semtech_gnss : Types::SemtechGnssConfiguration? = nil
        )
        end
      end

      # The wrapper for position solver details.

      struct PositionSolverDetails
        include JSON::Serializable

        # The Semtech GNSS solver object details.

        @[JSON::Field(key: "SemtechGnss")]
        getter semtech_gnss : Types::SemtechGnssDetail?

        def initialize(
          @semtech_gnss : Types::SemtechGnssDetail? = nil
        )
        end
      end

      # The FPorts for the position information.

      struct Positioning
        include JSON::Serializable


        @[JSON::Field(key: "ClockSync")]
        getter clock_sync : Int32?


        @[JSON::Field(key: "Gnss")]
        getter gnss : Int32?


        @[JSON::Field(key: "Stream")]
        getter stream : Int32?

        def initialize(
          @clock_sync : Int32? = nil,
          @gnss : Int32? = nil,
          @stream : Int32? = nil
        )
        end
      end

      # Proximity event configuration object for enabling and disabling relevant topics.

      struct ProximityEventConfiguration
        include JSON::Serializable

        # Proximity event configuration object for enabling or disabling Sidewalk related event topics.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkEventNotificationConfigurations?

        # Denotes whether the wireless device ID proximity event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceIdEventTopic")]
        getter wireless_device_id_event_topic : String?

        def initialize(
          @sidewalk : Types::SidewalkEventNotificationConfigurations? = nil,
          @wireless_device_id_event_topic : String? = nil
        )
        end
      end

      # Proximity resource type event configuration object for enabling or disabling topic.

      struct ProximityResourceTypeEventConfiguration
        include JSON::Serializable

        # Proximity resource type event configuration object for enabling and disabling wireless device topic.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkResourceTypeEventConfiguration?

        def initialize(
          @sidewalk : Types::SidewalkResourceTypeEventConfiguration? = nil
        )
        end
      end


      struct PutPositionConfigurationRequest
        include JSON::Serializable

        # Resource identifier used to update the position configuration.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # Resource type of the resource for which you want to update the position configuration.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The position data destination that describes the AWS IoT rule that processes the device's position
        # data for use by AWS IoT Core for LoRaWAN.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The positioning solvers used to update the position configuration of the resource.

        @[JSON::Field(key: "Solvers")]
        getter solvers : Types::PositionSolverConfigurations?

        def initialize(
          @resource_identifier : String,
          @resource_type : String,
          @destination : String? = nil,
          @solvers : Types::PositionSolverConfigurations? = nil
        )
        end
      end


      struct PutPositionConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutResourceLogLevelRequest
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String


        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The type of resource, which can be WirelessDevice , WirelessGateway , or FuotaTask .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @log_level : String,
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct PutResourceLogLevelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ResetAllResourceLogLevelsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct ResetAllResourceLogLevelsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ResetResourceLogLevelRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The type of resource, which can be WirelessDevice , WirelessGateway , or FuotaTask .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct ResetResourceLogLevelResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Id of the not found resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Type of the font found resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Information about the Semtech GNSS solver configuration.

      struct SemtechGnssConfiguration
        include JSON::Serializable

        # Whether forward error correction is enabled.

        @[JSON::Field(key: "Fec")]
        getter fec : String

        # The status indicating whether the solver is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @fec : String,
          @status : String
        )
        end
      end

      # Details of the Semtech GNSS solver object.

      struct SemtechGnssDetail
        include JSON::Serializable

        # Whether forward error correction is enabled.

        @[JSON::Field(key: "Fec")]
        getter fec : String?

        # The vendor of the solver object.

        @[JSON::Field(key: "Provider")]
        getter provider : String?

        # The status indicating whether the solver is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of positioning solver used.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @fec : String? = nil,
          @provider : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct SendDataToMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "PayloadData")]
        getter payload_data : String


        @[JSON::Field(key: "WirelessMetadata")]
        getter wireless_metadata : Types::MulticastWirelessMetadata

        def initialize(
          @id : String,
          @payload_data : String,
          @wireless_metadata : Types::MulticastWirelessMetadata
        )
        end
      end


      struct SendDataToMulticastGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end


      struct SendDataToWirelessDeviceRequest
        include JSON::Serializable

        # The ID of the wireless device to receive the data.

        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "PayloadData")]
        getter payload_data : String

        # The transmit mode to use to send data to the wireless device. Can be: 0 for UM (unacknowledge mode)
        # or 1 for AM (acknowledge mode).

        @[JSON::Field(key: "TransmitMode")]
        getter transmit_mode : Int32

        # Metadata about the message request.

        @[JSON::Field(key: "WirelessMetadata")]
        getter wireless_metadata : Types::WirelessMetadata?

        def initialize(
          @id : String,
          @payload_data : String,
          @transmit_mode : Int32,
          @wireless_metadata : Types::WirelessMetadata? = nil
        )
        end
      end


      struct SendDataToWirelessDeviceResponse
        include JSON::Serializable

        # The ID of the message sent to the wireless device.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # Information about a service profile.

      struct ServiceProfile
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the service profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Session keys for ABP v1.1

      struct SessionKeysAbpV1_0_x
        include JSON::Serializable

        # The AppSKey value.

        @[JSON::Field(key: "AppSKey")]
        getter app_s_key : String?

        # The NwkSKey value.

        @[JSON::Field(key: "NwkSKey")]
        getter nwk_s_key : String?

        def initialize(
          @app_s_key : String? = nil,
          @nwk_s_key : String? = nil
        )
        end
      end

      # Session keys for ABP v1.1

      struct SessionKeysAbpV1_1
        include JSON::Serializable

        # The AppSKey value.

        @[JSON::Field(key: "AppSKey")]
        getter app_s_key : String?

        # The FNwkSIntKey value.

        @[JSON::Field(key: "FNwkSIntKey")]
        getter f_nwk_s_int_key : String?

        # The NwkSEncKey value.

        @[JSON::Field(key: "NwkSEncKey")]
        getter nwk_s_enc_key : String?

        # The SNwkSIntKey value.

        @[JSON::Field(key: "SNwkSIntKey")]
        getter s_nwk_s_int_key : String?

        def initialize(
          @app_s_key : String? = nil,
          @f_nwk_s_int_key : String? = nil,
          @nwk_s_enc_key : String? = nil,
          @s_nwk_s_int_key : String? = nil
        )
        end
      end

      # Information about a Sidewalk account.

      struct SidewalkAccountInfo
        include JSON::Serializable

        # The Sidewalk Amazon ID.

        @[JSON::Field(key: "AmazonId")]
        getter amazon_id : String?

        # The Sidewalk application server private key.

        @[JSON::Field(key: "AppServerPrivateKey")]
        getter app_server_private_key : String?

        def initialize(
          @amazon_id : String? = nil,
          @app_server_private_key : String? = nil
        )
        end
      end

      # Information about a Sidewalk account.

      struct SidewalkAccountInfoWithFingerprint
        include JSON::Serializable

        # The Sidewalk Amazon ID.

        @[JSON::Field(key: "AmazonId")]
        getter amazon_id : String?

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The fingerprint of the Sidewalk application server private key.

        @[JSON::Field(key: "Fingerprint")]
        getter fingerprint : String?

        def initialize(
          @amazon_id : String? = nil,
          @arn : String? = nil,
          @fingerprint : String? = nil
        )
        end
      end

      # Sidewalk object for creating a device profile.

      struct SidewalkCreateDeviceProfile
        include JSON::Serializable

        def initialize
        end
      end

      # Sidewalk object for creating a wireless device.

      struct SidewalkCreateWirelessDevice
        include JSON::Serializable

        # The ID of the Sidewalk device profile.

        @[JSON::Field(key: "DeviceProfileId")]
        getter device_profile_id : String?

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The Sidewalk manufacturing serial number.

        @[JSON::Field(key: "SidewalkManufacturingSn")]
        getter sidewalk_manufacturing_sn : String?

        def initialize(
          @device_profile_id : String? = nil,
          @positioning : Types::SidewalkPositioning? = nil,
          @sidewalk_manufacturing_sn : String? = nil
        )
        end
      end

      # Sidewalk device object.

      struct SidewalkDevice
        include JSON::Serializable


        @[JSON::Field(key: "AmazonId")]
        getter amazon_id : String?

        # The ID of the Sidewalk device profile.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        # The sidewalk device certificates for Ed25519 and P256r1.

        @[JSON::Field(key: "DeviceCertificates")]
        getter device_certificates : Array(Types::CertificateList)?

        # The ID of the Sidewalk device profile.

        @[JSON::Field(key: "DeviceProfileId")]
        getter device_profile_id : String?

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The Sidewalk device private keys that will be used for onboarding the device.

        @[JSON::Field(key: "PrivateKeys")]
        getter private_keys : Array(Types::CertificateList)?

        # The sidewalk device identification.

        @[JSON::Field(key: "SidewalkId")]
        getter sidewalk_id : String?

        # The Sidewalk manufacturing series number.

        @[JSON::Field(key: "SidewalkManufacturingSn")]
        getter sidewalk_manufacturing_sn : String?

        # The Sidewalk device status, such as provisioned or registered.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @amazon_id : String? = nil,
          @certificate_id : String? = nil,
          @device_certificates : Array(Types::CertificateList)? = nil,
          @device_profile_id : String? = nil,
          @positioning : Types::SidewalkPositioning? = nil,
          @private_keys : Array(Types::CertificateList)? = nil,
          @sidewalk_id : String? = nil,
          @sidewalk_manufacturing_sn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # MetaData for Sidewalk device.

      struct SidewalkDeviceMetadata
        include JSON::Serializable

        # Sidewalk device battery level.

        @[JSON::Field(key: "BatteryLevel")]
        getter battery_level : String?

        # Device state defines the device status of sidewalk device.

        @[JSON::Field(key: "DeviceState")]
        getter device_state : String?

        # Sidewalk device status notification.

        @[JSON::Field(key: "Event")]
        getter event : String?

        # The RSSI value.

        @[JSON::Field(key: "Rssi")]
        getter rssi : Int32?

        def initialize(
          @battery_level : String? = nil,
          @device_state : String? = nil,
          @event : String? = nil,
          @rssi : Int32? = nil
        )
        end
      end

      # SidewalkEventNotificationConfigurations object, which is the event configuration object for
      # Sidewalk-related event topics.

      struct SidewalkEventNotificationConfigurations
        include JSON::Serializable

        # Denotes whether the Amazon ID event topic is enabled or disabled.

        @[JSON::Field(key: "AmazonIdEventTopic")]
        getter amazon_id_event_topic : String?

        def initialize(
          @amazon_id_event_topic : String? = nil
        )
        end
      end

      # Gets information about a Sidewalk device profile.

      struct SidewalkGetDeviceProfile
        include JSON::Serializable

        # The Sidewalk application server public key.

        @[JSON::Field(key: "ApplicationServerPublicKey")]
        getter application_server_public_key : String?

        # The DAK certificate information of the Sidewalk device profile.

        @[JSON::Field(key: "DakCertificateMetadata")]
        getter dak_certificate_metadata : Array(Types::DakCertificateMetadata)?

        # Gets information about the certification status of a Sidewalk device profile.

        @[JSON::Field(key: "QualificationStatus")]
        getter qualification_status : Bool?

        def initialize(
          @application_server_public_key : String? = nil,
          @dak_certificate_metadata : Array(Types::DakCertificateMetadata)? = nil,
          @qualification_status : Bool? = nil
        )
        end
      end

      # Sidewalk-related information for devices in an import task that are being onboarded.

      struct SidewalkGetStartImportInfo
        include JSON::Serializable

        # List of Sidewalk devices that are added to the import task.

        @[JSON::Field(key: "DeviceCreationFileList")]
        getter device_creation_file_list : Array(String)?

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The IAM role that allows AWS IoT Wireless to access the CSV file in the S3 bucket.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @device_creation_file_list : Array(String)? = nil,
          @positioning : Types::SidewalkPositioning? = nil,
          @role : String? = nil
        )
        end
      end

      # Sidewalk object used by list functions.

      struct SidewalkListDevice
        include JSON::Serializable

        # The Sidewalk Amazon ID.

        @[JSON::Field(key: "AmazonId")]
        getter amazon_id : String?

        # The sidewalk device certificates for Ed25519 and P256r1.

        @[JSON::Field(key: "DeviceCertificates")]
        getter device_certificates : Array(Types::CertificateList)?

        # Sidewalk object used by list functions.

        @[JSON::Field(key: "DeviceProfileId")]
        getter device_profile_id : String?

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The sidewalk device identification.

        @[JSON::Field(key: "SidewalkId")]
        getter sidewalk_id : String?

        # The Sidewalk manufacturing series number.

        @[JSON::Field(key: "SidewalkManufacturingSn")]
        getter sidewalk_manufacturing_sn : String?

        # The status of the Sidewalk devices, such as provisioned or registered.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @amazon_id : String? = nil,
          @device_certificates : Array(Types::CertificateList)? = nil,
          @device_profile_id : String? = nil,
          @positioning : Types::SidewalkPositioning? = nil,
          @sidewalk_id : String? = nil,
          @sidewalk_manufacturing_sn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The Sidewalk-related object containing positioning information used to configure Sidewalk devices
      # during import.

      struct SidewalkListDevicesForImportInfo
        include JSON::Serializable

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        def initialize(
          @positioning : Types::SidewalkPositioning? = nil
        )
        end
      end

      # The Positioning object of the Sidewalk device.

      struct SidewalkPositioning
        include JSON::Serializable

        # The location destination name of the Sidewalk device.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        def initialize(
          @destination_name : String? = nil
        )
        end
      end

      # Sidewalk resource type event configuration object for enabling or disabling topic.

      struct SidewalkResourceTypeEventConfiguration
        include JSON::Serializable

        # Denotes whether the wireless device join event topic is enabled or disabled.

        @[JSON::Field(key: "WirelessDeviceEventTopic")]
        getter wireless_device_event_topic : String?

        def initialize(
          @wireless_device_event_topic : String? = nil
        )
        end
      end

      # Information about a Sidewalk router.

      struct SidewalkSendDataToDevice
        include JSON::Serializable

        # The duration of time in seconds to retry sending the ACK.

        @[JSON::Field(key: "AckModeRetryDurationSecs")]
        getter ack_mode_retry_duration_secs : Int32?


        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The sequence number.

        @[JSON::Field(key: "Seq")]
        getter seq : Int32?

        def initialize(
          @ack_mode_retry_duration_secs : Int32? = nil,
          @message_type : String? = nil,
          @seq : Int32? = nil
        )
        end
      end

      # Information about an import task created for an individual Sidewalk device.

      struct SidewalkSingleStartImportInfo
        include JSON::Serializable

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The Sidewalk manufacturing serial number (SMSN) of the device added to the import task.

        @[JSON::Field(key: "SidewalkManufacturingSn")]
        getter sidewalk_manufacturing_sn : String?

        def initialize(
          @positioning : Types::SidewalkPositioning? = nil,
          @sidewalk_manufacturing_sn : String? = nil
        )
        end
      end

      # Information about an import task created for bulk provisioning.

      struct SidewalkStartImportInfo
        include JSON::Serializable

        # The CSV file contained in an S3 bucket that's used for adding devices to an import task.

        @[JSON::Field(key: "DeviceCreationFile")]
        getter device_creation_file : String?

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        # The IAM role that allows AWS IoT Wireless to access the CSV file in the S3 bucket.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @device_creation_file : String? = nil,
          @positioning : Types::SidewalkPositioning? = nil,
          @role : String? = nil
        )
        end
      end

      # Sidewalk update.

      struct SidewalkUpdateAccount
        include JSON::Serializable

        # The new Sidewalk application server private key.

        @[JSON::Field(key: "AppServerPrivateKey")]
        getter app_server_private_key : String?

        def initialize(
          @app_server_private_key : String? = nil
        )
        end
      end

      # Sidewalk object information for updating an import task.

      struct SidewalkUpdateImportInfo
        include JSON::Serializable

        # The CSV file contained in an S3 bucket that's used for appending devices to an existing import task.

        @[JSON::Field(key: "DeviceCreationFile")]
        getter device_creation_file : String?

        def initialize(
          @device_creation_file : String? = nil
        )
        end
      end

      # Sidewalk object for updating a wireless device.

      struct SidewalkUpdateWirelessDevice
        include JSON::Serializable

        # The Positioning object of the Sidewalk device.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::SidewalkPositioning?

        def initialize(
          @positioning : Types::SidewalkPositioning? = nil
        )
        end
      end


      struct StartBulkAssociateWirelessDeviceWithMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "QueryString")]
        getter query_string : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @id : String,
          @query_string : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartBulkAssociateWirelessDeviceWithMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartBulkDisassociateWirelessDeviceFromMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "QueryString")]
        getter query_string : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @id : String,
          @query_string : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartBulkDisassociateWirelessDeviceFromMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANStartFuotaTask?

        def initialize(
          @id : String,
          @lo_ra_wan : Types::LoRaWANStartFuotaTask? = nil
        )
        end
      end


      struct StartFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartMulticastGroupSessionRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticastSession

        def initialize(
          @id : String,
          @lo_ra_wan : Types::LoRaWANMulticastSession
        )
        end
      end


      struct StartMulticastGroupSessionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartSingleWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The name of the Sidewalk destination that describes the IoT rule to route messages from the device
        # in the import task that will be onboarded to AWS IoT Wireless.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String

        # The Sidewalk-related parameters for importing a single wireless device.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkSingleStartImportInfo


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The name of the wireless device for which an import task is being started.

        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The integration status of the Device Location feature for Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination_name : String,
          @sidewalk : Types::SidewalkSingleStartImportInfo,
          @client_request_token : String? = nil,
          @device_name : String? = nil,
          @positioning : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartSingleWirelessDeviceImportTaskResponse
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the import task.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The import task ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct StartWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The name of the Sidewalk destination that describes the IoT rule to route messages from the devices
        # in the import task that are onboarded to AWS IoT Wireless.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String

        # The Sidewalk-related parameters for importing wireless devices that need to be provisioned in bulk.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkStartImportInfo


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The integration status of the Device Location feature for Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination_name : String,
          @sidewalk : Types::SidewalkStartImportInfo,
          @client_request_token : String? = nil,
          @positioning : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartWirelessDeviceImportTaskResponse
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the import task.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The import task ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The configuration of summary metrics.

      struct SummaryMetricConfiguration
        include JSON::Serializable

        # The status of the configuration of summary metrics.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The summary metric query object.

      struct SummaryMetricQuery
        include JSON::Serializable

        # The aggregation period of the summary metric.

        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The dimensions of the summary metric.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # The end timestamp for the summary metric query.

        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The id of the summary metric query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The start timestamp for the summary metric query.

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        def initialize(
          @aggregation_period : String? = nil,
          @dimensions : Array(Types::Dimension)? = nil,
          @end_timestamp : Time? = nil,
          @metric_name : String? = nil,
          @query_id : String? = nil,
          @start_timestamp : Time? = nil
        )
        end
      end

      # The result of the summary metrics aggregation operation.

      struct SummaryMetricQueryResult
        include JSON::Serializable

        # The aggregation period of the metric.

        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The dimensions of the metric.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # The end timestamp for the summary metric query.

        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # The error message for the summary metric query result.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The name of the summary metric query result.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The ID of the summary metric results query operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The status of the summary metric query result.

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String?

        # The start timestamp for the summary metric query.

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        # The timestamp of each aggregation result.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)?

        # The units of measurement to be used for interpreting the aggregation result.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # The list of aggregated summary metric query results.

        @[JSON::Field(key: "Values")]
        getter values : Array(Types::MetricQueryValue)?

        def initialize(
          @aggregation_period : String? = nil,
          @dimensions : Array(Types::Dimension)? = nil,
          @end_timestamp : Time? = nil,
          @error : String? = nil,
          @metric_name : String? = nil,
          @query_id : String? = nil,
          @query_status : String? = nil,
          @start_timestamp : Time? = nil,
          @timestamps : Array(Time)? = nil,
          @unit : String? = nil,
          @values : Array(Types::MetricQueryValue)? = nil
        )
        end
      end

      # A simple label consisting of a customer-defined key-value pair

      struct Tag
        include JSON::Serializable

        # The tag's key value.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Adds to or modifies the tags of the given resource. Tags are metadata that you can use to manage a
        # resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # TD-SCDMA local identification (local Id) information.

      struct TdscdmaLocalId
        include JSON::Serializable

        # Cell parameters for TD-SCDMA.

        @[JSON::Field(key: "CellParams")]
        getter cell_params : Int32

        # TD-SCDMA UTRA (Universal Terrestrial Radio Access Network) absolute RF channel number (UARFCN).

        @[JSON::Field(key: "Uarfcn")]
        getter uarfcn : Int32

        def initialize(
          @cell_params : Int32,
          @uarfcn : Int32
        )
        end
      end

      # TD-SCDMA object for network measurement reports.

      struct TdscdmaNmrObj
        include JSON::Serializable

        # Cell parameters for TD-SCDMA network measurement reports object.

        @[JSON::Field(key: "CellParams")]
        getter cell_params : Int32

        # TD-SCDMA UTRA (Universal Terrestrial Radio Access Network) absolute RF channel number.

        @[JSON::Field(key: "Uarfcn")]
        getter uarfcn : Int32

        # Path loss, or path attenuation, is the reduction in power density of an electromagnetic wave as it
        # propagates through space.

        @[JSON::Field(key: "PathLoss")]
        getter path_loss : Int32?

        # Code power of the received signal, measured in decibel-milliwatts (dBm).

        @[JSON::Field(key: "Rscp")]
        getter rscp : Int32?

        # UTRAN (UMTS Terrestrial Radio Access Network) cell global identifier.

        @[JSON::Field(key: "UtranCid")]
        getter utran_cid : Int32?

        def initialize(
          @cell_params : Int32,
          @uarfcn : Int32,
          @path_loss : Int32? = nil,
          @rscp : Int32? = nil,
          @utran_cid : Int32? = nil
        )
        end
      end

      # TD-SCDMA object.

      struct TdscdmaObj
        include JSON::Serializable

        # Mobile Country Code.

        @[JSON::Field(key: "Mcc")]
        getter mcc : Int32

        # Mobile Network Code.

        @[JSON::Field(key: "Mnc")]
        getter mnc : Int32

        # UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.

        @[JSON::Field(key: "UtranCid")]
        getter utran_cid : Int32

        # Location Area Code.

        @[JSON::Field(key: "Lac")]
        getter lac : Int32?

        # Path loss, or path attenuation, is the reduction in power density of an electromagnetic wave as it
        # propagates through space.

        @[JSON::Field(key: "PathLoss")]
        getter path_loss : Int32?

        # Signal power of the received signal (Received Signal Code Power), measured in decibel-milliwatts
        # (dBm).

        @[JSON::Field(key: "Rscp")]
        getter rscp : Int32?

        # TD-SCDMA local identification (local ID) information.

        @[JSON::Field(key: "TdscdmaLocalId")]
        getter tdscdma_local_id : Types::TdscdmaLocalId?

        # TD-SCDMA object for network measurement reports.

        @[JSON::Field(key: "TdscdmaNmr")]
        getter tdscdma_nmr : Array(Types::TdscdmaNmrObj)?

        # TD-SCDMA Timing advance.

        @[JSON::Field(key: "TdscdmaTimingAdvance")]
        getter tdscdma_timing_advance : Int32?

        def initialize(
          @mcc : Int32,
          @mnc : Int32,
          @utran_cid : Int32,
          @lac : Int32? = nil,
          @path_loss : Int32? = nil,
          @rscp : Int32? = nil,
          @tdscdma_local_id : Types::TdscdmaLocalId? = nil,
          @tdscdma_nmr : Array(Types::TdscdmaNmrObj)? = nil,
          @tdscdma_timing_advance : Int32? = nil
        )
        end
      end


      struct TestWirelessDeviceRequest
        include JSON::Serializable

        # The ID of the wireless device to test.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct TestWirelessDeviceResponse
        include JSON::Serializable

        # The result returned by the test.

        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @result : String? = nil
        )
        end
      end

      # The request was denied because it exceeded the allowed API request rate.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied because the resource can't have any more tags.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Name of the resource that exceeds maximum number of tags allowed.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Trace content for your wireless devices, gateways, and multicast groups.

      struct TraceContent
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?


        @[JSON::Field(key: "MulticastFrameInfo")]
        getter multicast_frame_info : String?


        @[JSON::Field(key: "WirelessDeviceFrameInfo")]
        getter wireless_device_frame_info : String?

        def initialize(
          @log_level : String? = nil,
          @multicast_frame_info : String? = nil,
          @wireless_device_frame_info : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of the keys of the tags to remove from the resource.

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

      # ABP device object for LoRaWAN specification v1.0.x

      struct UpdateAbpV1_0_x
        include JSON::Serializable

        # The FCnt init value.

        @[JSON::Field(key: "FCntStart")]
        getter f_cnt_start : Int32?

        def initialize(
          @f_cnt_start : Int32? = nil
        )
        end
      end

      # ABP device object for LoRaWAN specification v1.1

      struct UpdateAbpV1_1
        include JSON::Serializable

        # The FCnt init value.

        @[JSON::Field(key: "FCntStart")]
        getter f_cnt_start : Int32?

        def initialize(
          @f_cnt_start : Int32? = nil
        )
        end
      end


      struct UpdateDestinationRequest
        include JSON::Serializable

        # The new name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A new description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new rule name or topic rule to send messages to.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # The type of value in Expression .

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String?

        # The ARN of the IAM Role that authorizes the destination.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @expression : String? = nil,
          @expression_type : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateEventConfigurationByResourceTypesRequest
        include JSON::Serializable

        # Connection status resource type event configuration object for enabling and disabling wireless
        # gateway topic.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::ConnectionStatusResourceTypeEventConfiguration?

        # Device registration state resource type event configuration object for enabling and disabling
        # wireless gateway topic.

        @[JSON::Field(key: "DeviceRegistrationState")]
        getter device_registration_state : Types::DeviceRegistrationStateResourceTypeEventConfiguration?

        # Join resource type event configuration object for enabling and disabling wireless device topic.

        @[JSON::Field(key: "Join")]
        getter join : Types::JoinResourceTypeEventConfiguration?

        # Message delivery status resource type event configuration object for enabling and disabling wireless
        # device topic.

        @[JSON::Field(key: "MessageDeliveryStatus")]
        getter message_delivery_status : Types::MessageDeliveryStatusResourceTypeEventConfiguration?

        # Proximity resource type event configuration object for enabling and disabling wireless gateway
        # topic.

        @[JSON::Field(key: "Proximity")]
        getter proximity : Types::ProximityResourceTypeEventConfiguration?

        def initialize(
          @connection_status : Types::ConnectionStatusResourceTypeEventConfiguration? = nil,
          @device_registration_state : Types::DeviceRegistrationStateResourceTypeEventConfiguration? = nil,
          @join : Types::JoinResourceTypeEventConfiguration? = nil,
          @message_delivery_status : Types::MessageDeliveryStatusResourceTypeEventConfiguration? = nil,
          @proximity : Types::ProximityResourceTypeEventConfiguration? = nil
        )
        end
      end


      struct UpdateEventConfigurationByResourceTypesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Object for updating the FPorts information.

      struct UpdateFPorts
        include JSON::Serializable

        # LoRaWAN application, which can be used for geolocation by activating positioning.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::ApplicationConfig)?

        # Positioning FPorts for the ClockSync, Stream, and GNSS functions.

        @[JSON::Field(key: "Positioning")]
        getter positioning : Types::Positioning?

        def initialize(
          @applications : Array(Types::ApplicationConfig)? = nil,
          @positioning : Types::Positioning? = nil
        )
        end
      end


      struct UpdateFuotaTaskRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Descriptor")]
        getter descriptor : String?


        @[JSON::Field(key: "FirmwareUpdateImage")]
        getter firmware_update_image : String?


        @[JSON::Field(key: "FirmwareUpdateRole")]
        getter firmware_update_role : String?


        @[JSON::Field(key: "FragmentIntervalMS")]
        getter fragment_interval_ms : Int32?


        @[JSON::Field(key: "FragmentSizeBytes")]
        getter fragment_size_bytes : Int32?


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANFuotaTask?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "RedundancyPercent")]
        getter redundancy_percent : Int32?

        def initialize(
          @id : String,
          @description : String? = nil,
          @descriptor : String? = nil,
          @firmware_update_image : String? = nil,
          @firmware_update_role : String? = nil,
          @fragment_interval_ms : Int32? = nil,
          @fragment_size_bytes : Int32? = nil,
          @lo_ra_wan : Types::LoRaWANFuotaTask? = nil,
          @name : String? = nil,
          @redundancy_percent : Int32? = nil
        )
        end
      end


      struct UpdateFuotaTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLogLevelsByResourceTypesRequest
        include JSON::Serializable


        @[JSON::Field(key: "DefaultLogLevel")]
        getter default_log_level : String?


        @[JSON::Field(key: "FuotaTaskLogOptions")]
        getter fuota_task_log_options : Array(Types::FuotaTaskLogOption)?


        @[JSON::Field(key: "WirelessDeviceLogOptions")]
        getter wireless_device_log_options : Array(Types::WirelessDeviceLogOption)?


        @[JSON::Field(key: "WirelessGatewayLogOptions")]
        getter wireless_gateway_log_options : Array(Types::WirelessGatewayLogOption)?

        def initialize(
          @default_log_level : String? = nil,
          @fuota_task_log_options : Array(Types::FuotaTaskLogOption)? = nil,
          @wireless_device_log_options : Array(Types::WirelessDeviceLogOption)? = nil,
          @wireless_gateway_log_options : Array(Types::WirelessGatewayLogOption)? = nil
        )
        end
      end


      struct UpdateLogLevelsByResourceTypesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMetricConfigurationRequest
        include JSON::Serializable

        # The value to be used to set summary metric configuration.

        @[JSON::Field(key: "SummaryMetric")]
        getter summary_metric : Types::SummaryMetricConfiguration?

        def initialize(
          @summary_metric : Types::SummaryMetricConfiguration? = nil
        )
        end
      end


      struct UpdateMetricConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMulticastGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANMulticast?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String,
          @description : String? = nil,
          @lo_ra_wan : Types::LoRaWANMulticast? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateMulticastGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateNetworkAnalyzerConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String


        @[JSON::Field(key: "Description")]
        getter description : String?

        # Multicast group resources to add to the network analyzer configuration. Provide the MulticastGroupId
        # of the resource to add in the input array.

        @[JSON::Field(key: "MulticastGroupsToAdd")]
        getter multicast_groups_to_add : Array(String)?

        # Multicast group resources to remove from the network analyzer configuration. Provide the
        # MulticastGroupId of the resources to remove in the input array.

        @[JSON::Field(key: "MulticastGroupsToRemove")]
        getter multicast_groups_to_remove : Array(String)?


        @[JSON::Field(key: "TraceContent")]
        getter trace_content : Types::TraceContent?

        # Wireless device resources to add to the network analyzer configuration. Provide the WirelessDeviceId
        # of the resource to add in the input array.

        @[JSON::Field(key: "WirelessDevicesToAdd")]
        getter wireless_devices_to_add : Array(String)?

        # Wireless device resources to remove from the network analyzer configuration. Provide the
        # WirelessDeviceId of the resources to remove in the input array.

        @[JSON::Field(key: "WirelessDevicesToRemove")]
        getter wireless_devices_to_remove : Array(String)?

        # Wireless gateway resources to add to the network analyzer configuration. Provide the
        # WirelessGatewayId of the resource to add in the input array.

        @[JSON::Field(key: "WirelessGatewaysToAdd")]
        getter wireless_gateways_to_add : Array(String)?

        # Wireless gateway resources to remove from the network analyzer configuration. Provide the
        # WirelessGatewayId of the resources to remove in the input array.

        @[JSON::Field(key: "WirelessGatewaysToRemove")]
        getter wireless_gateways_to_remove : Array(String)?

        def initialize(
          @configuration_name : String,
          @description : String? = nil,
          @multicast_groups_to_add : Array(String)? = nil,
          @multicast_groups_to_remove : Array(String)? = nil,
          @trace_content : Types::TraceContent? = nil,
          @wireless_devices_to_add : Array(String)? = nil,
          @wireless_devices_to_remove : Array(String)? = nil,
          @wireless_gateways_to_add : Array(String)? = nil,
          @wireless_gateways_to_remove : Array(String)? = nil
        )
        end
      end


      struct UpdateNetworkAnalyzerConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePartnerAccountRequest
        include JSON::Serializable

        # The ID of the partner account to update.

        @[JSON::Field(key: "PartnerAccountId")]
        getter partner_account_id : String

        # The partner type.

        @[JSON::Field(key: "partnerType")]
        getter partner_type : String

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkUpdateAccount

        def initialize(
          @partner_account_id : String,
          @partner_type : String,
          @sidewalk : Types::SidewalkUpdateAccount
        )
        end
      end


      struct UpdatePartnerAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePositionRequest
        include JSON::Serializable

        # The position information of the resource.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Resource identifier of the resource for which position is updated.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # Resource type of the resource for which position is updated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @position : Array(Float64),
          @resource_identifier : String,
          @resource_type : String
        )
        end
      end


      struct UpdatePositionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateResourceEventConfigurationRequest
        include JSON::Serializable

        # Resource identifier to opt in for event messaging.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Identifier type of the particular resource identifier for event configuration.

        @[JSON::Field(key: "identifierType")]
        getter identifier_type : String

        # Event configuration for the connection status event.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::ConnectionStatusEventConfiguration?

        # Event configuration for the device registration state event.

        @[JSON::Field(key: "DeviceRegistrationState")]
        getter device_registration_state : Types::DeviceRegistrationStateEventConfiguration?

        # Event configuration for the join event.

        @[JSON::Field(key: "Join")]
        getter join : Types::JoinEventConfiguration?

        # Event configuration for the message delivery status event.

        @[JSON::Field(key: "MessageDeliveryStatus")]
        getter message_delivery_status : Types::MessageDeliveryStatusEventConfiguration?

        # Partner type of the resource if the identifier type is PartnerAccountId

        @[JSON::Field(key: "partnerType")]
        getter partner_type : String?

        # Event configuration for the proximity event.

        @[JSON::Field(key: "Proximity")]
        getter proximity : Types::ProximityEventConfiguration?

        def initialize(
          @identifier : String,
          @identifier_type : String,
          @connection_status : Types::ConnectionStatusEventConfiguration? = nil,
          @device_registration_state : Types::DeviceRegistrationStateEventConfiguration? = nil,
          @join : Types::JoinEventConfiguration? = nil,
          @message_delivery_status : Types::MessageDeliveryStatusEventConfiguration? = nil,
          @partner_type : String? = nil,
          @proximity : Types::ProximityEventConfiguration? = nil
        )
        end
      end


      struct UpdateResourceEventConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateResourcePositionRequest
        include JSON::Serializable

        # The identifier of the resource for which position information is updated. It can be the wireless
        # device ID or the wireless gateway ID, depending on the resource type.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The type of resource for which position information is updated, which can be a wireless device or a
        # wireless gateway.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The position information of the resource, displayed as a JSON payload. The payload uses the GeoJSON
        # format, which a format that's used to encode geographic data structures. For more information, see
        # GeoJSON .

        @[JSON::Field(key: "GeoJsonPayload")]
        getter geo_json_payload : Bytes?

        def initialize(
          @resource_identifier : String,
          @resource_type : String,
          @geo_json_payload : Bytes? = nil
        )
        end
      end


      struct UpdateResourcePositionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWirelessDeviceImportTaskRequest
        include JSON::Serializable

        # The identifier of the import task to be updated.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Sidewalk-related parameters of the import task to be updated.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkUpdateImportInfo

        def initialize(
          @id : String,
          @sidewalk : Types::SidewalkUpdateImportInfo
        )
        end
      end


      struct UpdateWirelessDeviceImportTaskResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWirelessDeviceRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A new description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the new destination for the device.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The updated wireless device's configuration.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANUpdateDevice?

        # The new name of the resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The integration status of the Device Location feature for LoRaWAN and Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The updated sidewalk properties.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkUpdateWirelessDevice?

        def initialize(
          @id : String,
          @description : String? = nil,
          @destination_name : String? = nil,
          @lo_ra_wan : Types::LoRaWANUpdateDevice? = nil,
          @name : String? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkUpdateWirelessDevice? = nil
        )
        end
      end


      struct UpdateWirelessDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWirelessGatewayRequest
        include JSON::Serializable

        # The ID of the resource to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A new description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "JoinEuiFilters")]
        getter join_eui_filters : Array(Array(String))?

        # The MaxEIRP value.

        @[JSON::Field(key: "MaxEirp")]
        getter max_eirp : Float64?

        # The new name of the resource. The following special characters aren't accepted: &lt;&gt;^#~$

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "NetIdFilters")]
        getter net_id_filters : Array(String)?

        def initialize(
          @id : String,
          @description : String? = nil,
          @join_eui_filters : Array(Array(String))? = nil,
          @max_eirp : Float64? = nil,
          @name : String? = nil,
          @net_id_filters : Array(String)? = nil
        )
        end
      end


      struct UpdateWirelessGatewayResponse
        include JSON::Serializable

        def initialize
        end
      end

      # UpdateWirelessGatewayTaskCreate object.

      struct UpdateWirelessGatewayTaskCreate
        include JSON::Serializable

        # The properties that relate to the LoRaWAN wireless gateway.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANUpdateGatewayTaskCreate?

        # The IAM role used to read data from the S3 bucket.

        @[JSON::Field(key: "UpdateDataRole")]
        getter update_data_role : String?

        # The link to the S3 bucket.

        @[JSON::Field(key: "UpdateDataSource")]
        getter update_data_source : String?

        def initialize(
          @lo_ra_wan : Types::LoRaWANUpdateGatewayTaskCreate? = nil,
          @update_data_role : String? = nil,
          @update_data_source : String? = nil
        )
        end
      end

      # UpdateWirelessGatewayTaskEntry object.

      struct UpdateWirelessGatewayTaskEntry
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the new wireless gateway task entry.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The properties that relate to the LoRaWAN wireless gateway.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANUpdateGatewayTaskEntry?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @lo_ra_wan : Types::LoRaWANUpdateGatewayTaskEntry? = nil
        )
        end
      end

      # The input did not meet the specified constraints.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WCDMA local identification (local ID) information.

      struct WcdmaLocalId
        include JSON::Serializable

        # Primary Scrambling Code.

        @[JSON::Field(key: "Psc")]
        getter psc : Int32

        # WCDMA UTRA Absolute RF Channel Number downlink.

        @[JSON::Field(key: "Uarfcndl")]
        getter uarfcndl : Int32

        def initialize(
          @psc : Int32,
          @uarfcndl : Int32
        )
        end
      end

      # Network Measurement Reports.

      struct WcdmaNmrObj
        include JSON::Serializable

        # Primary Scrambling Code.

        @[JSON::Field(key: "Psc")]
        getter psc : Int32

        # WCDMA UTRA Absolute RF Channel Number downlink.

        @[JSON::Field(key: "Uarfcndl")]
        getter uarfcndl : Int32

        # UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.

        @[JSON::Field(key: "UtranCid")]
        getter utran_cid : Int32

        # Path loss, or path attenuation, is the reduction in power density of an electromagnetic wave as it
        # propagates through space.

        @[JSON::Field(key: "PathLoss")]
        getter path_loss : Int32?

        # Received Signal Code Power (signal power) (dBm)

        @[JSON::Field(key: "Rscp")]
        getter rscp : Int32?

        def initialize(
          @psc : Int32,
          @uarfcndl : Int32,
          @utran_cid : Int32,
          @path_loss : Int32? = nil,
          @rscp : Int32? = nil
        )
        end
      end

      # WCDMA.

      struct WcdmaObj
        include JSON::Serializable

        # Mobile Country Code.

        @[JSON::Field(key: "Mcc")]
        getter mcc : Int32

        # Mobile Network Code.

        @[JSON::Field(key: "Mnc")]
        getter mnc : Int32

        # UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.

        @[JSON::Field(key: "UtranCid")]
        getter utran_cid : Int32

        # Location Area Code.

        @[JSON::Field(key: "Lac")]
        getter lac : Int32?

        # Path loss, or path attenuation, is the reduction in power density of an electromagnetic wave as it
        # propagates through space.

        @[JSON::Field(key: "PathLoss")]
        getter path_loss : Int32?

        # Received Signal Code Power (signal power) (dBm).

        @[JSON::Field(key: "Rscp")]
        getter rscp : Int32?

        # WCDMA local ID information.

        @[JSON::Field(key: "WcdmaLocalId")]
        getter wcdma_local_id : Types::WcdmaLocalId?

        # WCDMA object for network measurement reports.

        @[JSON::Field(key: "WcdmaNmr")]
        getter wcdma_nmr : Array(Types::WcdmaNmrObj)?

        def initialize(
          @mcc : Int32,
          @mnc : Int32,
          @utran_cid : Int32,
          @lac : Int32? = nil,
          @path_loss : Int32? = nil,
          @rscp : Int32? = nil,
          @wcdma_local_id : Types::WcdmaLocalId? = nil,
          @wcdma_nmr : Array(Types::WcdmaNmrObj)? = nil
        )
        end
      end

      # Wi-Fi access point.

      struct WiFiAccessPoint
        include JSON::Serializable

        # Wi-Fi MAC Address.

        @[JSON::Field(key: "MacAddress")]
        getter mac_address : String

        # Received signal strength (dBm) of the WLAN measurement data.

        @[JSON::Field(key: "Rss")]
        getter rss : Int32

        def initialize(
          @mac_address : String,
          @rss : Int32
        )
        end
      end

      # The log options for a wireless device event and can be used to set log levels for a specific
      # wireless device event. For a LoRaWAN device, possible events for a log messsage are: Join , Rejoin ,
      # Downlink_Data , and Uplink_Data . For a Sidewalk device, possible events for a log message are
      # Registration , Downlink_Data , and Uplink_Data .

      struct WirelessDeviceEventLogOption
        include JSON::Serializable


        @[JSON::Field(key: "Event")]
        getter event : String


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        def initialize(
          @event : String,
          @log_level : String
        )
        end
      end

      # Information about an import task for wireless devices.

      struct WirelessDeviceImportTask
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the wireless device import task.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the import task was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The name of the Sidewalk destination that that describes the IoT rule to route messages from the
        # device in the import task that will be onboarded to AWS IoT Wireless

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The summary information of count of wireless devices in an import task that failed to onboarded to
        # the import task.

        @[JSON::Field(key: "FailedImportedDeviceCount")]
        getter failed_imported_device_count : Int64?

        # The ID of the wireless device import task.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The summary information of count of wireless devices that are waiting for the control log to be
        # added to an import task.

        @[JSON::Field(key: "InitializedImportedDeviceCount")]
        getter initialized_imported_device_count : Int64?

        # The summary information of count of wireless devices in an import task that have been onboarded to
        # the import task.

        @[JSON::Field(key: "OnboardedImportedDeviceCount")]
        getter onboarded_imported_device_count : Int64?

        # The summary information of count of wireless devices in an import task that are waiting in the queue
        # to be onboarded.

        @[JSON::Field(key: "PendingImportedDeviceCount")]
        getter pending_imported_device_count : Int64?

        # The integration status of the Device Location feature for Sidewalk devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The Sidewalk-related information of the wireless device import task.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkGetStartImportInfo?

        # The status information of the wireless device import task.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason that provides additional information about the import task status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @destination_name : String? = nil,
          @failed_imported_device_count : Int64? = nil,
          @id : String? = nil,
          @initialized_imported_device_count : Int64? = nil,
          @onboarded_imported_device_count : Int64? = nil,
          @pending_imported_device_count : Int64? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkGetStartImportInfo? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The log options for wireless devices and can be used to set log levels for a specific type of
      # wireless device.

      struct WirelessDeviceLogOption
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        # The wireless device type.

        @[JSON::Field(key: "Type")]
        getter type : String


        @[JSON::Field(key: "Events")]
        getter events : Array(Types::WirelessDeviceEventLogOption)?

        def initialize(
          @log_level : String,
          @type : String,
          @events : Array(Types::WirelessDeviceEventLogOption)? = nil
        )
        end
      end

      # Information about a wireless device's operation.

      struct WirelessDeviceStatistics
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the destination to which the device is assigned.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?


        @[JSON::Field(key: "FuotaDeviceStatus")]
        getter fuota_device_status : String?

        # The ID of the wireless device reporting the data.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time when the most recent uplink was received. Theis value is only valid for 3 months.

        @[JSON::Field(key: "LastUplinkReceivedAt")]
        getter last_uplink_received_at : String?

        # LoRaWAN device info.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANListDevice?


        @[JSON::Field(key: "McGroupId")]
        getter mc_group_id : Int32?

        # The status of the wireless device in the multicast group.

        @[JSON::Field(key: "MulticastDeviceStatus")]
        getter multicast_device_status : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The integration status of the Device Location feature for LoRaWAN and Amazon Sidewalk enabled
        # devices.

        @[JSON::Field(key: "Positioning")]
        getter positioning : String?

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkListDevice?

        # The wireless device type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @destination_name : String? = nil,
          @fuota_device_status : String? = nil,
          @id : String? = nil,
          @last_uplink_received_at : String? = nil,
          @lo_ra_wan : Types::LoRaWANListDevice? = nil,
          @mc_group_id : Int32? = nil,
          @multicast_device_status : String? = nil,
          @name : String? = nil,
          @positioning : String? = nil,
          @sidewalk : Types::SidewalkListDevice? = nil,
          @type : String? = nil
        )
        end
      end

      # The log options for a wireless gateway event and can be used to set log levels for a specific
      # wireless gateway event. For a LoRaWAN gateway, possible events for a log message are CUPS_Request
      # and Certificate .

      struct WirelessGatewayEventLogOption
        include JSON::Serializable


        @[JSON::Field(key: "Event")]
        getter event : String


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        def initialize(
          @event : String,
          @log_level : String
        )
        end
      end

      # The log options for wireless gateways and can be used to set log levels for a specific type of
      # wireless gateway.

      struct WirelessGatewayLogOption
        include JSON::Serializable


        @[JSON::Field(key: "LogLevel")]
        getter log_level : String


        @[JSON::Field(key: "Type")]
        getter type : String


        @[JSON::Field(key: "Events")]
        getter events : Array(Types::WirelessGatewayEventLogOption)?

        def initialize(
          @log_level : String,
          @type : String,
          @events : Array(Types::WirelessGatewayEventLogOption)? = nil
        )
        end
      end

      # Information about a wireless gateway's operation.

      struct WirelessGatewayStatistics
        include JSON::Serializable

        # The Amazon Resource Name of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the wireless gateway reporting the data.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time when the most recent uplink was received. This value is only valid for 3 months.

        @[JSON::Field(key: "LastUplinkReceivedAt")]
        getter last_uplink_received_at : String?

        # LoRaWAN gateway info.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANGateway?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_uplink_received_at : String? = nil,
          @lo_ra_wan : Types::LoRaWANGateway? = nil,
          @name : String? = nil
        )
        end
      end

      # WirelessMetadata object.

      struct WirelessMetadata
        include JSON::Serializable

        # LoRaWAN device info.

        @[JSON::Field(key: "LoRaWAN")]
        getter lo_ra_wan : Types::LoRaWANSendDataToDevice?

        # The Sidewalk account credentials.

        @[JSON::Field(key: "Sidewalk")]
        getter sidewalk : Types::SidewalkSendDataToDevice?

        def initialize(
          @lo_ra_wan : Types::LoRaWANSendDataToDevice? = nil,
          @sidewalk : Types::SidewalkSendDataToDevice? = nil
        )
        end
      end
    end
  end
end
