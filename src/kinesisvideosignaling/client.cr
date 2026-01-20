module Aws
  module KinesisVideoSignaling
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

      # Gets the Interactive Connectivity Establishment (ICE) server configuration information, including
      # URIs, username, and password which can be used to configure the WebRTC connection. The ICE component
      # uses this configuration information to setup the WebRTC connection, including authenticating with
      # the Traversal Using Relays around NAT (TURN) relay server. TURN is a protocol that is used to
      # improve the connectivity of peer-to-peer applications. By providing a cloud-based relay service,
      # TURN ensures that a connection can be established even when one or more peers are incapable of a
      # direct peer-to-peer connection. For more information, see A REST API For Access To TURN Services .
      # You can invoke this API to establish a fallback mechanism in case either of the peers is unable to
      # establish a direct peer-to-peer connection over a signaling channel. You must specify either a
      # signaling channel ARN or the client ID in order to invoke this API.

      def get_ice_server_config(
        channel_arn : String,
        client_id : String? = nil,
        service : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::GetIceServerConfigRequest.new(channel_arn: channel_arn, client_id: client_id, service: service, username: username)
        get_ice_server_config(input)
      end

      def get_ice_server_config(input : Types::GetIceServerConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ICE_SERVER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API allows you to connect WebRTC-enabled devices with Alexa display devices. When invoked, it
      # sends the Alexa Session Description Protocol (SDP) offer to the master peer. The offer is delivered
      # as soon as the master is connected to the specified signaling channel. This API returns the SDP
      # answer from the connected master. If the master is not connected to the signaling channel,
      # redelivery requests are made until the message expires.

      def send_alexa_offer_to_master(
        channel_arn : String,
        message_payload : String,
        sender_client_id : String
      ) : Protocol::Request
        input = Types::SendAlexaOfferToMasterRequest.new(channel_arn: channel_arn, message_payload: message_payload, sender_client_id: sender_client_id)
        send_alexa_offer_to_master(input)
      end

      def send_alexa_offer_to_master(input : Types::SendAlexaOfferToMasterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_ALEXA_OFFER_TO_MASTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
