module Aws
  module ChimeSDKVoice
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

      # Associates phone numbers with the specified Amazon Chime SDK Voice Connector.

      def associate_phone_numbers_with_voice_connector(
        e164_phone_numbers : Array(String),
        voice_connector_id : String,
        force_associate : Bool? = nil
      ) : Protocol::Request
        input = Types::AssociatePhoneNumbersWithVoiceConnectorRequest.new(e164_phone_numbers: e164_phone_numbers, voice_connector_id: voice_connector_id, force_associate: force_associate)
        associate_phone_numbers_with_voice_connector(input)
      end

      def associate_phone_numbers_with_voice_connector(input : Types::AssociatePhoneNumbersWithVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PHONE_NUMBERS_WITH_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates phone numbers with the specified Amazon Chime SDK Voice Connector group.

      def associate_phone_numbers_with_voice_connector_group(
        e164_phone_numbers : Array(String),
        voice_connector_group_id : String,
        force_associate : Bool? = nil
      ) : Protocol::Request
        input = Types::AssociatePhoneNumbersWithVoiceConnectorGroupRequest.new(e164_phone_numbers: e164_phone_numbers, voice_connector_group_id: voice_connector_group_id, force_associate: force_associate)
        associate_phone_numbers_with_voice_connector_group(input)
      end

      def associate_phone_numbers_with_voice_connector_group(input : Types::AssociatePhoneNumbersWithVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PHONE_NUMBERS_WITH_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Moves phone numbers into the Deletion queue . Phone numbers must be disassociated from any users or
      # Amazon Chime SDK Voice Connectors before they can be deleted. Phone numbers remain in the Deletion
      # queue for 7 days before they are deleted permanently.

      def batch_delete_phone_number(
        phone_number_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeletePhoneNumberRequest.new(phone_number_ids: phone_number_ids)
        batch_delete_phone_number(input)
      end

      def batch_delete_phone_number(input : Types::BatchDeletePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates phone number product types, calling names, or phone number names. You can update one
      # attribute at a time for each UpdatePhoneNumberRequestItem . For example, you can update the product
      # type, the calling name, or phone name. You cannot have a duplicate phoneNumberId in a request.

      def batch_update_phone_number(
        update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)
      ) : Protocol::Request
        input = Types::BatchUpdatePhoneNumberRequest.new(update_phone_number_request_items: update_phone_number_request_items)
        batch_update_phone_number(input)
      end

      def batch_update_phone_number(input : Types::BatchUpdatePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an order for phone numbers to be provisioned. For numbers outside the U.S., you must use the
      # Amazon Chime SDK SIP media application dial-in product type.

      def create_phone_number_order(
        e164_phone_numbers : Array(String),
        product_type : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::CreatePhoneNumberOrderRequest.new(e164_phone_numbers: e164_phone_numbers, product_type: product_type, name: name)
        create_phone_number_order(input)
      end

      def create_phone_number_order(input : Types::CreatePhoneNumberOrderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PHONE_NUMBER_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a proxy session for the specified Amazon Chime SDK Voice Connector for the specified
      # participant phone numbers.

      def create_proxy_session(
        capabilities : Array(String),
        participant_phone_numbers : Array(String),
        voice_connector_id : String,
        expiry_minutes : Int32? = nil,
        geo_match_level : String? = nil,
        geo_match_params : Types::GeoMatchParams? = nil,
        name : String? = nil,
        number_selection_behavior : String? = nil
      ) : Protocol::Request
        input = Types::CreateProxySessionRequest.new(capabilities: capabilities, participant_phone_numbers: participant_phone_numbers, voice_connector_id: voice_connector_id, expiry_minutes: expiry_minutes, geo_match_level: geo_match_level, geo_match_params: geo_match_params, name: name, number_selection_behavior: number_selection_behavior)
        create_proxy_session(input)
      end

      def create_proxy_session(input : Types::CreateProxySessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROXY_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a SIP media application. For more information about SIP media applications, see Managing SIP
      # media applications and rules in the Amazon Chime SDK Administrator Guide .

      def create_sip_media_application(
        aws_region : String,
        endpoints : Array(Types::SipMediaApplicationEndpoint),
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSipMediaApplicationRequest.new(aws_region: aws_region, endpoints: endpoints, name: name, tags: tags)
        create_sip_media_application(input)
      end

      def create_sip_media_application(input : Types::CreateSipMediaApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SIP_MEDIA_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an outbound call to a phone number from the phone number specified in the request, and it
      # invokes the endpoint of the specified sipMediaApplicationId .

      def create_sip_media_application_call(
        from_phone_number : String,
        sip_media_application_id : String,
        to_phone_number : String,
        arguments_map : Hash(String, String)? = nil,
        sip_headers : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSipMediaApplicationCallRequest.new(from_phone_number: from_phone_number, sip_media_application_id: sip_media_application_id, to_phone_number: to_phone_number, arguments_map: arguments_map, sip_headers: sip_headers)
        create_sip_media_application_call(input)
      end

      def create_sip_media_application_call(input : Types::CreateSipMediaApplicationCallRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SIP_MEDIA_APPLICATION_CALL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a SIP rule, which can be used to run a SIP media application as a target for a specific
      # trigger type. For more information about SIP rules, see Managing SIP media applications and rules in
      # the Amazon Chime SDK Administrator Guide .

      def create_sip_rule(
        name : String,
        trigger_type : String,
        trigger_value : String,
        disabled : Bool? = nil,
        target_applications : Array(Types::SipRuleTargetApplication)? = nil
      ) : Protocol::Request
        input = Types::CreateSipRuleRequest.new(name: name, trigger_type: trigger_type, trigger_value: trigger_value, disabled: disabled, target_applications: target_applications)
        create_sip_rule(input)
      end

      def create_sip_rule(input : Types::CreateSipRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SIP_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Chime SDK Voice Connector. For more information about Voice Connectors, see
      # Managing Amazon Chime SDK Voice Connector groups in the Amazon Chime SDK Administrator Guide .

      def create_voice_connector(
        name : String,
        require_encryption : Bool,
        aws_region : String? = nil,
        integration_type : String? = nil,
        network_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateVoiceConnectorRequest.new(name: name, require_encryption: require_encryption, aws_region: aws_region, integration_type: integration_type, network_type: network_type, tags: tags)
        create_voice_connector(input)
      end

      def create_voice_connector(input : Types::CreateVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Chime SDK Voice Connector group under the administrator's AWS account. You can
      # associate Amazon Chime SDK Voice Connectors with the Voice Connector group by including
      # VoiceConnectorItems in the request. You can include Voice Connectors from different AWS Regions in
      # your group. This creates a fault tolerant mechanism for fallback in case of availability events.

      def create_voice_connector_group(
        name : String,
        voice_connector_items : Array(Types::VoiceConnectorItem)? = nil
      ) : Protocol::Request
        input = Types::CreateVoiceConnectorGroupRequest.new(name: name, voice_connector_items: voice_connector_items)
        create_voice_connector_group(input)
      end

      def create_voice_connector_group(input : Types::CreateVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a voice profile, which consists of an enrolled user and their latest voice print. Before
      # creating any voice profiles, you must provide all notices and obtain all consents from the speaker
      # as required under applicable privacy and biometrics laws, and as required under the AWS service
      # terms for the Amazon Chime SDK. For more information about voice profiles and voice analytics, see
      # Using Amazon Chime SDK Voice Analytics in the Amazon Chime SDK Developer Guide .

      def create_voice_profile(
        speaker_search_task_id : String
      ) : Protocol::Request
        input = Types::CreateVoiceProfileRequest.new(speaker_search_task_id: speaker_search_task_id)
        create_voice_profile(input)
      end

      def create_voice_profile(input : Types::CreateVoiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a voice profile domain, a collection of voice profiles, their voice prints, and encrypted
      # enrollment audio. Before creating any voice profiles, you must provide all notices and obtain all
      # consents from the speaker as required under applicable privacy and biometrics laws, and as required
      # under the AWS service terms for the Amazon Chime SDK. For more information about voice profile
      # domains, see Using Amazon Chime SDK Voice Analytics in the Amazon Chime SDK Developer Guide .

      def create_voice_profile_domain(
        name : String,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateVoiceProfileDomainRequest.new(name: name, server_side_encryption_configuration: server_side_encryption_configuration, client_request_token: client_request_token, description: description, tags: tags)
        create_voice_profile_domain(input)
      end

      def create_voice_profile_domain(input : Types::CreateVoiceProfileDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOICE_PROFILE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Moves the specified phone number into the Deletion queue . A phone number must be disassociated from
      # any users or Amazon Chime SDK Voice Connectors before it can be deleted. Deleted phone numbers
      # remain in the Deletion queue queue for 7 days before they are deleted permanently.

      def delete_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::DeletePhoneNumberRequest.new(phone_number_id: phone_number_id)
        delete_phone_number(input)
      end

      def delete_phone_number(input : Types::DeletePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified proxy session from the specified Amazon Chime SDK Voice Connector.

      def delete_proxy_session(
        proxy_session_id : String,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteProxySessionRequest.new(proxy_session_id: proxy_session_id, voice_connector_id: voice_connector_id)
        delete_proxy_session(input)
      end

      def delete_proxy_session(input : Types::DeleteProxySessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROXY_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a SIP media application.

      def delete_sip_media_application(
        sip_media_application_id : String
      ) : Protocol::Request
        input = Types::DeleteSipMediaApplicationRequest.new(sip_media_application_id: sip_media_application_id)
        delete_sip_media_application(input)
      end

      def delete_sip_media_application(input : Types::DeleteSipMediaApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SIP_MEDIA_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a SIP rule.

      def delete_sip_rule(
        sip_rule_id : String
      ) : Protocol::Request
        input = Types::DeleteSipRuleRequest.new(sip_rule_id: sip_rule_id)
        delete_sip_rule(input)
      end

      def delete_sip_rule(input : Types::DeleteSipRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SIP_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Chime SDK Voice Connector. Any phone numbers associated with the Amazon Chime SDK
      # Voice Connector must be disassociated from it before it can be deleted.

      def delete_voice_connector(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector(input)
      end

      def delete_voice_connector(input : Types::DeleteVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the emergency calling details from the specified Amazon Chime SDK Voice Connector.

      def delete_voice_connector_emergency_calling_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorEmergencyCallingConfigurationRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_emergency_calling_configuration(input)
      end

      def delete_voice_connector_emergency_calling_configuration(input : Types::DeleteVoiceConnectorEmergencyCallingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the external systems configuration for a Voice Connector.

      def delete_voice_connector_external_systems_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorExternalSystemsConfigurationRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_external_systems_configuration(input)
      end

      def delete_voice_connector_external_systems_configuration(input : Types::DeleteVoiceConnectorExternalSystemsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Chime SDK Voice Connector group. Any VoiceConnectorItems and phone numbers
      # associated with the group must be removed before it can be deleted.

      def delete_voice_connector_group(
        voice_connector_group_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorGroupRequest.new(voice_connector_group_id: voice_connector_group_id)
        delete_voice_connector_group(input)
      end

      def delete_voice_connector_group(input : Types::DeleteVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the origination settings for the specified Amazon Chime SDK Voice Connector. If emergency
      # calling is configured for the Voice Connector, it must be deleted prior to deleting the origination
      # settings.

      def delete_voice_connector_origination(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorOriginationRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_origination(input)
      end

      def delete_voice_connector_origination(input : Types::DeleteVoiceConnectorOriginationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_ORIGINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the proxy configuration from the specified Amazon Chime SDK Voice Connector.

      def delete_voice_connector_proxy(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorProxyRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_proxy(input)
      end

      def delete_voice_connector_proxy(input : Types::DeleteVoiceConnectorProxyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_PROXY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Voice Connector's streaming configuration.

      def delete_voice_connector_streaming_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorStreamingConfigurationRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_streaming_configuration(input)
      end

      def delete_voice_connector_streaming_configuration(input : Types::DeleteVoiceConnectorStreamingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_STREAMING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the termination settings for the specified Amazon Chime SDK Voice Connector. If emergency
      # calling is configured for the Voice Connector, it must be deleted prior to deleting the termination
      # settings.

      def delete_voice_connector_termination(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorTerminationRequest.new(voice_connector_id: voice_connector_id)
        delete_voice_connector_termination(input)
      end

      def delete_voice_connector_termination(input : Types::DeleteVoiceConnectorTerminationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_TERMINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified SIP credentials used by your equipment to authenticate during call
      # termination.

      def delete_voice_connector_termination_credentials(
        usernames : Array(String),
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceConnectorTerminationCredentialsRequest.new(usernames: usernames, voice_connector_id: voice_connector_id)
        delete_voice_connector_termination_credentials(input)
      end

      def delete_voice_connector_termination_credentials(input : Types::DeleteVoiceConnectorTerminationCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_CONNECTOR_TERMINATION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a voice profile, including its voice print and enrollment data. WARNING: This action is not
      # reversible.

      def delete_voice_profile(
        voice_profile_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceProfileRequest.new(voice_profile_id: voice_profile_id)
        delete_voice_profile(input)
      end

      def delete_voice_profile(input : Types::DeleteVoiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all voice profiles in the domain. WARNING: This action is not reversible.

      def delete_voice_profile_domain(
        voice_profile_domain_id : String
      ) : Protocol::Request
        input = Types::DeleteVoiceProfileDomainRequest.new(voice_profile_domain_id: voice_profile_domain_id)
        delete_voice_profile_domain(input)
      end

      def delete_voice_profile_domain(input : Types::DeleteVoiceProfileDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOICE_PROFILE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the specified phone numbers from the specified Amazon Chime SDK Voice Connector.

      def disassociate_phone_numbers_from_voice_connector(
        e164_phone_numbers : Array(String),
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::DisassociatePhoneNumbersFromVoiceConnectorRequest.new(e164_phone_numbers: e164_phone_numbers, voice_connector_id: voice_connector_id)
        disassociate_phone_numbers_from_voice_connector(input)
      end

      def disassociate_phone_numbers_from_voice_connector(input : Types::DisassociatePhoneNumbersFromVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PHONE_NUMBERS_FROM_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the specified phone numbers from the specified Amazon Chime SDK Voice Connector group.

      def disassociate_phone_numbers_from_voice_connector_group(
        e164_phone_numbers : Array(String),
        voice_connector_group_id : String
      ) : Protocol::Request
        input = Types::DisassociatePhoneNumbersFromVoiceConnectorGroupRequest.new(e164_phone_numbers: e164_phone_numbers, voice_connector_group_id: voice_connector_group_id)
        disassociate_phone_numbers_from_voice_connector_group(input)
      end

      def disassociate_phone_numbers_from_voice_connector_group(input : Types::DisassociatePhoneNumbersFromVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PHONE_NUMBERS_FROM_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the global settings for the Amazon Chime SDK Voice Connectors in an AWS account.


      def get_global_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOBAL_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified phone number ID, such as associations, capabilities, and product
      # type.

      def get_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::GetPhoneNumberRequest.new(phone_number_id: phone_number_id)
        get_phone_number(input)
      end

      def get_phone_number(input : Types::GetPhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified phone number order, such as the order creation timestamp, phone
      # numbers in E.164 format, product type, and order status.

      def get_phone_number_order(
        phone_number_order_id : String
      ) : Protocol::Request
        input = Types::GetPhoneNumberOrderRequest.new(phone_number_order_id: phone_number_order_id)
        get_phone_number_order(input)
      end

      def get_phone_number_order(input : Types::GetPhoneNumberOrderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the phone number settings for the administrator's AWS account, such as the default
      # outbound calling name.


      def get_phone_number_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified proxy session details for the specified Amazon Chime SDK Voice Connector.

      def get_proxy_session(
        proxy_session_id : String,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetProxySessionRequest.new(proxy_session_id: proxy_session_id, voice_connector_id: voice_connector_id)
        get_proxy_session(input)
      end

      def get_proxy_session(input : Types::GetProxySessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROXY_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the information for a SIP media application, including name, AWS Region, and endpoints.

      def get_sip_media_application(
        sip_media_application_id : String
      ) : Protocol::Request
        input = Types::GetSipMediaApplicationRequest.new(sip_media_application_id: sip_media_application_id)
        get_sip_media_application(input)
      end

      def get_sip_media_application(input : Types::GetSipMediaApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIP_MEDIA_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Alexa Skill configuration for the SIP media application. Due to changes made by the Amazon
      # Alexa service, this API is no longer available for use. For more information, refer to the Alexa
      # Smart Properties page.

      def get_sip_media_application_alexa_skill_configuration(
        sip_media_application_id : String
      ) : Protocol::Request
        input = Types::GetSipMediaApplicationAlexaSkillConfigurationRequest.new(sip_media_application_id: sip_media_application_id)
        get_sip_media_application_alexa_skill_configuration(input)
      end

      def get_sip_media_application_alexa_skill_configuration(input : Types::GetSipMediaApplicationAlexaSkillConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIP_MEDIA_APPLICATION_ALEXA_SKILL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the logging configuration for the specified SIP media application.

      def get_sip_media_application_logging_configuration(
        sip_media_application_id : String
      ) : Protocol::Request
        input = Types::GetSipMediaApplicationLoggingConfigurationRequest.new(sip_media_application_id: sip_media_application_id)
        get_sip_media_application_logging_configuration(input)
      end

      def get_sip_media_application_logging_configuration(input : Types::GetSipMediaApplicationLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIP_MEDIA_APPLICATION_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a SIP rule, such as the rule ID, name, triggers, and target endpoints.

      def get_sip_rule(
        sip_rule_id : String
      ) : Protocol::Request
        input = Types::GetSipRuleRequest.new(sip_rule_id: sip_rule_id)
        get_sip_rule(input)
      end

      def get_sip_rule(input : Types::GetSipRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIP_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the specified speaker search task.

      def get_speaker_search_task(
        speaker_search_task_id : String,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetSpeakerSearchTaskRequest.new(speaker_search_task_id: speaker_search_task_id, voice_connector_id: voice_connector_id)
        get_speaker_search_task(input)
      end

      def get_speaker_search_task(input : Types::GetSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified Amazon Chime SDK Voice Connector, such as timestamps,name,
      # outbound host, and encryption requirements.

      def get_voice_connector(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector(input)
      end

      def get_voice_connector(input : Types::GetVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the emergency calling configuration details for the specified Voice Connector.

      def get_voice_connector_emergency_calling_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorEmergencyCallingConfigurationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_emergency_calling_configuration(input)
      end

      def get_voice_connector_emergency_calling_configuration(input : Types::GetVoiceConnectorEmergencyCallingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an external systems configuration for a Voice Connector.

      def get_voice_connector_external_systems_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorExternalSystemsConfigurationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_external_systems_configuration(input)
      end

      def get_voice_connector_external_systems_configuration(input : Types::GetVoiceConnectorExternalSystemsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified Amazon Chime SDK Voice Connector group, such as timestamps,name,
      # and associated VoiceConnectorItems .

      def get_voice_connector_group(
        voice_connector_group_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorGroupRequest.new(voice_connector_group_id: voice_connector_group_id)
        get_voice_connector_group(input)
      end

      def get_voice_connector_group(input : Types::GetVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the logging configuration settings for the specified Voice Connector. Shows whether SIP
      # message logs are enabled for sending to Amazon CloudWatch Logs.

      def get_voice_connector_logging_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorLoggingConfigurationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_logging_configuration(input)
      end

      def get_voice_connector_logging_configuration(input : Types::GetVoiceConnectorLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the origination settings for the specified Voice Connector.

      def get_voice_connector_origination(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorOriginationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_origination(input)
      end

      def get_voice_connector_origination(input : Types::GetVoiceConnectorOriginationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_ORIGINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the proxy configuration details for the specified Amazon Chime SDK Voice Connector.

      def get_voice_connector_proxy(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorProxyRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_proxy(input)
      end

      def get_voice_connector_proxy(input : Types::GetVoiceConnectorProxyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_PROXY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the streaming configuration details for the specified Amazon Chime SDK Voice Connector.
      # Shows whether media streaming is enabled for sending to Amazon Kinesis. It also shows the retention
      # period, in hours, for the Amazon Kinesis data.

      def get_voice_connector_streaming_configuration(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorStreamingConfigurationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_streaming_configuration(input)
      end

      def get_voice_connector_streaming_configuration(input : Types::GetVoiceConnectorStreamingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_STREAMING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the termination setting details for the specified Voice Connector.

      def get_voice_connector_termination(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorTerminationRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_termination(input)
      end

      def get_voice_connector_termination(input : Types::GetVoiceConnectorTerminationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_TERMINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the last time a SIP OPTIONS ping was received from your SIP
      # infrastructure for the specified Amazon Chime SDK Voice Connector.

      def get_voice_connector_termination_health(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::GetVoiceConnectorTerminationHealthRequest.new(voice_connector_id: voice_connector_id)
        get_voice_connector_termination_health(input)
      end

      def get_voice_connector_termination_health(input : Types::GetVoiceConnectorTerminationHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_CONNECTOR_TERMINATION_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the specified voice profile.

      def get_voice_profile(
        voice_profile_id : String
      ) : Protocol::Request
        input = Types::GetVoiceProfileRequest.new(voice_profile_id: voice_profile_id)
        get_voice_profile(input)
      end

      def get_voice_profile(input : Types::GetVoiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the specified voice profile domain.

      def get_voice_profile_domain(
        voice_profile_domain_id : String
      ) : Protocol::Request
        input = Types::GetVoiceProfileDomainRequest.new(voice_profile_domain_id: voice_profile_domain_id)
        get_voice_profile_domain(input)
      end

      def get_voice_profile_domain(input : Types::GetVoiceProfileDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_PROFILE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a voice tone analysis task.

      def get_voice_tone_analysis_task(
        is_caller : Bool,
        voice_connector_id : String,
        voice_tone_analysis_task_id : String
      ) : Protocol::Request
        input = Types::GetVoiceToneAnalysisTaskRequest.new(is_caller: is_caller, voice_connector_id: voice_connector_id, voice_tone_analysis_task_id: voice_tone_analysis_task_id)
        get_voice_tone_analysis_task(input)
      end

      def get_voice_tone_analysis_task(input : Types::GetVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available AWS Regions in which you can create an Amazon Chime SDK Voice Connector.


      def list_available_voice_connector_regions : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AVAILABLE_VOICE_CONNECTOR_REGIONS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the phone numbers for an administrator's Amazon Chime SDK account.

      def list_phone_number_orders(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumberOrdersRequest.new(max_results: max_results, next_token: next_token)
        list_phone_number_orders(input)
      end

      def list_phone_number_orders(input : Types::ListPhoneNumberOrdersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBER_ORDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the phone numbers for the specified Amazon Chime SDK account, Amazon Chime SDK user, Amazon
      # Chime SDK Voice Connector, or Amazon Chime SDK Voice Connector group.

      def list_phone_numbers(
        filter_name : String? = nil,
        filter_value : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        product_type : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumbersRequest.new(filter_name: filter_name, filter_value: filter_value, max_results: max_results, next_token: next_token, product_type: product_type, status: status)
        list_phone_numbers(input)
      end

      def list_phone_numbers(input : Types::ListPhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the proxy sessions for the specified Amazon Chime SDK Voice Connector.

      def list_proxy_sessions(
        voice_connector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListProxySessionsRequest.new(voice_connector_id: voice_connector_id, max_results: max_results, next_token: next_token, status: status)
        list_proxy_sessions(input)
      end

      def list_proxy_sessions(input : Types::ListProxySessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROXY_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SIP media applications under the administrator's AWS account.

      def list_sip_media_applications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSipMediaApplicationsRequest.new(max_results: max_results, next_token: next_token)
        list_sip_media_applications(input)
      end

      def list_sip_media_applications(input : Types::ListSipMediaApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIP_MEDIA_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SIP rules under the administrator's AWS account.

      def list_sip_rules(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sip_media_application_id : String? = nil
      ) : Protocol::Request
        input = Types::ListSipRulesRequest.new(max_results: max_results, next_token: next_token, sip_media_application_id: sip_media_application_id)
        list_sip_rules(input)
      end

      def list_sip_rules(input : Types::ListSipRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIP_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the countries that you can order phone numbers from.

      def list_supported_phone_number_countries(
        product_type : String
      ) : Protocol::Request
        input = Types::ListSupportedPhoneNumberCountriesRequest.new(product_type: product_type)
        list_supported_phone_number_countries(input)
      end

      def list_supported_phone_number_countries(input : Types::ListSupportedPhoneNumberCountriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUPPORTED_PHONE_NUMBER_COUNTRIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags in a given resource.

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

      # Lists the Amazon Chime SDK Voice Connector groups in the administrator's AWS account.

      def list_voice_connector_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVoiceConnectorGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_voice_connector_groups(input)
      end

      def list_voice_connector_groups(input : Types::ListVoiceConnectorGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOICE_CONNECTOR_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SIP credentials for the specified Amazon Chime SDK Voice Connector.

      def list_voice_connector_termination_credentials(
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::ListVoiceConnectorTerminationCredentialsRequest.new(voice_connector_id: voice_connector_id)
        list_voice_connector_termination_credentials(input)
      end

      def list_voice_connector_termination_credentials(input : Types::ListVoiceConnectorTerminationCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOICE_CONNECTOR_TERMINATION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Chime SDK Voice Connectors in the administrators AWS account.

      def list_voice_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVoiceConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_voice_connectors(input)
      end

      def list_voice_connectors(input : Types::ListVoiceConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOICE_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the specified voice profile domains in the administrator's AWS account.

      def list_voice_profile_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVoiceProfileDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_voice_profile_domains(input)
      end

      def list_voice_profile_domains(input : Types::ListVoiceProfileDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOICE_PROFILE_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the voice profiles in a voice profile domain.

      def list_voice_profiles(
        voice_profile_domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVoiceProfilesRequest.new(voice_profile_domain_id: voice_profile_domain_id, max_results: max_results, next_token: next_token)
        list_voice_profiles(input)
      end

      def list_voice_profiles(input : Types::ListVoiceProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VOICE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Alexa Skill configuration for the SIP media application. Due to changes made by the
      # Amazon Alexa service, this API is no longer available for use. For more information, refer to the
      # Alexa Smart Properties page.

      def put_sip_media_application_alexa_skill_configuration(
        sip_media_application_id : String,
        sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration? = nil
      ) : Protocol::Request
        input = Types::PutSipMediaApplicationAlexaSkillConfigurationRequest.new(sip_media_application_id: sip_media_application_id, sip_media_application_alexa_skill_configuration: sip_media_application_alexa_skill_configuration)
        put_sip_media_application_alexa_skill_configuration(input)
      end

      def put_sip_media_application_alexa_skill_configuration(input : Types::PutSipMediaApplicationAlexaSkillConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SIP_MEDIA_APPLICATION_ALEXA_SKILL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the logging configuration for the specified SIP media application.

      def put_sip_media_application_logging_configuration(
        sip_media_application_id : String,
        sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration? = nil
      ) : Protocol::Request
        input = Types::PutSipMediaApplicationLoggingConfigurationRequest.new(sip_media_application_id: sip_media_application_id, sip_media_application_logging_configuration: sip_media_application_logging_configuration)
        put_sip_media_application_logging_configuration(input)
      end

      def put_sip_media_application_logging_configuration(input : Types::PutSipMediaApplicationLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SIP_MEDIA_APPLICATION_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's emergency calling configuration.

      def put_voice_connector_emergency_calling_configuration(
        emergency_calling_configuration : Types::EmergencyCallingConfiguration,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::PutVoiceConnectorEmergencyCallingConfigurationRequest.new(emergency_calling_configuration: emergency_calling_configuration, voice_connector_id: voice_connector_id)
        put_voice_connector_emergency_calling_configuration(input)
      end

      def put_voice_connector_emergency_calling_configuration(input : Types::PutVoiceConnectorEmergencyCallingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an external systems configuration to a Voice Connector.

      def put_voice_connector_external_systems_configuration(
        voice_connector_id : String,
        contact_center_system_types : Array(String)? = nil,
        session_border_controller_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::PutVoiceConnectorExternalSystemsConfigurationRequest.new(voice_connector_id: voice_connector_id, contact_center_system_types: contact_center_system_types, session_border_controller_types: session_border_controller_types)
        put_voice_connector_external_systems_configuration(input)
      end

      def put_voice_connector_external_systems_configuration(input : Types::PutVoiceConnectorExternalSystemsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's logging configuration.

      def put_voice_connector_logging_configuration(
        logging_configuration : Types::LoggingConfiguration,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::PutVoiceConnectorLoggingConfigurationRequest.new(logging_configuration: logging_configuration, voice_connector_id: voice_connector_id)
        put_voice_connector_logging_configuration(input)
      end

      def put_voice_connector_logging_configuration(input : Types::PutVoiceConnectorLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's origination settings.

      def put_voice_connector_origination(
        origination : Types::Origination,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::PutVoiceConnectorOriginationRequest.new(origination: origination, voice_connector_id: voice_connector_id)
        put_voice_connector_origination(input)
      end

      def put_voice_connector_origination(input : Types::PutVoiceConnectorOriginationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_ORIGINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Puts the specified proxy configuration to the specified Amazon Chime SDK Voice Connector.

      def put_voice_connector_proxy(
        default_session_expiry_minutes : Int32,
        phone_number_pool_countries : Array(String),
        voice_connector_id : String,
        disabled : Bool? = nil,
        fall_back_phone_number : String? = nil
      ) : Protocol::Request
        input = Types::PutVoiceConnectorProxyRequest.new(default_session_expiry_minutes: default_session_expiry_minutes, phone_number_pool_countries: phone_number_pool_countries, voice_connector_id: voice_connector_id, disabled: disabled, fall_back_phone_number: fall_back_phone_number)
        put_voice_connector_proxy(input)
      end

      def put_voice_connector_proxy(input : Types::PutVoiceConnectorProxyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_PROXY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's streaming configuration settings.

      def put_voice_connector_streaming_configuration(
        streaming_configuration : Types::StreamingConfiguration,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::PutVoiceConnectorStreamingConfigurationRequest.new(streaming_configuration: streaming_configuration, voice_connector_id: voice_connector_id)
        put_voice_connector_streaming_configuration(input)
      end

      def put_voice_connector_streaming_configuration(input : Types::PutVoiceConnectorStreamingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_STREAMING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's termination settings.

      def put_voice_connector_termination(
        termination : Types::Termination,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::PutVoiceConnectorTerminationRequest.new(termination: termination, voice_connector_id: voice_connector_id)
        put_voice_connector_termination(input)
      end

      def put_voice_connector_termination(input : Types::PutVoiceConnectorTerminationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_TERMINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Voice Connector's termination credentials.

      def put_voice_connector_termination_credentials(
        voice_connector_id : String,
        credentials : Array(Types::Credential)? = nil
      ) : Protocol::Request
        input = Types::PutVoiceConnectorTerminationCredentialsRequest.new(voice_connector_id: voice_connector_id, credentials: credentials)
        put_voice_connector_termination_credentials(input)
      end

      def put_voice_connector_termination_credentials(input : Types::PutVoiceConnectorTerminationCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VOICE_CONNECTOR_TERMINATION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restores a deleted phone number.

      def restore_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::RestorePhoneNumberRequest.new(phone_number_id: phone_number_id)
        restore_phone_number(input)
      end

      def restore_phone_number(input : Types::RestorePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the provisioned phone numbers in an organization.

      def search_available_phone_numbers(
        area_code : String? = nil,
        city : String? = nil,
        country : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        phone_number_type : String? = nil,
        state : String? = nil,
        toll_free_prefix : String? = nil
      ) : Protocol::Request
        input = Types::SearchAvailablePhoneNumbersRequest.new(area_code: area_code, city: city, country: country, max_results: max_results, next_token: next_token, phone_number_type: phone_number_type, state: state, toll_free_prefix: toll_free_prefix)
        search_available_phone_numbers(input)
      end

      def search_available_phone_numbers(input : Types::SearchAvailablePhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_AVAILABLE_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a speaker search task. Before starting any speaker search tasks, you must provide all notices
      # and obtain all consents from the speaker as required under applicable privacy and biometrics laws,
      # and as required under the AWS service terms for the Amazon Chime SDK.

      def start_speaker_search_task(
        transaction_id : String,
        voice_connector_id : String,
        voice_profile_domain_id : String,
        call_leg : String? = nil,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::StartSpeakerSearchTaskRequest.new(transaction_id: transaction_id, voice_connector_id: voice_connector_id, voice_profile_domain_id: voice_profile_domain_id, call_leg: call_leg, client_request_token: client_request_token)
        start_speaker_search_task(input)
      end

      def start_speaker_search_task(input : Types::StartSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a voice tone analysis task. For more information about voice tone analysis, see Using Amazon
      # Chime SDK voice analytics in the Amazon Chime SDK Developer Guide . Before starting any voice tone
      # analysis tasks, you must provide all notices and obtain all consents from the speaker as required
      # under applicable privacy and biometrics laws, and as required under the AWS service terms for the
      # Amazon Chime SDK.

      def start_voice_tone_analysis_task(
        language_code : String,
        transaction_id : String,
        voice_connector_id : String,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::StartVoiceToneAnalysisTaskRequest.new(language_code: language_code, transaction_id: transaction_id, voice_connector_id: voice_connector_id, client_request_token: client_request_token)
        start_voice_tone_analysis_task(input)
      end

      def start_voice_tone_analysis_task(input : Types::StartVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a speaker search task.

      def stop_speaker_search_task(
        speaker_search_task_id : String,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::StopSpeakerSearchTaskRequest.new(speaker_search_task_id: speaker_search_task_id, voice_connector_id: voice_connector_id)
        stop_speaker_search_task(input)
      end

      def stop_speaker_search_task(input : Types::StopSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a voice tone analysis task.

      def stop_voice_tone_analysis_task(
        voice_connector_id : String,
        voice_tone_analysis_task_id : String
      ) : Protocol::Request
        input = Types::StopVoiceToneAnalysisTaskRequest.new(voice_connector_id: voice_connector_id, voice_tone_analysis_task_id: voice_tone_analysis_task_id)
        stop_voice_tone_analysis_task(input)
      end

      def stop_voice_tone_analysis_task(input : Types::StopVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to the specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a resource.

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

      # Updates global settings for the Amazon Chime SDK Voice Connectors in an AWS account.

      def update_global_settings(
        voice_connector : Types::VoiceConnectorSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalSettingsRequest.new(voice_connector: voice_connector)
        update_global_settings(input)
      end

      def update_global_settings(input : Types::UpdateGlobalSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates phone number details, such as product type, calling name, or phone number name for the
      # specified phone number ID. You can update one phone number detail at a time. For example, you can
      # update either the product type, calling name, or phone number name in one action. For numbers
      # outside the U.S., you must use the Amazon Chime SDK SIP Media Application Dial-In product type.
      # Updates to outbound calling names can take 72 hours to complete. Pending updates to outbound calling
      # names must be complete before you can request another update.

      def update_phone_number(
        phone_number_id : String,
        calling_name : String? = nil,
        name : String? = nil,
        product_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberRequest.new(phone_number_id: phone_number_id, calling_name: calling_name, name: name, product_type: product_type)
        update_phone_number(input)
      end

      def update_phone_number(input : Types::UpdatePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the phone number settings for the administrator's AWS account, such as the default outbound
      # calling name. You can update the default outbound calling name once every seven days. Outbound
      # calling names can take up to 72 hours to update.

      def update_phone_number_settings(
        calling_name : String
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberSettingsRequest.new(calling_name: calling_name)
        update_phone_number_settings(input)
      end

      def update_phone_number_settings(input : Types::UpdatePhoneNumberSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified proxy session details, such as voice or SMS capabilities.

      def update_proxy_session(
        capabilities : Array(String),
        proxy_session_id : String,
        voice_connector_id : String,
        expiry_minutes : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateProxySessionRequest.new(capabilities: capabilities, proxy_session_id: proxy_session_id, voice_connector_id: voice_connector_id, expiry_minutes: expiry_minutes)
        update_proxy_session(input)
      end

      def update_proxy_session(input : Types::UpdateProxySessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROXY_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details of the specified SIP media application.

      def update_sip_media_application(
        sip_media_application_id : String,
        endpoints : Array(Types::SipMediaApplicationEndpoint)? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSipMediaApplicationRequest.new(sip_media_application_id: sip_media_application_id, endpoints: endpoints, name: name)
        update_sip_media_application(input)
      end

      def update_sip_media_application(input : Types::UpdateSipMediaApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SIP_MEDIA_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes the AWS Lambda function associated with the SIP media application and transaction ID in an
      # update request. The Lambda function can then return a new set of actions.

      def update_sip_media_application_call(
        arguments : Hash(String, String),
        sip_media_application_id : String,
        transaction_id : String
      ) : Protocol::Request
        input = Types::UpdateSipMediaApplicationCallRequest.new(arguments: arguments, sip_media_application_id: sip_media_application_id, transaction_id: transaction_id)
        update_sip_media_application_call(input)
      end

      def update_sip_media_application_call(input : Types::UpdateSipMediaApplicationCallRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SIP_MEDIA_APPLICATION_CALL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details of the specified SIP rule.

      def update_sip_rule(
        name : String,
        sip_rule_id : String,
        disabled : Bool? = nil,
        target_applications : Array(Types::SipRuleTargetApplication)? = nil
      ) : Protocol::Request
        input = Types::UpdateSipRuleRequest.new(name: name, sip_rule_id: sip_rule_id, disabled: disabled, target_applications: target_applications)
        update_sip_rule(input)
      end

      def update_sip_rule(input : Types::UpdateSipRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SIP_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details for the specified Amazon Chime SDK Voice Connector.

      def update_voice_connector(
        name : String,
        require_encryption : Bool,
        voice_connector_id : String
      ) : Protocol::Request
        input = Types::UpdateVoiceConnectorRequest.new(name: name, require_encryption: require_encryption, voice_connector_id: voice_connector_id)
        update_voice_connector(input)
      end

      def update_voice_connector(input : Types::UpdateVoiceConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for the specified Amazon Chime SDK Voice Connector group.

      def update_voice_connector_group(
        name : String,
        voice_connector_group_id : String,
        voice_connector_items : Array(Types::VoiceConnectorItem)
      ) : Protocol::Request
        input = Types::UpdateVoiceConnectorGroupRequest.new(name: name, voice_connector_group_id: voice_connector_group_id, voice_connector_items: voice_connector_items)
        update_voice_connector_group(input)
      end

      def update_voice_connector_group(input : Types::UpdateVoiceConnectorGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_CONNECTOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified voice profile’s voice print and refreshes its expiration timestamp. As a
      # condition of using this feature, you acknowledge that the collection, use, storage, and retention of
      # your caller’s biometric identifiers and biometric information (“biometric data”) in the form of a
      # digital voiceprint requires the caller’s informed consent via a written release. Such consent is
      # required under various state laws, including biometrics laws in Illinois, Texas, Washington and
      # other state privacy laws. You must provide a written release to each caller through a process that
      # clearly reflects each caller’s informed consent before using Amazon Chime SDK Voice Insights
      # service, as required under the terms of your agreement with AWS governing your use of the service.

      def update_voice_profile(
        speaker_search_task_id : String,
        voice_profile_id : String
      ) : Protocol::Request
        input = Types::UpdateVoiceProfileRequest.new(speaker_search_task_id: speaker_search_task_id, voice_profile_id: voice_profile_id)
        update_voice_profile(input)
      end

      def update_voice_profile(input : Types::UpdateVoiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for the specified voice profile domain.

      def update_voice_profile_domain(
        voice_profile_domain_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVoiceProfileDomainRequest.new(voice_profile_domain_id: voice_profile_domain_id, description: description, name: name)
        update_voice_profile_domain(input)
      end

      def update_voice_profile_domain(input : Types::UpdateVoiceProfileDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VOICE_PROFILE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates an address to be used for 911 calls made with Amazon Chime SDK Voice Connectors. You can
      # use validated addresses in a Presence Information Data Format Location Object file that you include
      # in SIP requests. That helps ensure that addresses are routed to the appropriate Public Safety
      # Answering Point.

      def validate_e911_address(
        aws_account_id : String,
        city : String,
        country : String,
        postal_code : String,
        state : String,
        street_info : String,
        street_number : String
      ) : Protocol::Request
        input = Types::ValidateE911AddressRequest.new(aws_account_id: aws_account_id, city: city, country: country, postal_code: postal_code, state: state, street_info: street_info, street_number: street_number)
        validate_e911_address(input)
      end

      def validate_e911_address(input : Types::ValidateE911AddressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_E911_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
